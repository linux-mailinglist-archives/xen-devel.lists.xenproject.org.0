Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C71E478EB5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 15:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248715.429014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEgp-0000Wb-Ud; Fri, 17 Dec 2021 14:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248715.429014; Fri, 17 Dec 2021 14:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEgp-0000UK-Rb; Fri, 17 Dec 2021 14:58:31 +0000
Received: by outflank-mailman (input) for mailman id 248715;
 Fri, 17 Dec 2021 14:58:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZwG=RC=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1myEgn-0000UE-Og
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 14:58:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca895d27-5f49-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 15:58:28 +0100 (CET)
Received: from AS9PR06CA0156.eurprd06.prod.outlook.com (2603:10a6:20b:45c::13)
 by DBBPR08MB4856.eurprd08.prod.outlook.com (2603:10a6:10:f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Fri, 17 Dec
 2021 14:58:24 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::f3) by AS9PR06CA0156.outlook.office365.com
 (2603:10a6:20b:45c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Fri, 17 Dec 2021 14:58:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 14:58:24 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Fri, 17 Dec 2021 14:58:23 +0000
Received: from fa00f089c449.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33AB29AA-D6AD-4912-8FB0-51C7224D9DE7.1; 
 Fri, 17 Dec 2021 14:58:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa00f089c449.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Dec 2021 14:58:12 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4966.eurprd08.prod.outlook.com (2603:10a6:20b:d4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 14:58:10 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e%9]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 14:58:10 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ca895d27-5f49-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9H+v4v13vyVx3PBnO9+FeLGyfSE/g37ryQFf6eq9rw=;
 b=AaeyIHAY3n/c52degxyXTcNbIabESleddNrHOI2+FCcb0GKNC2VFWCfloXrQSwYTwnsahFv49cshqmf9n3oUuReTYt2gGMCLx2rV6AsL3+2IbDfGg1IqmtCevLgZhLS3Tl6XVWh7dA02IVAJO5qDvWEluAL+aPSq/zrXWJhvxiA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: db78547aade3ac43
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+kYfuWtKHXt1yHSVE5VePQVR4o2XZn8NlZwvepYZeHq+kk6N/HgWdIrNcgVGsJq5KryAAMPQsKN7I6fXsQwsTvmedYf6uJVsapF5I11jIBQZjUWsoYGruPked5v5PUFFTa/A7qV/+sSbrGHIqtoSw7t8wmjrEUguWYYsB+MZuTSCX4Gd3Hs1gdtfNHB8ysogV0g1zX8S6HxK1oQBHysBqbnFvu2vNY3dCTkHCChWcD7Zm6mkPuF7HbgYwuahxv+T5mCM5Hkk8Bt11QEN5y1gIjXxZ1m1vzVfiHFMWj4jw1AlNH6xTw1f0Srfj48D+i3os2K/Ak9606N4+KE2PmdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9H+v4v13vyVx3PBnO9+FeLGyfSE/g37ryQFf6eq9rw=;
 b=Y8d87kG1n7L2vjEViINafvAf2iN56SEA1BGF2N8GoTmdJYDlrBatnGT/uoEPS2+K1yB4mlyDydPfUiBYvuY4hO0TE/kJg01whTRmyJ8PgVfG8/ymS/kuFnCnNejgApRFNzs3pw18IUcX7FpX9vgJCe1UwaAvDBqglfMrjhRRs9O1JsBN4gDLOU1QNdwxj/MKrq4Yv/0YVBrZwqvdijXhFZAikMvTqRXekxFpCWfjIavmxi1Yc/0ZHayhDDMUdTkByU8YT9aW9P6ENLc7PMdffqTvDzG2cRR0O/3DedW97W49Q0wVA7+zQdfhBZPLfPqD+T5pK83Dx9/ilZ/Y4pxlhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9H+v4v13vyVx3PBnO9+FeLGyfSE/g37ryQFf6eq9rw=;
 b=AaeyIHAY3n/c52degxyXTcNbIabESleddNrHOI2+FCcb0GKNC2VFWCfloXrQSwYTwnsahFv49cshqmf9n3oUuReTYt2gGMCLx2rV6AsL3+2IbDfGg1IqmtCevLgZhLS3Tl6XVWh7dA02IVAJO5qDvWEluAL+aPSq/zrXWJhvxiA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Thread-Topic: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Thread-Index:
 AQHX8NfN625eD/1es0eaHkpOvTmQ3Kwx7OWAgAL9+QCAAAwcgIAAK1kAgAGhwICAAAc/gA==
Date: Fri, 17 Dec 2021 14:58:10 +0000
Message-ID: <F52E11FE-2AE5-423C-879E-B6BFFF348C91@arm.com>
References:
 <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
 <YbiP7YlpY22llB5Y@Air-de-Roger>
 <621259B5-E5EB-4ED9-A836-B6E17C0D6E36@arm.com>
 <YbscoZG/NRP6lMof@Air-de-Roger>
 <b3488523-489e-abb7-59f1-74c86e842060@suse.com>
 <5270d46a-a1ce-e361-dfeb-54408e9ba6f0@xen.org>
In-Reply-To: <5270d46a-a1ce-e361-dfeb-54408e9ba6f0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1855d596-d2ae-490b-b5ff-08d9c16dacb1
x-ms-traffictypediagnostic:
	AM6PR08MB4966:EE_|VE1EUR03FT013:EE_|DBBPR08MB4856:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB48560CF3661CFEF026690925FC789@DBBPR08MB4856.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SH/57zHlSBphpkxoqkfNX3vDV4i5bjaezeN6Oxe6giO14uokCUJhJpelytieg6+IoBcYUfS1gqusvdJwjM1DEEeHY6SC9jNuKYCsTFN4O6s3iUtVhcbuRXcaGt/8YVBWfLv5REiclSojheFDve4HCo8pYOEQ3KAJE3hjE2c24pFjnStjetuz2dx8kKjUAeyTY2qWSbV49PhC4VImj0eZVNyNdWuOl7LHadMqMfZdklIZEdvEWuS3zsz7VeSREThcrhAatW8OCbRcLYWbUeLT1//LeU8CjrQrNpnBHW7VHgRyLOKEXeXqnPER2rGCAFZwxTs+0kvOysJB2oaDS6Y9N0c+4T+xCeHKCmKe1o67QqBSTPFT2FzUOIsldeLW1AMj//pO5rKcn6dr666+HUk6sSO/n93YCMRotrE71tUnCAs2ZQ+Xvov4fBFXEHpcUOuhNwb7pK3pu5r5czBMnWDjcnX4PzrjmWjvJxXymeTlOh4yleI6j4ImXgQX1XEn/SmtnHOdwV/00IdxaCgBC+jG7hHht0dFDirxVw0/X/2u0MT8LDa2/kA7AlWk32OyGcsaDaQG36jrQL5yHY2IQVzl71btrOfCrtSalQUm5brnWMPXmE8czyAhvTcPznkarziJPLPKLPWKEEpClUZs4VrqLieGvCm9zcd+W1YgE2PADVbq7r0GmrYMy/4DzlL6RRROVBHu+UmF431sa05UDdf+mH3G+yHSgEhYhMCeyJC3yE+iT7CLIPC5riLNu3wGwB3C
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(53546011)(71200400001)(6512007)(6916009)(26005)(6506007)(64756008)(8936002)(186003)(66446008)(2616005)(38070700005)(54906003)(5660300002)(2906002)(83380400001)(8676002)(508600001)(76116006)(66946007)(66476007)(91956017)(66556008)(86362001)(122000001)(316002)(38100700002)(33656002)(36756003)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCC1383811B4A6499C4F9661055AB9DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4966
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	73f80da3-dece-45e3-4041-08d9c16da44e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1tfWHVCteabuiONCv5Djk6zgfTEXmLsx2ITYUrEEJKDrejm99RCDOttPxOR1aAfMAJWaKCOMT5xJJnnHTVfZ0xSNGPof1xYE5b2zM89yL76amlSeIg7NLW6t0OO20By29zDkFBhFTZa3p4KSu2VowP1lX84OVglNSEb4goA6/9ko8+mFmP/chlDeE7pFU1YhdU7NPsL8MGmH8wfyK9SWOMry2Gc0qtyzS21EaHnthV/b+sByLnfTMvgUIBiognkQrPhmQrZku29vcpwhklxqAWrx71zE7wgKmkqZehepq9YK1YtvoVQSPcfCThCahkeEhQ4lzf2eAk8iGKrptLylVxdkervse43kh6ihZ22KIvzjSyVrd5YFtgTzzTxLSl+y1vYNMi7UVjeDXxMJEJNJMH8sGAui0RmqqYfVT0tg2+fdoz4Pkx+5n2zMhmhHelE9o0GiFyK2S1MeaiiBQbgtF94oHF5u6ehQpSTUGynTr/82+pqH5SgA9PLeyBiQ2f0VkjnLxvwJ98x/pv3o/VnEnwJeTzo1c3TD/4VuyhQ2ibhUeLLt7hu7M+dVo7p/OVz4aTV5gwsGqZdsGUV62PxsFso9bO0H01zZk1t9T35YeDwToU8LcyUI8DlKihEPcYszq2IdAn0XX2CGh7UzqEltx86kWdU0XUBUA5y6sDOGU2v7E568GRe8iSbGYAykmYOSctBpdQXjEbatdmdwohC6y03Qk2VLiIRPmBrmCn3+ByubVu/7u+ihuP4gF2P9gOOtO/A+hRN58fJKM28cjuWbLg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(40460700001)(6512007)(2616005)(6506007)(33656002)(336012)(107886003)(508600001)(83380400001)(186003)(6862004)(82310400004)(26005)(36860700001)(70206006)(6486002)(47076005)(54906003)(36756003)(356005)(5660300002)(53546011)(316002)(4326008)(2906002)(8676002)(8936002)(81166007)(70586007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 14:58:24.1431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1855d596-d2ae-490b-b5ff-08d9c16dacb1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4856

SGkgSnVsaWVuDQoNCj4gT24gMTcgRGVjIDIwMjEsIGF0IDI6MzIgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSmFuLA0KPiANCj4gT24gMTYvMTIvMjAy
MSAxMzozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNi4xMi4yMDIxIDEyOjAxLCBSb2dl
ciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIFRodSwgRGVjIDE2LCAyMDIxIGF0IDEwOjE4OjMy
QU0gKzAwMDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+PiBIaSBSb2dlciwNCj4+Pj4gDQo+Pj4+
IFRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBjb2RlLg0KPj4+PiANCj4+Pj4+IE9uIDE0IERlYyAy
MDIxLCBhdCAxMjozNyBwbSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBPbiBUdWUsIERlYyAxNCwgMjAyMSBhdCAxMDo0NToxN0FN
ICswMDAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+PiArICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nICpkYXRhKQ0KPj4+Pj4+IHsNCj4+Pj4+PiAtICAgIGNvbnN0IHN0cnVjdCBkb21haW4g
KmQgPSB2LT5kb21haW47DQo+Pj4+Pj4gLSAgICBzdHJ1Y3QgdnBjaV9tc2l4ICptc2l4ID0gbXNp
eF9maW5kKGQsIGFkZHIpOw0KPj4+Pj4+ICAgICBjb25zdCBzdHJ1Y3QgdnBjaV9tc2l4X2VudHJ5
ICplbnRyeTsNCj4+Pj4+PiAgICAgdW5zaWduZWQgaW50IG9mZnNldDsNCj4+Pj4+PiANCj4+Pj4+
PiAgICAgKmRhdGEgPSB+MHVsOw0KPj4+Pj4+IA0KPj4+Pj4+ICAgICBpZiAoICFtc2l4ICkNCj4+
Pj4+PiAtICAgICAgICByZXR1cm4gWDg2RU1VTF9SRVRSWTsNCj4+Pj4+PiArICAgICAgICByZXR1
cm4gVlBDSV9FTVVMX1JFVFJZOw0KPj4+Pj4+IA0KPj4+Pj4+ICAgICBpZiAoICFhY2Nlc3NfYWxs
b3dlZChtc2l4LT5wZGV2LCBhZGRyLCBsZW4pICkNCj4+Pj4+PiAtICAgICAgICByZXR1cm4gWDg2
RU1VTF9PS0FZOw0KPj4+Pj4+ICsgICAgICAgIHJldHVybiBWUENJX0VNVUxfT0tBWTsNCj4+Pj4+
PiANCj4+Pj4+PiAgICAgaWYgKCBWTVNJWF9BRERSX0lOX1JBTkdFKGFkZHIsIG1zaXgtPnBkZXYt
PnZwY2ksIFZQQ0lfTVNJWF9QQkEpICkNCj4+Pj4+PiAgICAgew0KPj4+Pj4+IEBAIC0yMTAsMTEg
KzE5NCwxMSBAQCBzdGF0aWMgaW50IG1zaXhfcmVhZChzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQg
bG9uZyBhZGRyLCB1bnNpZ25lZCBpbnQgbGVuLA0KPj4+Pj4+ICAgICAgICAgc3dpdGNoICggbGVu
ICkNCj4+Pj4+PiAgICAgICAgIHsNCj4+Pj4+PiAgICAgICAgIGNhc2UgNDoNCj4+Pj4+PiAtICAg
ICAgICAgICAgKmRhdGEgPSByZWFkbChhZGRyKTsNCj4+Pj4+PiArICAgICAgICAgICAgKmRhdGEg
PSB2cGNpX2FyY2hfcmVhZGwoYWRkcik7DQo+Pj4+PiANCj4+Pj4+IFdoeSBkbyB5b3UgbmVlZCBh
IHZwY2kgd3JhcHBlciBhcm91bmQgdGhlIHJlYWQvd3JpdGUgaGFuZGxlcnM/IEFGQUlDVA0KPj4+
Pj4gYXJtNjQgYWxzbyBoYXMge3JlYWQsd3JpdGV9e2wscX0uIEFuZCB5b3UgbGlrZWx5IHdhbnQg
dG8gcHJvdGVjdCB0aGUNCj4+Pj4+IDY0Yml0IHJlYWQgd2l0aCBDT05GSUdfNjRCSVQgaWYgdGhp
cyBjb2RlIGlzIHRvIGJlIG1hZGUgYXZhaWxhYmxlIHRvDQo+Pj4+PiBhcm0zMi4NCj4+Pj4gDQo+
Pj4+IEkgbmVlZCB0aGUgd3JhcHBlciBiZWNhdXNlIHtyZWFkLHdyaXRlfXtsLHF9IGZ1bmN0aW9u
IGFyZ3VtZW50IGlzIGRpZmZlcmVudCBmb3IgQVJNIGFuZCB4ODYuDQo+Pj4+IEFSTSB7cmVhZCx3
cmllfShsLHF9ICBmdW5jdGlvbiBhcmd1bWVudCBpcyBwb2ludGVyIHRvIHRoZSBhZGRyZXNzIHdo
ZXJlYXMgWDg2ICB7cmVhZCx3cmllfShsLHF9DQo+Pj4+IGZ1bmN0aW9uIGFyZ3VtZW50IGlzIGFk
ZHJlc3MgaXRzZWxmLg0KPj4+IA0KPj4+IE9oLCB0aGF0J3MgYSBzaGFtZS4gSSBkb24ndCB0aGlu
ayB0aGVyZSdzIGEgbmVlZCB0byB0YWcgdGhvc2UgaGVscGVycw0KPj4+IHdpdGggdGhlIHZwY2lf
IHByZWZpeCB0aG91Z2guIENvdWxkIHdlIG1heWJlIGludHJvZHVjZQ0KPj4+IGJ1c197cmVhZCx3
cml0ZX17Yix3LGwscX0gaGVscGVycyB0aGF0IHRha2UgdGhlIHNhbWUgcGFyYW1ldGVycyBvbiBh
bGwNCj4+PiBhcmNoZXM/DQo+Pj4gDQo+Pj4gSXQgd291bGQgYmUgZXZlbiBiZXR0ZXIgdG8gZml4
IHRoZSBjdXJyZW50IG9uZXMgc28gdGhleSB0YWtlIHRoZSBzYW1lDQo+Pj4gcGFyYW1ldGVycyBv
biB4ODYgYW5kIEFybSwgYnV0IHRoYXQgd291bGQgbWVhbiBjaGFuZ2luZyBhbGwgdGhlIGNhbGwN
Cj4+PiBwbGFjZXMgaW4gb25lIG9mIHRoZSBhcmNoZXMuDQo+PiBZZXQgc3RpbGw6ICsxIGZvciBy
ZW1vdmluZyB0aGUgZXh0cmEgbGV2ZWwgb2YgaW5kaXJlY3Rpb24uIEltbyB0aGVzZQ0KPj4gdHJp
dmlhbCBoZWxwZXJzIHNob3VsZCBuZXZlciBoYXZlIGRpdmVyZ2VkIGJldHdlZW4gYXJjaGVzOyBJ
IGhhdmUNCj4+IGFsd2F5cyBiZWVuIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgb24gTGludXgg
dGhleSBjYW4gYmUgdXNlZCBieQ0KPj4gYXJjaC1pbmRlcGVuZGVudCBjb2RlIChvciBlbHNlIGRy
aXZlcnMgd291bGQgYmUgcXVpdGUgaGFyZCB0byB3cml0ZSkuDQo+IA0KPiBTbyB0ZWNobmljYWxs
eSBib3RoIGhlbHBlcnMgYXJlIGFibGUgdG8gY29wZSB3aXRoIHBvaW50ZXIuIFRoZSB4ODYgb25l
IGlzIGFsc28gYWxsb3dpbmcgdG8gcGFzcyBhbiBhZGRyZXNzLg0KPiANCj4gRnJvbSBhIGJyaWVm
IGxvb2sgYXQgdGhlIHg4NiwgaXQgbG9va3MgbGlrZSBtb3N0IG9mIHRoZSB1c2VycyBhcmUgdXNp
bmcgYSBwb2ludGVyLiBIb3dldmVyLCB0aGUgdlBDSSBtc2l4IGNvZGUgaXMgb25lIGV4YW1wbGUg
d2hlcmUgYWRkcmVzc2VzIGFyZSBwYXNzZWQuDQoNClllcyB5b3UgYXJlIHJpZ2h0Lg0KPiANCj4g
QUZBSUNULCB0aGUgcmVhZCovd3JpdGUqIGhlbHBlcnMgb24gTGludXggb25seSB3b3JrcyB3aXRo
IHBvaW50ZXJzLiBTbyBJIHRoaW5rIHRoZSBhY3Rpb25zIHNob3VsZCBiZToNCj4gICAxKSBNb2Rp
ZnkgdGhlIHZQQ0kgTVNJeCBjb2RlIHRvIHVzZSBwb2ludGVyDQoNCkkgYW0gYWxzbyB0aGlua2lu
ZyB0byBjaGFuZ2UgdGhlIG1pc3hfcmVhZC93cml0ZSB0byB1c2UgYSBwb2ludGVyIHRvIGFkZHJl
c3MgdG8gYXZvaWQgY2hhbmdlIGluIHtyZWFkLHdyaXRlfXtiLHcsbCxxfQ0KSWYgZXZlcnlvbmUg
aXMgb2sgSSB3aWxsIHNlbmQgdGhlIG5leHQgdmVyc2lvbiB0byBtb2RpZnkgdGhlIHNhbWUuDQoN
ClJlZ2FyZHMsDQpSYWh1bA0KPiAgIDIpIE1vZGlmeSB0aGUgeDg2IHJlYWQqL3dyaXRlKiBoZWxw
ZXJzIHRvIGZvcmJpZCBhbnkgYWNjZXNzIG90aGVyIHRoYW4gcG9pbnRlci4NCj4gDQo+IENoZWVy
cywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K


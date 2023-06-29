Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E27428AC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556860.869693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsqO-0008OE-Lu; Thu, 29 Jun 2023 14:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556860.869693; Thu, 29 Jun 2023 14:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsqO-0008LZ-J1; Thu, 29 Jun 2023 14:42:00 +0000
Received: by outflank-mailman (input) for mailman id 556860;
 Thu, 29 Jun 2023 14:41:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOj0=CR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qEsqN-0008LT-7G
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:41:59 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe13::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1811ab5a-168b-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 16:41:56 +0200 (CEST)
Received: from DUZP191CA0033.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::29)
 by DB9PR08MB6618.eurprd08.prod.outlook.com (2603:10a6:10:263::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 14:41:48 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f8:cafe::ba) by DUZP191CA0033.outlook.office365.com
 (2603:10a6:10:4f8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Thu, 29 Jun 2023 14:41:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.22 via Frontend Transport; Thu, 29 Jun 2023 14:41:48 +0000
Received: ("Tessian outbound c08fa2e31830:v142");
 Thu, 29 Jun 2023 14:41:48 +0000
Received: from df0ddd908ffe.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 539BB292-8AA1-42A2-9253-58BFDDB76D17.1; 
 Thu, 29 Jun 2023 14:41:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df0ddd908ffe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Jun 2023 14:41:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8875.eurprd08.prod.outlook.com (2603:10a6:20b:5b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 14:41:36 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 14:41:36 +0000
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
X-Inumbo-ID: 1811ab5a-168b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBaIWQRoF1ceVdV/20efyPwXqZt64SKR4raOmqcPsM0=;
 b=18NEI8YFD3R4SUCC/i5/8ZUR+wohfYAlAUkXZ0HbIzAGcTp6aY0tAgqtpQKF0tY39UNyKeHU+5BAASgPgE+MQD3bct/SgfYYIgg/kkWkWl5/wj3wOx+qzCXNlWL0FEXpaYrgX3NT4+/N/sS0qpUY/ooj6JHXXQGnbB5W0DzKBLs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6df6ecade10a532a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LX6BjXNBx5BhzNJ2YSBR1upA8Tcn+R5s+ezPv9eI9UBDyT4iPz2NS700PHEGnWXvGqreR8t4t2d2XjV4JDiSnbLf8PFt8tB5/InTTFl8hCi6p0BPWf3YX1W9C4zlm5BiQfuaolS5vjAeT44MRtVljf5wLmtN2A8n6fC6qlZI+Z1fId4vcMkQE0pxrWoroxHfS38mAkYWbHvLfuWa7Sdoq/dmUtAtkXVxZSxtYBcdQAprcJbTKQRj52ZTX2lB6FtNRwDCz7CblHDweHKfM+9jO6lb55hoaQggbWoqMiiO82KZc2covKOzuNLMKoilKMTPHyCPZg9tx5G39EygF9+RAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBaIWQRoF1ceVdV/20efyPwXqZt64SKR4raOmqcPsM0=;
 b=OFFtTAT16E4aWYEW3h9XpbXCAOsN8Yd28+ZfPCHeHiWnq8ppSPrRMASmfs4cr7b5SCzaILTSPEBK4ZixayoxniHAzSt0BsSloo2MIvKlyVX3Hq080tASdbXy4sojYr0WvCStobyvmeZVjLbdTj5Lc81EJ2O9QH/f1q6I8Sj5uulXjyJB6480Vv4UwOvbfU2mDw3JFswr3emfBclCJ5qm5FOSeuGT8DPivaVZBC4oaQArf8RMtXMZgduWPV7MbT4TlCYNxpXKzZfp75P21O89pJ+GXZ2tOAJhJX/I6pW7/LjO16cR3xJ3q9yIJSXf83yp5U/b2FQDxehq+5zbj/HOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBaIWQRoF1ceVdV/20efyPwXqZt64SKR4raOmqcPsM0=;
 b=18NEI8YFD3R4SUCC/i5/8ZUR+wohfYAlAUkXZ0HbIzAGcTp6aY0tAgqtpQKF0tY39UNyKeHU+5BAASgPgE+MQD3bct/SgfYYIgg/kkWkWl5/wj3wOx+qzCXNlWL0FEXpaYrgX3NT4+/N/sS0qpUY/ooj6JHXXQGnbB5W0DzKBLs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "julien@xen.org" <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 1/3] xen/arch/arm: fix violations of MISRA C:2012
 Rule 3.1
Thread-Topic: [XEN PATCH v3 1/3] xen/arch/arm: fix violations of MISRA C:2012
 Rule 3.1
Thread-Index: AQHZqnGGC/1ABJScNUiVVSDKy4Xa0K+h2qmA
Date: Thu, 29 Jun 2023 14:41:34 +0000
Message-ID: <5FD86C4C-3BD6-4ED3-A910-683DCC86613D@arm.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <7996a8bb62e62076d48bdf289e37352bb5e43b52.1688032865.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <7996a8bb62e62076d48bdf289e37352bb5e43b52.1688032865.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8875:EE_|DBAEUR03FT016:EE_|DB9PR08MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 081a3b54-25b4-41aa-969d-08db78aef7ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8E9qR2IUbMWTtlLSJQMgWPEka7hDORZhNBU+aeGhIu9+GsUdjGP99Zsc34yyCHvonlrq9uDqg+7sCsT7zVO49Edpb0DWeuhvZe5vFRqGnDZ1u47LSiEkwYqFR/uKCd/VgK9KzCSl69GQSVgFWRoW5IjlLyZ8lDQlvFuw8tyxZwPS1IVnPoT1yg9Z2oQZqMZj5JX8QBWl7WzoHP6JXCx3oEr1X6G6Hfw8VsHIDNIsnkwCV0IXm9GdAeZcmYFoZ6TIS0ETswvVv8a4RW+2EI0GAp7FjOq2hdvwySRg1z6ama+8BXqYOj1dgpKTKHfD9O10p5JxwVs+EOqmiJrerjlg1crNnvJUmH+sXVe4oD1h7BA46NoHHKzM8i4i5OrBBcKdnbk4vdRNaQE9szVB/ZZoVKH4BC54XvqXhBQm2KFSD57qlCv+ZSoZubs+ilcZ2q2DYSSZE4vwCrRxlm1lOvSxs9EvcdSwVL/KAtoyF+AMPtjX0gs3SEgZxFmns1SwgGK/b/STaI+SpezuMPB0hFq9PecKcdxf5g+BnMcSgDC0UnXGuPMKB4P/tljLChYQWH1wjwlbxWDnB+evV4DscA5NFBPTEOAgSW1KHtdprOUN609XtMxb09KRGEMdX9i0P7pvQ29eshW+FKQhPUEwnClrSQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199021)(76116006)(6486002)(71200400001)(478600001)(91956017)(54906003)(53546011)(41300700001)(6512007)(6506007)(4326008)(186003)(26005)(66476007)(4744005)(64756008)(38100700002)(5660300002)(8676002)(6916009)(8936002)(66446008)(2906002)(66556008)(316002)(66946007)(7416002)(122000001)(86362001)(33656002)(36756003)(38070700005)(2616005)(83380400001)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F91891B284107488EB201441349180F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8875
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	704e6b8d-9a76-49c3-464d-08db78aeefa9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TPvv2oO14TLVl3VNIg0rs5qCAaarnPhazJRXvZdw+IuXMBPIpYf/O8QPWNEHSbd1I+qOJBQ++ehvv2Z6h6FAp+i/FVWM3r81P6amGSBGXiEF2aI72lXdLiOYRH+w0EPINJPhBRl+X1MnayNHhFg7ZvkyWq22RzC6J9PfWPACS5Bg4cj2sdTN8fPaX4pickRScemqqmzmpX5aX01WvunWLkjhF4inWG+O6++WCDDV5ArgrXWykIRPtanh6dBnjac+unUGk7MGWeqJ12zsClUvIZWdf3biXFoqNuuDL1fYanwovuOiP9koDDfLX7p9u5OVVt55ZQjIcIMxV3Ws+zJ+XDG7sQFxzyh62Dpg3iSWfc26PSXy1RMZLUMwmaCj7max9bkHy+5YAHZKTlN72N/5IxGdzlF2nIrMTAK8EtIUntkF78dKdIVH6VYryBwEuBzQixtox4/dfeIxxxNd+1lqFGabce2rAWmzHI85Z7LtZ2Tn2B2axz7prV9czSiFb+y56pCZO9L/D5Xjxcp+kgzoBRejEPHHSL+qGoLJDfGAWJFxGgb7WO2fRRLo8fXkJ0qESNbEL+OWlRFXiBw4EPI049wSn72SH8+Am6G/tuVSonFUZRqhpicvrOyiPoGd4NGBob8D6Qssx8HTzD2inGfG2RR8INTDIq1bBG6ghNAPTMVANv9i/f6p4ZYg++r2ujWzHblQFIBCDdhY++Fbx7Z0P9f0mKdmFqNKA0mr1e6s4LgNYAc+vWKA9pDc+09oYC5i
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(107886003)(8676002)(41300700001)(70206006)(316002)(8936002)(6506007)(26005)(186003)(6512007)(336012)(53546011)(4744005)(54906003)(478600001)(4326008)(2616005)(6486002)(70586007)(40460700003)(66899021)(82310400005)(2906002)(5660300002)(40480700001)(6862004)(356005)(81166007)(82740400003)(33656002)(36756003)(36860700001)(86362001)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:41:48.2177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 081a3b54-25b4-41aa-969d-08db78aef7ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6618

DQoNCj4gT24gMjkgSnVuIDIwMjMsIGF0IDExOjA2LCBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZl
dHJpbmlAYnVnc2VuZy5jb20+IHdyb3RlOg0KPiANCj4gSW4gdGhlIGZpbGVzIGB4ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vYXJtKDMyfDY0KS9mbHVzaHRsYi5oJyB0aGVyZSBhcmUgYQ0KPiBmZXcg
b2NjdXJyZW5jZXMgb2YgbmVzdGVkICcvLycgY2hhcmFjdGVyIHNlcXVlbmNlcyBpbnNpZGUgQy1z
dHlsZSBjb21tZW50DQo+IGJsb2Nrcywgd2hpY2ggdmlvbGF0ZSBSdWxlIDMuMS4gVGhlIHBhdGNo
IGFpbXMgdG8gcmVzb2x2ZSB0aG9zZSBieSBjaGFuZ2luZw0KPiB0aGUgaW5uZXIgY29tbWVudHMg
dG8gYXJtIGFzbSBjb21tZW50cywgZGVsaW1pdGVkIGJ5ICc7JyBpbnN0ZWFkLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTmljb2xhIFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1Z3NlbmcuY29tPg0K
DQpDYW4gSSBzdWdnZXN0IGFub3RoZXIgY29tbWl0IHRpdGxlOg0K4oCceGVuL2FybTogdGxiZmx1
c2g6IGZpeCB2aW9sYXRpb25zIG9mIE1JU1JBIEM6MjAxMiBSdWxlIDMuMSINCg0KU29tZXRpbWVz
IHdoZW4gSSBhbSBub3Qgc3VyZSBvbiBob3cgdG8gZGVhbCB3aXRoIHByZWZpeGVzLCBJIGNoZWNr
IHRvIHRoZSBnaXQNCmhpc3Rvcnkgb2YgdGhlIGxpbmUgSSBhbSBjaGFuZ2luZywgZm9yIHRoZXNl
IGxpbmVzIHRoZXJlIHdhcyBhIGNvbW1pdCBmcm9tDQpKdWxpZW4gdXNpbmcgdGhlc2UgcHJlZml4
ZXMuIEnigJltIHVzaW5nIHZzIGNvZGUgd2l0aCBHaXRMZW5zIGV4dGVuc2lvbiwgdGhhdA0KZWFz
ZSBhIGxvdCB0aGlzIGtpbmQgb2YgY2hlY2tzLg0KDQpBcGFydCBmcm9tIHRoYXQsIHRoZSBjaGFu
Z2VzIGxvb2tzIGdvb2QgdG8gbWU6DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNh
LmZhbmNlbGx1QGFybS5jb20+DQoNCg==


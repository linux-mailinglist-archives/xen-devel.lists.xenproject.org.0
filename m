Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B93709408
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536890.835624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwj8-0008Gl-VH; Fri, 19 May 2023 09:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536890.835624; Fri, 19 May 2023 09:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwj8-0008E1-Rd; Fri, 19 May 2023 09:48:46 +0000
Received: by outflank-mailman (input) for mailman id 536890;
 Fri, 19 May 2023 09:48:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pzwj7-0008Dt-C9
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:48:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57cf9d14-f62a-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 11:48:44 +0200 (CEST)
Received: from DB8PR06CA0046.eurprd06.prod.outlook.com (2603:10a6:10:120::20)
 by DU2PR08MB10186.eurprd08.prod.outlook.com (2603:10a6:10:46c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 09:48:38 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::2f) by DB8PR06CA0046.outlook.office365.com
 (2603:10a6:10:120::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 09:48:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.7 via Frontend Transport; Fri, 19 May 2023 09:48:37 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Fri, 19 May 2023 09:48:37 +0000
Received: from 438853850870.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E59D5B5-2E83-4C41-9A49-D57BC1E61E46.1; 
 Fri, 19 May 2023 09:48:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 438853850870.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 May 2023 09:48:27 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8208.eurprd08.prod.outlook.com (2603:10a6:10:3b1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 09:48:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 09:48:23 +0000
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
X-Inumbo-ID: 57cf9d14-f62a-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdBCT2ALX5Wxv5EZGQ6wrQqEMqsMT1tYY2k01sLMPS0=;
 b=8HHmubthp8xQw5hulC4LH4Eiz/RN+JCMVg+HEVEO8y+TokYFFT6qrrKlZsHmgvIfyeqMSPaECgqcSb+HmxSTEcOk1N/rZ8Rkm+g8IAVRRto6I0KDIkJ8Va0AvPTrx8we7ZECV84AQfcpMemi84/rMOToLNRQayH9Yob8yyde3AA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d4045b0b297e259
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N64MGL6x8aWxkr47NOizVmqrR0LVrncssg3Aog02CtgEIyA60EW0hRWa8Qb8IM0nMYe849pDAENkUdPWM/Be4j2g4ObeBAE0Dp5PTZX3PlXEJ/WTk/Eqv2AF2g+O9VKDgtCPc/n6Ka1MilAKkMxJsaM11VH3TkITolCTDfWGAHE+BGf9IWE+z20AYj6WYqhB9oPxR6mlAUoWBJytqcUz3EpQzNtXEoOgCxmiDyqjBqVr63Xa+mGNetNF6ID11gv62EnMLje/RYUck0Rsnkl6Y0a5r0ymrFrccOkSbhBp74D75SGvoqF/uKjRYpQsdeIzf0BKZWZLP6cD3lx9HlVUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdBCT2ALX5Wxv5EZGQ6wrQqEMqsMT1tYY2k01sLMPS0=;
 b=DDBD5I/IbYqAGMuEtSlUoOBu9GemtXFdyZVCcR24Vt3GpiW/e1zFyxM+3oCh8fUtHHGMBVnlCtvHOzx6md+o2w7OcxnoftqsXIqRZSUomAOgxOoH0+CTlftRcsPmp1JAkEpq1VMhwNk6MX78z3DWH6efb7Ni7wyiVKdlxWDqCLNqdmnhLdFQSE/3pTHjlPzysTX498uCiaxQ+N9UhcSfWnt/i/ofQfPu47+94FMHK2Jf/77kI1pTzcYQMpHZJ4Q1kx6FXzef3YVIlz+7BGl0JfFPaUaNcpfjl/rI6ufGEUvsqDpfzohoDuzp5dJPCLHHHIWJ7BmQd+ncEAT9l6Q2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdBCT2ALX5Wxv5EZGQ6wrQqEMqsMT1tYY2k01sLMPS0=;
 b=8HHmubthp8xQw5hulC4LH4Eiz/RN+JCMVg+HEVEO8y+TokYFFT6qrrKlZsHmgvIfyeqMSPaECgqcSb+HmxSTEcOk1N/rZ8Rkm+g8IAVRRto6I0KDIkJ8Va0AvPTrx8we7ZECV84AQfcpMemi84/rMOToLNRQayH9Yob8yyde3AA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 3/3] xen/misra: xen-analysis.py: use the relative path
 from the ...
Thread-Topic: [PATCH 3/3] xen/misra: xen-analysis.py: use the relative path
 from the ...
Thread-Index: AQHZfooyuAY6OgOAbESkC2BSWxnO0K9dtEiAgAOQFACAAAETgIAAA8GAgAAnyAA=
Date: Fri, 19 May 2023 09:48:23 +0000
Message-ID: <FAFAD44A-0241-432A-8439-F3D92D4D3A53@arm.com>
References: <20230504131245.2985400-1-luca.fancellu@arm.com>
 <20230504131245.2985400-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2305161743520.128889@ubuntu-linux-20-04-desktop>
 <a0d6197a-53e8-0121-c7e0-ddbdaf970c7e@amd.com>
 <B087CAA6-0DCD-48C8-8199-A328BDA649A8@arm.com>
 <acb39086-69f1-4bd0-96f8-d9c9420cbb41@amd.com>
In-Reply-To: <acb39086-69f1-4bd0-96f8-d9c9420cbb41@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8208:EE_|DBAEUR03FT057:EE_|DU2PR08MB10186:EE_
X-MS-Office365-Filtering-Correlation-Id: b10c7300-fd20-4b5a-dd29-08db584e385a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tzWXpvvKHKkHY2dXI1LW8QmAJ2oTQ02CxZg32VFzeqeo4SUTxaW3/h+FfbWhlS3pK2FFKSC5a/vuvXX+gNeUqvPqPkg5BQA4EC5sf1LxdZrYN1SYte4sfqs9y8mJhFeC8HI20D5qIA5UG27eA20YjV0n33s4vnrwdpeuKrWl2NINlNTNnM/XBlXG9E7oZewVt/n+r7vtAJc4tx0Uk/QMdp7mUm8RKipyq6nBHE+4ASInlzImr1hxMsO//tHkjPrSCUBxKuj7TEGnCBvDmmieejahGpF9AtxWfdHvxflrhNuu/nbJ0qyJfWhWftlqT1KV0+xfEIITe8J6EKKgjza9GRmRaCpbSnulCbPKAhy4vIcIP/QzrsH5xAvZ76leQUv9dKW+m9aqFVeIYiMbThJs3zEJrIBt4UzniG3vg7hLcDay40BTOnPXuGjxdR9FeRhZmQ5+TUw06q6Gc6KXSx/rh4MgVlmkb/zCt7Fq6mOMbjydiYHP/qDTpNTWNOF2mV5LPSgr5hoCJyIDnFu0I0AfaxZ1eYCRDT/4GdhmYFKLbarwdkJDOrRTdMV3mBPjUqhcsperK66HP3sfht5kugnFYc7QQpVFZNdatbbqZVx7xc1fWdUj23sNqQVF9P+aHfq7Ks9xqfwC0sr7UfV+gou32Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(38070700005)(36756003)(33656002)(86362001)(91956017)(54906003)(316002)(6916009)(66946007)(66556008)(66476007)(64756008)(76116006)(66446008)(966005)(4326008)(478600001)(71200400001)(6486002)(8936002)(8676002)(5660300002)(2906002)(38100700002)(122000001)(41300700001)(2616005)(26005)(186003)(53546011)(6506007)(6512007)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <487662D172FD0045B92E79C11CE1F525@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8208
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f06f2006-68c2-46c0-2c2f-08db584e2fea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c/otDLz/nyCz9pidzWvj0fFDISfvcwo7zp7p0Sfmp56HlMRFBgtIgsOuKY88MeUuxpslSZi4Xp73tc7xIlPxa7zsKFNRZiy6p4c492ZYGa7NMOPa+ucKvZQTPLMXAemRNtBnfYL2izyeBhqEHLX5o8Jq9vaBVV+qScvRJaxAb4/V/wgWuRpa5mtCoAhZ6SqQmcBxwlPyKERooI8yBzdDe6zXUqtaaoH4QilQUYfWHSUKTr6Ts+G8pXluYppjavYlpdxfsuvPGa4P9oSXEnbXB6FZGwOCxTCym5sXxRNKlotCgZhDp6/qef9W9raiz0w788Jf2xn9Kqys6Eq5FYy+i6tuFv/0GvmukIt3I5ths0EwNvnh145v4iWpgj0XeHS+5LlgZ4acTWef3b0MqD0KbwiDlvGqa9xmYNfm6jkgf7zoDm5XihMfuEZgB6aZuCGALoxDsr3nySQhxCKWDGm/LLEk/UyUeTBLXDhad8ME6SVgGN0bY3hOK9oFkFxHen7vLvyMR1xx/0nuiJFPbpoKIC6lGx3fVag+0NsYAZPTB33ERl7H11BFuDc8cEZ5DN4aZt/5GjuGehxiz+YhpOSKj7ryTePMBYPXblj4pRdLY1z+ErJuShYJWHiR9tDqKxFAx8iHSY7/Gorp0custlu8IOhTs5dSFa6g5/tXWzgdxHbJVTFsc2nTRlTB2ZsXTMCDxNBdElyvENQIx9Hmn/LkGAt01VFN5PIXsbwkYINqwBI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(46966006)(36840700001)(40470700004)(83380400001)(36860700001)(186003)(966005)(336012)(47076005)(2616005)(54906003)(478600001)(6486002)(6512007)(26005)(53546011)(6506007)(8936002)(6862004)(36756003)(5660300002)(40460700003)(81166007)(33656002)(82740400003)(356005)(40480700001)(82310400005)(41300700001)(70586007)(8676002)(70206006)(4326008)(2906002)(316002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 09:48:37.9229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b10c7300-fd20-4b5a-dd29-08db584e385a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10186

DQoNCj4gT24gMTkgTWF5IDIwMjMsIGF0IDA4OjI1LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBPbiAxOS8wNS8yMDIzIDA5OjEyLCBMdWNhIEZh
bmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiAxOSBNYXkgMjAyMywgYXQgMDg6MDgsIE1p
Y2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIEx1
Y2EsDQo+Pj4gDQo+Pj4gT24gMTcvMDUvMjAyMyAwMjo0NCwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPj4+PiANCj4+Pj4gDQo+Pj4+IE9uIFRodSwgNCBNYXkgMjAyMywgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4+IHJlcG9zaXRvcnkgaW4gdGhlIHJlcG9ydHMNCj4+Pj4+IA0KPj4+Pj4g
Q3VycmVudGx5IHRoZSBjcHBjaGVjayByZXBvcnQgZW50cmllcyBzaG93cyB0aGUgcmVsYXRpdmUg
ZmlsZSBwYXRoDQo+Pj4+PiBmcm9tIHRoZSAveGVuIGZvbGRlciBvZiB0aGUgcmVwb3NpdG9yeSBp
bnN0ZWFkIG9mIHRoZSBiYXNlIGZvbGRlci4NCj4+Pj4+IEluIG9yZGVyIHRvIGVhc2UgdGhlIGNo
ZWNrcywgZm9yIGV4YW1wbGUsIHdoZW4gbG9va2luZyBhIGdpdCBkaWZmDQo+Pj4+PiBvdXRwdXQg
YW5kIHRoZSByZXBvcnQsIHVzZSB0aGUgcmVwb3NpdG9yeSBmb2xkZXIgYXMgYmFzZS4NCj4+Pj4+
IA0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0u
Y29tPg0KPj4+PiANCj4+Pj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4NCj4+Pj4gVGVzdGVkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4gDQo+Pj4gSSBrbm93IHRoaXMgcGF0Y2ggaXMgbm93IGNv
bW1pdHRlZCBidXQgdGhlcmUgaXMgc29tZXRoaW5nIGNvbmZ1c2luZyBoZXJlLg0KPj4+IEF0IHRo
ZSBtb21lbnQsIGluIHRoZSBjcHBjaGVjayByZXBvcnQgd2UgaGF2ZSBwYXRocyByZWxhdGl2ZSB0
byB4ZW4vIGUuZy46DQo+Pj4gYXJjaC9hcm0vYXJtNjQvbGliL2JpdG9wcy5jKDExNywxKTouLi4N
Cj4+PiANCj4+PiBTbyBhZnRlciB0aGlzIHBhdGNoLCBJIHdvdWxkIGV4cGVjdCB0byBzZWUgdGhl
IHBhdGggcmVsYXRpdmUgdG8gcm9vdCBvZiByZXBvc2l0b3J5IGUuZy46DQo+Pj4gKnhlbi8qYXJj
aC9hcm0vYXJtNjQvbGliL2JpdG9wcy5jKDExNywxKTouLi4NCj4+PiANCj4+PiBIb3dldmVyLCB3
aXRoIG9yIHdpdGhvdXQgdGhpcyBwYXRjaCB0aGUgYmVoYXZpb3IgaXMgdGhlIHNhbWUuDQo+Pj4g
RGlkIEkgbWlzdW5kZXJzdGFuZCB5b3VyIHBhdGNoPw0KPj4gDQo+PiBIaSBNaWNoYWwsDQo+PiAN
Cj4+IFRoYW5rIHlvdSBmb3IgaGF2aW5nIHNwb3R0ZWQgdGhpcywgZHVyaW5nIG15IHRlc3RzIEkg
d2FzIHVzaW5nIFhlbi1hbmFseXNpcy5weSBzbyB0aGF0IGl0DQo+PiBjYWxscyB0aGUgbWFrZWZp
bGUgd2l0aCBvdXQtb2YtdHJlZSBidWlsZCwgSeKAmXZlIGZvdW5kIGFmdGVyIHlvdXIgbWFpbCB0
aGF0IHdoZW4gaXQgY2FsbHMgdGhlIG1ha2VmaWxlDQo+PiB3aXRoIGluLXRyZWUtYnVpbGQsIGNw
cGNoZWNrIGlzIHJ1biBmcm9tIC94ZW4veGVuIGFuZCBpdCBjYXVzZXMgaXQgdG8gcHJvZHVjZSBy
ZWxhdGl2ZSBwYXRoIGZyb20NCj4+IHRoZXJlIGluIHRoZSBUWFQgZnJhZ21lbnRzLCBzaG93aW5n
IHRoZSBpc3N1ZSB5b3Ugb2JzZXJ2ZWQuDQo+IE9rLCB0aGUgd2F5IEkgdGVzdCBpdCBpcyB0aGUg
c2FtZSBhcyBpbiBvdXIgZ2l0bGFiIENJIHNvIHRoaXMgbmVlZHMgdG8gYmUgZml4ZWQuDQoNCkhl
cmUgaXQgaXMgdGhlIGZpeDogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hl
bi1kZXZlbC9wYXRjaC8yMDIzMDUxOTA5MzAxOS4yMTMxODk2LTQtbHVjYS5mYW5jZWxsdUBhcm0u
Y29tLw0KDQpJ4oCZdmUgdXBkYXRlZCBteSBpbnRlcm5hbCB0ZXN0IHNjcmlwdCB0byB0ZXN0IGl0
IG9uIGluLXRyZWUgYW5kIG91dC1vZi10cmVlIG1ha2VmaWxlIGludm9jYXRpb24uIEhvcGUgSSBk
aWQgbm90IGZvcmdldCBhbnl0aGluZywNCmFwb2xvZ2llcyBmb3IgdGhlIGluY29udmVuaWVuY2Uh
DQoNCg0KPiANCj4+IA0KPj4gSSBoYXZlIHJlYWR5IGEgZml4IGZvciB0aGF0IGFuZCBJ4oCZbGwg
cHVzaCB0aGF0IHNvb24uDQo+IFRoYW5rcy4NCj4gDQo+IH5NaWNoYWwNCg0KDQo=


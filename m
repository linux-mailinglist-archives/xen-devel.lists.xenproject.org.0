Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FD739C7A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 11:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553433.863983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGS6-00017M-3V; Thu, 22 Jun 2023 09:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553433.863983; Thu, 22 Jun 2023 09:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGS5-00014P-W9; Thu, 22 Jun 2023 09:18:05 +0000
Received: by outflank-mailman (input) for mailman id 553433;
 Thu, 22 Jun 2023 09:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFZZ=CK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qCGS3-00014H-Sg
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 09:18:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af62d2d2-10dd-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 11:18:01 +0200 (CEST)
Received: from DB7PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:10:36::15)
 by PAWPR08MB9446.eurprd08.prod.outlook.com (2603:10a6:102:2e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 09:17:58 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::f2) by DB7PR05CA0002.outlook.office365.com
 (2603:10a6:10:36::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 09:17:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 09:17:58 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Thu, 22 Jun 2023 09:17:58 +0000
Received: from 3b1aea8a76f3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0E064935-82E3-45D8-B909-8B2ECA36F69F.1; 
 Thu, 22 Jun 2023 09:17:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3b1aea8a76f3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 22 Jun 2023 09:17:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8034.eurprd08.prod.outlook.com (2603:10a6:150:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 09:17:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 09:17:44 +0000
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
X-Inumbo-ID: af62d2d2-10dd-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iT1jjAVEfiGGvuLWwsW5PaSGT0h978FR69VclyTx2M=;
 b=248kiIWuecfA67wSRW28vdAcmFrj3dplEdRdCur6LIvewurtzxaEwNyzKXI7g4chdl+AFJQgWMmj4Sar+IM4oVNYBK4XR3C57LLk/2+qJL3biu4wQ2AJ9m+BI7ycTq0nyLM0p0xVAL2xrtJ1nalySI/U5Bbj2X3QgROGCUIpSCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe95980b2c41118e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRghKWFtQj2n1ms8KvXMpcwaCyx+3Jw4J0i5o1c9bAfg0vbd6V4OcWd7OvXm0d8pUElkWIHGCaMsgbvQTiSZACbhNYPimQFvtt1on1BX2h095lYk2Z7+6XC5/TN9P25Gm5zYQusgvRXMgPvRaRa+BvmS81XsMxovbfULrtwtTa+V1z0wpZCLjgkCSEDX1/vwvt0QstncapN2UgbeVPCdQJ+u/DfLCF6bE8jAf2Nte7ToVtHmYnreDLGXLJDhyp8BSToq1g51aavIY2eQH6NDiBEJEH4EcVycqnozAURRUw6OFjWUROeqcmxMORFtciKJqfx9J3SCMcpS7CsPdhyRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iT1jjAVEfiGGvuLWwsW5PaSGT0h978FR69VclyTx2M=;
 b=SK4zY7w13TSAopSngHt0piy5Y9bDdnMrQCLyawm386UExDd1UeAioTDrFqI1/IwDWPPBENR9bXQc3Z5v9RE5I80fhN37+oykVxvOZhTYc+KxQmwUtki/b/9GB9TGTDfWUkYJQOsfCwoTJPdm3i8hH/EkgbllAValmPLtSGpvIyYwoY6DIU0MKq/T7VpmCg2MMqi0o/98yrtGG+jv/e/LjOP5l1u1E22eMnexdzZoO58VxBZeRM25JSuooCqPOX37VrNBVJuhO0OREquHwG9cwxrXzJceBL+5ZwHrmqqfLu22scwnJk4FFPrxku4ZrXXey591F3rHMwOvC8qrU+3twg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iT1jjAVEfiGGvuLWwsW5PaSGT0h978FR69VclyTx2M=;
 b=248kiIWuecfA67wSRW28vdAcmFrj3dplEdRdCur6LIvewurtzxaEwNyzKXI7g4chdl+AFJQgWMmj4Sar+IM4oVNYBK4XR3C57LLk/2+qJL3biu4wQ2AJ9m+BI7ycTq0nyLM0p0xVAL2xrtJ1nalySI/U5Bbj2X3QgROGCUIpSCc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] tools: Fix ifdef for aarch64 that should include also
 arm
Thread-Topic: [PATCH 1/2] tools: Fix ifdef for aarch64 that should include
 also arm
Thread-Index: AQHZmhGAbKd3CRm5gUS5RUtvHum0Za+WoJ4A
Date: Thu, 22 Jun 2023 09:17:44 +0000
Message-ID: <EF806959-9C6C-4D97-9F8F-694ED985D6AF@arm.com>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
In-Reply-To: <20230608135913.560413-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8034:EE_|DBAEUR03FT022:EE_|PAWPR08MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a2edf0-34cc-4c77-c7e5-08db73019217
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PVxrdQWQjjUhVeAEYWxhw84nbt7if+ThCQW45WRYWoGv9xYsVGdeI87TbffUYifZEavPpvsP14qKRo1v4KQClmQoOXEQ9yW0w9RJKMkudWuKwbRgU0+2UdAeiZtU8EOSfWZUQycUjxHf47eqpd/7WZJIZyawsbnIqVM4nX1vb6E/N9ySqfxWiC2nYejZN7ef3KaKTT82hNP3V5QDfRa1CP4/WfoWjhaHk45+K3W/UTJ3nWajfwJ7vMPXE04s4ErGACChqRVIC/8+Nuz/lFO01TCJ05zWZj6ZfhdPa24m4EkJAjpMhgqyF2gQ8OP1UhLzEU2B67ldnybZyDfFTC2mN8+VLDPyOs/BfMNQ+1Yx5jsB8ggY2z5BNZjEvRQ9CT0Nm9IFCc28bQyCBp56bj4sXM7FJEoeTpBYcXcpf64vxPGgo2+0HrT+LcZ8QKx2VXRLRuQ3gceVLxCE3MF1tNZUxhGuB4/V9SPuWDqTETMLYB/33eFf5LFJEG38pq0FIza5sAPT8RAIRc0djM7tHzaTdDccfPsPXHVyUC1EEJilIoKXQqtXhhNNytERshNCc7rB7TEJF3hz8w/qsi1X0lal9hwCjYHsH4Cqiyna472WnyAx4ADZz1ZGU6C9+yYQdt5mgAC/g3bidVoqCmrthpRQdA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(38100700002)(122000001)(2906002)(38070700005)(83380400001)(36756003)(33656002)(86362001)(6506007)(53546011)(2616005)(6512007)(26005)(186003)(71200400001)(54906003)(6486002)(478600001)(64756008)(91956017)(66446008)(66946007)(66556008)(66476007)(76116006)(41300700001)(8676002)(316002)(6916009)(5660300002)(4326008)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F69F87585D1204B974A06019C18F34F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8034
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9534cfd4-b594-4bd9-a773-08db730189cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B0+vP5DAI2nslQk0ub8jLR5pWn69o60CqapQcNlrWoChTZxg5T2Fb6ri3ZrFZkeofg+//2xIe3/We+i204i03HfTH/QbpEmWgzRp5dLzDjuPgqfi5BhWhil1zKrYLBReQV+awHHmyDSynSUCbGyETxDOBgdv59rkQ9RqhGXFtAsooG/0/9cwPzmcZtQfUVRDxSykMY9esq2evLtwk4u7tGEHTa378mz7fbHR6ci+gDBKjE9e1kkoqrcKJaQWm9xQra4irV/lIn9tQDFIf4qo4q2pkh9ZPkGtiyFpvF/j/Koh74yNkskj/WRxnQ70S+t0apFqgWJelNPIGcP7uuP3PsNIEtbNjIpmtZwH9A8Z6LHtVMRdLrr0lEL1KBdKbvCdtgs8wyepT18whz4mQGc7mJINgai84k/LgcbiYgvjdOLgE+d32xJU5T+oqTilxhRgAChq5f5WYS80zKQjurtQ4rQlUFxpsO+NvemeuC9sEqBMYY/8EwRc0xq2QAwb/PRNcW6sle/46C5TIbgzWhIako7cXo8T1286iIhV5vLggfne+pbIqGap6NIA9Rjv4Wvk0ysjwdmCSeCQaZb7hxNyWMKcMSQUkwB2X7MdKCXIo1NEge2eBa+GJ2V9qePY+6aCiY/E+KLyEKrvhO0PBQCsKU/shCjR0vOeSOxGZ1bwzwZLWiG2CFa9ifXZUfin5DcjE7cX8GvEgwzOBBSCnSztJa+/enLaDQJiJvjagt+EmXJRHAFh6HihqQSZ7hFjrMto
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(86362001)(33656002)(54906003)(82310400005)(81166007)(356005)(82740400003)(2616005)(336012)(83380400001)(6506007)(53546011)(186003)(26005)(6512007)(40460700003)(107886003)(47076005)(36860700001)(8676002)(478600001)(4326008)(6486002)(40480700001)(6916009)(70206006)(70586007)(316002)(5660300002)(41300700001)(8936002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 09:17:58.6094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a2edf0-34cc-4c77-c7e5-08db73019217
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9446

DQoNCj4gT24gOCBKdW4gMjAyMywgYXQgMTQ6NTksIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2Vs
bHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBDb21taXQgNTZhN2FhYTE2YmZlIGludHJvZHVjZWQg
c29tZSBTVkUgcmVsYXRlZCBjb2RlIHRoYXQgaXMgcHJvdGVjdGVkIGJ5DQo+ICcjaWYgZGVmaW5l
ZChfX2FhcmNoNjRfXyknLCB0aGUgaXNzdWUgaXMgdGhhdCB0aGlzIGRvZXNuJ3QgdGFrZSBpbnRv
DQo+IGNvbnNpZGVyYXRpb24gd2hlbiB0aGUgdG9vbHN0YWNrIGlzIGNvbXBpbGVkIGZvciBhbiBh
cm0zMiBEb20wIHJ1bm5pbmcgb24NCj4gYW4gYXJtNjQgcGxhdGZvcm0sIGl0IHNob3VsZCBiZSBh
YmxlIHRvIGNyZWF0ZSBTVkUgZW5hYmxlZCBndWVzdHMgYnV0IHdpdGgNCj4gdGhlIGN1cnJlbnQg
Y29kZSBpdCdzIG5vdC4NCj4gDQo+IFNvIGZpeCB0aGUgaXNzdWUgYnkgY29tcGlsaW5nIHRoZSBj
b2RlIHdoZW4gdGhlIHRvb2xzdGFjayBpcyBjb21waWxlZCBmb3INCj4gYm90aCBhcm0zMiBhbmQg
YXJtNjQuDQo+IA0KPiBGaXhlczogNTZhN2FhYTE2YmZlICgidG9vbHM6IGFkZCBwaHlzaW5mbyBh
cmNoX2NhcGFiaWxpdGllcyBoYW5kbGluZyBmb3IgQXJtIikNCj4gU2lnbmVkLW9mZi1ieTogTHVj
YSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiBSZXBvcnRlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gLS0tDQoNCkhpIGFsbCwNCg0K
SXMgdGhlcmUgYW55IGNoYW5jZSB0byBoYXZlIHRoaXMgb25lIHJldmlld2VkIGJ5IHRoZSBlbmQg
b2YgdGhlIG1vbnRoPw0KSeKAmW0gYXNraW5nIGJlY2F1c2UgSSBoYXZlIGEgSmlyYSB0YXNrIGF0
dGFjaGVkIHRvIHRoaXMgcGF0Y2ggYW5kIG15IFBNIGlzIGNoYXNpbmcgbWUgOikNCg0KSWYgaXTi
gJlzIG5vdCBwb3NzaWJsZSBpdOKAmXMgZmluZSBlaXRoZXIgYW5kIEnigJlsbCBoYXZlIGp1c3Qg
dG8gcmVwb3J0IHRoYXQuDQoNCkNoZWVycywNCkx1Y2ENCg0KDQo+IHRvb2xzL2luY2x1ZGUveGVu
LXRvb2xzL2FybS1hcmNoLWNhcGFiaWxpdGllcy5oIHwgMiArLQ0KPiB0b29scy9weXRob24veGVu
L2xvd2xldmVsL3hjL3hjLmMgICAgICAgICAgICAgICB8IDIgKy0NCj4gdG9vbHMveGwveGxfaW5m
by5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstDQo+IDMgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2luY2x1ZGUveGVuLXRvb2xzL2FybS1hcmNoLWNhcGFiaWxpdGllcy5oIGIvdG9vbHMvaW5j
bHVkZS94ZW4tdG9vbHMvYXJtLWFyY2gtY2FwYWJpbGl0aWVzLmgNCj4gaW5kZXggMzg0OWU4OTc5
MjVkLi40YWE0YzZjMzRhOTkgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2luY2x1ZGUveGVuLXRvb2xz
L2FybS1hcmNoLWNhcGFiaWxpdGllcy5oDQo+ICsrKyBiL3Rvb2xzL2luY2x1ZGUveGVuLXRvb2xz
L2FybS1hcmNoLWNhcGFiaWxpdGllcy5oDQo+IEBAIC0xNCw3ICsxNCw3IEBADQo+IHN0YXRpYyBp
bmxpbmUNCj4gdW5zaWduZWQgaW50IGFyY2hfY2FwYWJpbGl0aWVzX2FybV9zdmUodW5zaWduZWQg
aW50IGFyY2hfY2FwYWJpbGl0aWVzKQ0KPiB7DQo+IC0jaWYgZGVmaW5lZChfX2FhcmNoNjRfXykN
Cj4gKyNpZiBkZWZpbmVkKF9fYXJtX18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pDQo+ICAgICB1
bnNpZ25lZCBpbnQgc3ZlX3ZsID0gTUFTS19FWFRSKGFyY2hfY2FwYWJpbGl0aWVzLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fU1lTQ1RMX1BIWVNDQVBfQVJNX1NW
RV9NQVNLKTsNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9weXRob24veGVuL2xvd2xldmVsL3hj
L3hjLmMgYi90b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMNCj4gaW5kZXggNDkxZTg4
OTc3ZmQzLi5lMTRlMjIzZWM5MDMgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93
bGV2ZWwveGMveGMuYw0KPiArKysgYi90b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMN
Cj4gQEAgLTkxMSw3ICs5MTEsNyBAQCBzdGF0aWMgUHlPYmplY3QgKnB5eGNfcGh5c2luZm8oWGNP
YmplY3QgKnNlbGYpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJod19jYXBzIiwgICAg
ICAgICAgY3B1X2NhcCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgInZpcnRfY2FwcyIs
ICAgICAgICB2aXJ0X2NhcHMpOw0KPiANCj4gLSNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0KPiAr
I2lmIGRlZmluZWQoX19hcm1fXykgfHwgZGVmaW5lZChfX2FhcmNoNjRfXykNCj4gICAgIGlmICgg
b2JqcmV0ICkgew0KPiAgICAgICAgIHVuc2lnbmVkIGludCBzdmVfdmxfYml0czsNCj4gICAgICAg
ICBQeU9iamVjdCAqcHlfYXJtX3N2ZV92bDsNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX2lu
Zm8uYyBiL3Rvb2xzL3hsL3hsX2luZm8uYw0KPiBpbmRleCBkZGM0MmY5NmI5NzkuLjcyZTg3ZWFj
NDZkMSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMveGwveGxfaW5mby5jDQo+ICsrKyBiL3Rvb2xzL3hs
L3hsX2luZm8uYw0KPiBAQCAtMjI2LDcgKzIyNiw3IEBAIHN0YXRpYyB2b2lkIG91dHB1dF9waHlz
aW5mbyh2b2lkKQ0KPiAgICAgICAgICk7DQo+IA0KPiAgICAgLyogUHJpbnQgYXJtIFNWRSB2ZWN0
b3IgbGVuZ3RoIG9ubHkgb24gQVJNIHBsYXRmb3JtcyAqLw0KPiAtI2lmIGRlZmluZWQoX19hYXJj
aDY0X18pDQo+ICsjaWYgZGVmaW5lZChfX2FybV9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0K
PiAgICAgbWF5YmVfcHJpbnRmKCJhcm1fc3ZlX3ZlY3Rvcl9sZW5ndGggIDogJXVcbiIsDQo+ICAg
ICAgICAgIGFyY2hfY2FwYWJpbGl0aWVzX2FybV9zdmUoaW5mby5hcmNoX2NhcGFiaWxpdGllcykN
Cj4gICAgICAgICApOw0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCg0K


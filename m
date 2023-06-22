Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7B8739E18
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 12:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553478.864055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCHIz-0002Uk-R9; Thu, 22 Jun 2023 10:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553478.864055; Thu, 22 Jun 2023 10:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCHIz-0002RM-Mm; Thu, 22 Jun 2023 10:12:45 +0000
Received: by outflank-mailman (input) for mailman id 553478;
 Thu, 22 Jun 2023 10:12:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFZZ=CK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qCHIy-0002RG-1M
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 10:12:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 526cd7a4-10e5-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 12:12:41 +0200 (CEST)
Received: from AM6PR10CA0010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::23)
 by AS4PR08MB8218.eurprd08.prod.outlook.com (2603:10a6:20b:51d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Thu, 22 Jun
 2023 10:12:38 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89::4) by AM6PR10CA0010.outlook.office365.com
 (2603:10a6:209:89::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 10:12:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 10:12:38 +0000
Received: ("Tessian outbound c63645f235c1:v142");
 Thu, 22 Jun 2023 10:12:37 +0000
Received: from 813c4aaeb53b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 669FD37F-BCA1-4BB2-8CF9-685E299AFB2B.1; 
 Thu, 22 Jun 2023 10:12:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 813c4aaeb53b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 22 Jun 2023 10:12:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PR3PR08MB5769.eurprd08.prod.outlook.com (2603:10a6:102:91::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 10:12:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 10:12:29 +0000
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
X-Inumbo-ID: 526cd7a4-10e5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ASqtiFG2OOGD2Vw1Of3qidX72CHEs9F+6fAFU5tT44=;
 b=RrO9Wj4GakcLpgCr5ynLVY5HpRM8UmbiUJU3PiGs3Z0THkUYTXl6ocnYQJ6OIMuODnQvQkCHsN4OARmklzBcDQSvg9aTQt6AKIDb2juqd4fHSay8zqTsMBaHKat0t8nEAc72A6+WVeOsfgcyqcAUqdaOmSBkDLAPY1y2ljv18wk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cf84c847d1c271e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWgBLIUaFd89FW2Ll8L9naeTYhLkVor0WnTY24Vj7LgNPezMYLWu6s31fB50/1W5G6kSjj6KtgRTMk/lBv2R/mKgLHOCE33FpuDW1v1rAAQDJoEVjj+v1Zsk6n+A0f3LXPfYYambtFSKQRvuOhWNpKBoePSW2MM5K04Yu4i0m9UYyN9RAq7pP8+ST6+OVLF+dO0yE4q5E5UwRO3PaXYaw4lKpO+g5Ljm/Mb4WoV32X8XocBOxopBAuk/lxWtwKQYRJ0uMExC+LzW7ZQaPogVZF0y2pxxOBf1gizq60UhhpmcqonG2pI49dV/RsqweRMvAwPInOoejMBBcS2Q40TE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ASqtiFG2OOGD2Vw1Of3qidX72CHEs9F+6fAFU5tT44=;
 b=VQ6oqtIMxCil1XG3FDx1kHV915Az32gB06PLhrpRvP97r7WsFA4UB6g1Fh9raJpDauf+WeWyoTJ/yxFRL2NAa+DVDzCuJgw6WFxqlP1BQCLpHBqpCKAp2yIDBFvgHoWcKCZLs3jUPoURTtRAovv3/GNO5xTZah8ZuJhRRDvrZtmPrup+joMXAi2mfkd+rd2gKsUdWA55WJ/alMlaR9caSl2waDTJgM25eOA/vG9iUVtBnmm1wgkWEvrn+JCOmri8ycpujsjD14hKkP9KGlBNsy+6/hTTtab930shtpvMsZf21Jmh4D8r58w1rjvlqtBGWWJSvvhEtAYd2vkYyfpZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ASqtiFG2OOGD2Vw1Of3qidX72CHEs9F+6fAFU5tT44=;
 b=RrO9Wj4GakcLpgCr5ynLVY5HpRM8UmbiUJU3PiGs3Z0THkUYTXl6ocnYQJ6OIMuODnQvQkCHsN4OARmklzBcDQSvg9aTQt6AKIDb2juqd4fHSay8zqTsMBaHKat0t8nEAc72A6+WVeOsfgcyqcAUqdaOmSBkDLAPY1y2ljv18wk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Peter Hoyes <Peter.Hoyes@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/2] tools/console: Add escape argument to configure
 escape character
Thread-Topic: [PATCH 1/2] tools/console: Add escape argument to configure
 escape character
Thread-Index: AQHZpPF3QpbD+YTBNUSeBQYgOGD68a+WmikA
Date: Thu, 22 Jun 2023 10:12:29 +0000
Message-ID: <D688D5B1-BE8E-4AFF-9C60-836C380D3087@arm.com>
References: <20230614074144.3505250-1-peter.hoyes@arm.com>
In-Reply-To: <20230614074144.3505250-1-peter.hoyes@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PR3PR08MB5769:EE_|AM7EUR03FT032:EE_|AS4PR08MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 843d97a4-7ba3-4598-02e7-08db730934e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FHI1anpKej+6Ppd4a1UJy4k8FTwPiF/udwRF+0ugtvcXdPNJ6HLMWtfa2NCW0vDCl6CXN+xILAtmNK9tWDUJ42koDtCfQxKp7SbIrDkwPkBvhtx/RNZMHeR3UgK93odlg0Ly8Yeq6x5OTR3e0JkhztcMGoph4znjKGomqUhamF9FmA4oZ2nWZ6sP5FN2P3gJDjzDL6+b2K+4V5ru9nMbzgLLz19X0VNrlOGNfPh9wfO9smev5rkwfKNyD7V1c4nrPPILMhkRWnJQwPHKw5LFxNa0dSVZdbvGSk3wcBrbK1uStLVZQ1KjjyVi0Clr67KnRhsE6e4t4rffS4u60JYwT5Usn2se8qg56P0YaUxhKue9mgFSjH39FsX/lewfeRFqwuEzhhtVKikmazRyJUiZ9fviM010f4x9TlScRlt2Zc6o+cXlpKqqQNwIpw/7e2Ir5ob2vGSxKtbz7YvE/L0bphcupy0tQeD98WuDHz5ol18L/yW1oMmpxmCt1Qra7MD/OSe5VRKk/73hkSCqan7C1uV3ftZ+OYSZT2Ig2aZ+6l1fwg4cvjkXFR5L2/kRzrgr0Gv6LxE+lmCL4ZhxRYiUoC+Gv4D+CkTHYn0ajpKUBj+P3Kvo7CkSlJNp56QyXGOxWyHFyFKYb08wLzgTY74cjw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199021)(33656002)(6486002)(26005)(478600001)(71200400001)(54906003)(37006003)(83380400001)(2616005)(186003)(2906002)(53546011)(6506007)(66446008)(6512007)(6862004)(5660300002)(36756003)(66556008)(122000001)(76116006)(38100700002)(316002)(91956017)(6636002)(8936002)(66946007)(41300700001)(64756008)(4326008)(8676002)(66476007)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A53ABE7597B3DC4492455A40953C0558@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5769
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c958e47-c933-41a9-306b-08db73092f97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b4omyOmQy7bYSrMcWRd5V5TaaTefJYgl6BdR4AWjg4/7htqbZI1TvEun7sOWZONF0FEiWUUNkxt9rxLKSa9LGsDPCyFBsJQFuxtvSiz90S2GDSd4DluPCAooVvaFVuDd0Omk/XBIAg6FVIWnosms1nLyDVLbITrGbKOKwZ2D5Kl/YEKhsWuiWfBd8H6Jt/6UR9QAFzDU03qlncrhSuwUVP54WwNHZKGVHcWp8EuW1lsJWa4BYeSFwFDYFKWnBHPiBzpgEbZGx7atWizVOE0b+VJdF2PGD060JliZKTB286f0VT9dpGE780izC27u08pDdCIlBKZKYMTHYczXK/RwBYwOHiWdj+wbED+XfqucQbf7qqxPiv0JMHcPgcNH9a4+rFQcN+8XozKJchuyl9wBhEs2MYiTY4P+RBZ/PD2HU4sMOYCWCE1J5jknytMbQgjiJhmzoLlBJbWMXr6zD+7uONfY8SxWNtKYTxO7yfP65PR0dcbNsa1693YckR4s/w2zCYXaJW0F3tjccKsVwtdZ7YZTVsjsXKfpm94XwSta3k2VIXf/468FTJa8FhQvMZo4n4zBzeW3rBe4wU2PDgVMUh5ZlSbMoqW9mseD7zm0gYfNY+crm4tlvkQK5yczXQNe9Rz85kTuAX+BRjK+RHUGBA2evtEOa8B04RY7DCDnFKOTe6ecm9OjdCNhfJ0pSWiY1lcn7FLf7TPn6wRiDEV5S96JRy2zUx5701AZOBhjwbpXYm2Ui498sQrJitOI4uEz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(40470700004)(46966006)(36840700001)(82740400003)(40460700003)(41300700001)(8936002)(8676002)(82310400005)(81166007)(356005)(2616005)(83380400001)(336012)(6512007)(186003)(26005)(107886003)(53546011)(478600001)(6486002)(47076005)(54906003)(37006003)(86362001)(40480700001)(4326008)(36756003)(316002)(70206006)(6636002)(33656002)(6506007)(36860700001)(70586007)(2906002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 10:12:38.1912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 843d97a4-7ba3-4598-02e7-08db730934e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8218

DQoNCj4gT24gMTQgSnVuIDIwMjMsIGF0IDA4OjQxLCBQZXRlciBIb3llcyA8UGV0ZXIuSG95ZXNA
YXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBQZXRlciBIb3llcyA8UGV0ZXIuSG95ZXNAYXJt
LmNvbT4NCj4gDQo+IERvbTAgbWF5IGJlIGFjY2Vzc2VkIHZpYSB0ZWxuZXQsIG1lYW5pbmcgdGhl
IGRlZmF1bHQgZXNjYXBlIGNoYXJhY3Rlcg0KPiAod2hpY2ggaXMgdGhlIHNhbWUgYXMgdGVsbmV0
J3MpIGNhbm5vdCBiZSBkaXJlY3RseSB1c2VkIHRvIGV4aXQgdGhlDQo+IGNvbnNvbGUuIEl0IHdv
dWxkIGJlIGhlbHBmdWwgdG8gbWFrZSB0aGUgZXNjYXBlIGNoYXJhY3RlciBjdXN0b21pemFibGUN
Cj4gaW4gc3VjaCB1c2UgY2FzZXMuDQo+IA0KPiBBZGQgLS1lc2NhcGUgYXJndW1lbnQgdG8gY29u
c29sZSB0b29sIGZvciB0aGlzIHB1cnBvc2UuDQo+IA0KPiBDcmVhdGUgcGFyc2VfZXNjYXBlX2No
YXJhY3RlciBzdGF0aWMgZnVuY3Rpb24gdG8gY29udmVydCBhIGNoYXJhY3Rlcg0KPiBzdHJpbmcg
KHdoaWNoIG1heSBpbmNsdWRlIGEgJ14nIG1vZGlmaWVyKSBpbnRvIGFuIEFOU0kgaW50ZWdlci4N
Cj4gDQo+IEFkZCBhcmd1bWVudCB0byBnZXRvcHQgb3B0aW9ucywgcGFyc2UgZXNjYXBlIGNoYXJh
Y3RlciBhbmQgcGFzcyB2YWx1ZQ0KPiB0byBjb25zb2xlX2xvb3AuDQo+IA0KPiBJZiAtLWVzY2Fw
ZSBpcyBub3Qgc3BlY2lmaWVkLCBpdCBmYWxscyBiYWNrIHRvIHRoZSBleGlzdGluZyBiZWhhdmlv
cg0KPiB1c2luZyBERUZBVUxUX0VTQ0FQRV9TRVFVRU5DRS4NCj4gDQo+IElzc3VlLUlkOiBTQ00t
NDk1OA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBIb3llcyA8UGV0ZXIuSG95ZXNAYXJtLmNvbT4N
Cj4gQ2hhbmdlLUlkOiBJMzc5NWU2NTRiMzgyZTc4MTQ0ZDgyMTBmMzAzZTNlYmNjZWM0NTdlZA0K
DQpIaSBQZXRlciwNCg0KSGVyZSBpbiBYZW4tZGV2ZWwgdGhlIHBhdGNoZXMgc2hvdWxkIG5vdCBo
YXZlIElzc3VlLUlkIGFuZCBDaGFuZ2UtSWQsDQp0aGV5IGNhbiBiZSBzdHJpcHBlZCBvbiBjb21t
aXQgaWYgdGhlIG1haW50YWluZXIgaXMgd2lsbGluZyB0byBkbyBzbywNCm90aGVyd2lzZSB5b3Xi
gJlsbCBuZWVkIHRvIHNlbmQgYSB2MiB3aXRoIHRoZSB0YWdzIHJlbW92ZWQuDQoNClRvIG1lIHRo
ZSBjb2RlIGxvb2tzIGdvb2QsIHN0aWxsIG5lZWQgYSBtYWludGFpbmVyIHJldmlldyB0aG91Z2gu
DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoN
Cg0K


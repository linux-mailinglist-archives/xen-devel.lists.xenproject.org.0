Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9347AA306AC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:11:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885162.1294943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmIG-0002Cl-Ag; Tue, 11 Feb 2025 09:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885162.1294943; Tue, 11 Feb 2025 09:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmIG-0002As-78; Tue, 11 Feb 2025 09:11:00 +0000
Received: by outflank-mailman (input) for mailman id 885162;
 Tue, 11 Feb 2025 09:10:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EtZg=VC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1thmID-0002Al-Le
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:10:57 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 190d4af2-e858-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 10:10:55 +0100 (CET)
Received: from DUZP191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::22)
 by AS8PR08MB6231.eurprd08.prod.outlook.com (2603:10a6:20b:298::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 09:10:50 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::93) by DUZP191CA0003.outlook.office365.com
 (2603:10a6:10:4f9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.11 via Frontend Transport; Tue,
 11 Feb 2025 09:10:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Tue, 11 Feb 2025 09:10:49 +0000
Received: ("Tessian outbound e4b26383420a:v567");
 Tue, 11 Feb 2025 09:10:48 +0000
Received: from Lcc8105800a77.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F86F351-34B6-445F-9D52-6CC64DD895CA.1; 
 Tue, 11 Feb 2025 09:10:41 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lcc8105800a77.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Feb 2025 09:10:41 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22)
 by DB9PR08MB7699.eurprd08.prod.outlook.com (2603:10a6:10:392::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 09:10:38 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a]) by VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 09:10:38 +0000
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
X-Inumbo-ID: 190d4af2-e858-11ef-b3ef-695165c68f79
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PUtFdrajjL/oNkUQCPD3fvKQZtrcMx362h7Mu9DezST0KAKQ+6vlUEHJY5VUZlqOk9K9RHmzosK/2Gg8O0LXq2/n4U1Zycf037OHajdSS7fT/fLZo0sKLmKEoptlPrODpNjzKbjrkLmc4lp3Yxx8MGLUYtoGN6XlYIwN7Ntg8ZL02I1W3zVyZ4ILQLTqod1oIkcKTqTkNiH4xals/QBgDsLkrrqodsh0+0nDGdFs05DvQ4kpPISQiPuwOzBgQttQb9v6MYq5TllITzzg+Ln4hXwMn7rbHPHI7RwwSfCjjYTCNkGXzSiLPWMycMy8Mu37LaQ9rMVqsb9pEn00JfsV0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/VTmBFXkiCU8sGdGJliSOOGQggOqMN5zsgaJWC9meo=;
 b=tYnu68p/hBKSc1qMEsOjRncF2Y4DoRji5ExDpmnw3NkpHpDZBd07kt7i97FYlk2LhQlABB9xlt8eQT1ow7g58T19ck2NPpTyJXKzH2MCFd1oAxy3Vit+5/NmKa4Z10mGVMdpSGJx+l34CB+qb8H87+dfY5VxKFrbe0uRsckILTsN91BTeWRgu2ebA8jMMPW8R74hwXxVvt35SjfxXHIWmJ7eFBQUfUbvEqAjychrLk/FJODG9paUWmyjc/Z+yeQuRYdIBvCYUxb7JClQ1lNh/LYWZNIDEWIw2hGCUNVwzE7+shjtCyubWczCHDFNJilz8lcS5/29B7etyRaD4Q7cFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/VTmBFXkiCU8sGdGJliSOOGQggOqMN5zsgaJWC9meo=;
 b=Zuwjw6SnkT2UzkIy+ZF4ZAGFtSoPpSvxWM6OqynNPFunrjSvgUa6tfkmSOHGy8OZGp8DRpPKRRdAutpP94pdwzqjHF4zRPPfL39hyoYN1eBpYjIfXbpGB/5XKMVGO8JGPQA1pdmDjJZAHW+CDSeomKSgpiUyXpjDg9gVhVVtyJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a2ab785e5e7f675
X-TessianGatewayMetadata: Ieg6Pkm2orOR5DkJvMObIjZVaDe2dkH2BMU/9J07N2hwibDPlAWpCSEbeBqkTQbv2Enxz4uzoeKwgMimEP0ovHmbBKI02ceTRG9Bn5t9OOdAvc0NfwQM+Gk6NT1R6nbqTwCJNOD37vAgkUXerQz2GFA2pygn6DE9MMPrrChF858=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdKDUk9GvtTLZMwkFp9+trb2aqQD9HkOX57wjpt+yLG8MrzHDZxYpKF/GELxG4gOY4cUMpXoKyYGOHr/HhNKPmovUcm4M09SkeEk2uGT9cxcDj8US7MeYsTMLLSpMq8CAzvaIf9CY1p9fSLtM7e4Foo6SullALGfmTOyX6S7cf/Y95cs6VerhwJZIoCMvO4PNHuVoy4j8dZoqEJRtr/Bw5PbyfQQ7faK93rf3Rq0GyFrwUHRuls8LWQ+dxe5optnty4rtPLMqD3y4inrdMp4203RV0IEE3pa5/FgvtEQG3937PoIusaWxJmuLywqowMlMl7Q+ZMRFJHEM3COsQvO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/VTmBFXkiCU8sGdGJliSOOGQggOqMN5zsgaJWC9meo=;
 b=XDXGxMq8ch6N8WCPmuKVyH6DP895Y4ptc5/IwBhYQZa8sCUGr9KB7hJdZtm8hZyjGEo6UBxsIN8NLgqvNHBpjmmIC9LDkM2QL0NKLX5GeDjPnGSPZSXPWZJeEkJQmnP14+H66yYhCXsRcIsxzKMFL7hPu+2uUlUCUCjSbU70x7afFwCTg6cUx4+/N6G5S9/DmaemK5K2n7l7e7gRDIyu3KzdCFCu5Qu0R3tdSrb2mUGIpxTOholLFhxM+813JWIZI3Ds+HXkJomhmyuzG0uOEJkaGPKl9p9iatlB+ERzko8tVhOPrpEnI2BdMmjN1OmQUelq46UKBdOV/kEUkjoKFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/VTmBFXkiCU8sGdGJliSOOGQggOqMN5zsgaJWC9meo=;
 b=Zuwjw6SnkT2UzkIy+ZF4ZAGFtSoPpSvxWM6OqynNPFunrjSvgUa6tfkmSOHGy8OZGp8DRpPKRRdAutpP94pdwzqjHF4zRPPfL39hyoYN1eBpYjIfXbpGB/5XKMVGO8JGPQA1pdmDjJZAHW+CDSeomKSgpiUyXpjDg9gVhVVtyJI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Artem
 Mygaiev <Artem_Mygaiev@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: Coding Style Review and Automation
Thread-Topic: Coding Style Review and Automation
Thread-Index: AQHbfAEPdB5iHtyhPUOv3RpqtR+ORbNBzx2AgAACc4A=
Date: Tue, 11 Feb 2025 09:10:38 +0000
Message-ID: <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
In-Reply-To: <Z6sR87FrKcOhgEqX@macbook.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VE1PR08MB5807:EE_|DB9PR08MB7699:EE_|DB5PEPF00014B8C:EE_|AS8PR08MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3cb261-45af-432c-c9db-08dd4a7bfa1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?elo2YVdySUswUWduc0hiMHRDWlhMdGdVVE5maUE4V05nYndjc2M4cnRuOWNo?=
 =?utf-8?B?VEl3cEZ4dDZZT2lvL2tXeUVXbVpEbnNiSkpvMFZ4a0YzMU95ZjZWVTJFN1pu?=
 =?utf-8?B?eCtScmx1V1o1RG80QU96eGtWRVFlMDMvQnhyRDdsRlZ5emt3SURDY2pQMmdQ?=
 =?utf-8?B?eGF2RE5RZ3BxMGREZlE1MUdiTHhwT2lCOGFRem90cTgvSWV4WXBMRk5LVVdN?=
 =?utf-8?B?bThwK1ZkeU52aUJrMEZ6Z2djemtUbW5ZQk9zbXc4NmVvbFc5elJzSGtpTkRY?=
 =?utf-8?B?citBbUt5RkdXSkhRSVJTaG1IVllQSHN3U3lLV28rOWtQVUJHSVhpQTcxdEFQ?=
 =?utf-8?B?U2pwSTFaYVZ4cU81SUx2ck11QnV6dllqQ0dFMHNxOFlzaEVUaUlMVy8xMXc1?=
 =?utf-8?B?Mm90My9Pa2MxTmNteWFsNzAyVkd0VElGZ3gyT0FsMkhxbkllOWIzL3hEKzdn?=
 =?utf-8?B?QXRPRkkwSVJ1ejR1SFNBdDV1N0Fhc25PMVZlc25VbDhWbThUNmlsckJsazhz?=
 =?utf-8?B?UklYSm9nL2RIMzdtRysyWUtYc2dlc1JxWHJxaHJ3S1Yxem12dUNDZGRUSEds?=
 =?utf-8?B?WlFDTXh1VVM0UjljRkJMVHhFeUhCTEQ0dkYwRXlOdDhtUUNVVXV0MVhoRFdV?=
 =?utf-8?B?d3AzNWdMaWd5b0NRb2laeHFsMVYxaERZOWd0bEZxY0o1R0J5VFEwSVlkNkpm?=
 =?utf-8?B?akZRUUFwS1QyNjNYL3BvcTN4R01COVB5bkMyQzJCMEk0b2F3T2E0V0EvYXU1?=
 =?utf-8?B?ak9WeGRtTmxwRWZxM2kxOHlXeXdHQlBGSjJyam5va0o1bXFJVGxpQmpyVXRT?=
 =?utf-8?B?R1pXblZmbWFoTXlKMzJKb0YxMEJzOUtpaFJUR0Z1NXkrYXNBdzBxUXArSVJv?=
 =?utf-8?B?MlJ1cWZMUCt5UXhiTkpDTTJqQzdicStpaDA3SXpSVzR4RTZKQmZ6Y2Rqdk9Y?=
 =?utf-8?B?dUk0S2VCajQvdWZ4bTBDeTBRWUZ6bHg0a2p3NldaYmUyNjUxZEdjMjN5ZFpJ?=
 =?utf-8?B?bE51T2x6ZjhhbGJqUHA1QUxERXFlT3YwTFBkRmpKbS9hTVc2UnQxdlg1Zjg5?=
 =?utf-8?B?ckJkNmc2OVYvUDhqai9HYi9nWFNYV0Flbk1sTlhySFNFZU53SHA1a01GaVhD?=
 =?utf-8?B?V0xUV3YvcVRBbkhXYWRkS3Vua2xEZW1WNGdyUkc4a0Z0d1VOSDFtd2tHVzd6?=
 =?utf-8?B?dEI1ZjJWN3JZRTRncXhKeTQvODV1ZXdmUHA4cTg5WURUUTk3R2tKaDBsNHJr?=
 =?utf-8?B?TmowU2wrQnpBM0YvRjJjMHllSzZiT1pSTG5jeTM4NWkxVEFBUCtpNFluZGFH?=
 =?utf-8?B?blY2ZG5WUWpSeVhZeCs3dm5tVU1WOFdUeG5TclA0MFMwK1pXYzJEcjlScWhT?=
 =?utf-8?B?MkpEaTdPS0lKWC8zT3Q4K2crTEdXOXNIYnJyVXRLaVJsclgxbXR6WjRJSnRR?=
 =?utf-8?B?Q3lFbURMZGJaRFFadTMxUi9MVXdFZ1E5b2FkbWVxRkJCUzZqSytjaHFEVlVW?=
 =?utf-8?B?ak83WXNnM210Y0hWZU1sQmswQ052ais2S0hTRitiUkZDa0s3ODlXeDlRSHpp?=
 =?utf-8?B?YzV0aWh1RXg1R3dISFU0ZHpRODN1T3JEcXJBTE5XUmVwSUtjSDBobGpkVDNh?=
 =?utf-8?B?ZVBuVE9OYjdOQ3hoMkNKa0E0UDhwUkpLRUI2dExjZi92M1hZNS9LNDBmT3Ru?=
 =?utf-8?B?c05WdzV4RGRmbjQ0RGtXbFNSTmQvbERIZmdab0VmUTRkcWpncHF6aitINldi?=
 =?utf-8?B?STZkekVhT1NnTGVHcW42Zm9kZjVEaDhBTnNtTWpZMDQrMXhXeVZoWkwxcUJa?=
 =?utf-8?B?TEE1WEl0UlgyVFFUQjJ6ZUxycEJaZ1NrQUFuQ1VQUWFsU3BYa09rZ1BSSisx?=
 =?utf-8?B?Qy9qMEphRzA1VlgxNE9YZGozR3ZEK1pySjgvVG80cVp3UTliaFJueXpnZ210?=
 =?utf-8?Q?pvfLtk8H+LRVlnTfsI8Tovn+VUbLvimg?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5807.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <48E2667E8143DE4ABE0823D9E4A1F159@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7699
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:1b2::22];domain=VE1PR08MB5807.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a86b866-8fc2-45d9-be21-08dd4a7bf378
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGFJQUpZT0x6OFRPc2FnWWYxRVZ2SytKbklnZWR3Q29Wc2hYRzMyZlFTSXB2?=
 =?utf-8?B?RE80R1YycEk3U1ZuSitNdGNhak9wdUFXcGIxcnBIZVJCd0VySjFhcExaa0gy?=
 =?utf-8?B?OUN3QzkvMDF4N3grVmFJTytXcCtpMVZzZHZYbEF2VmdQTDFibkJZbHhKSmRT?=
 =?utf-8?B?ZTJEZjlMcEpVMmh1ZVVQQk1rSlMxcXU2WE1ZQytSWDFRSXdNbjlQclFwNmJa?=
 =?utf-8?B?bUowVE1Mc0x0ajR0SVREVkVVSitIb2FsUzhaaEdiR2pOdnFoVEdwYkgreXk1?=
 =?utf-8?B?M3VEWE8vUHlWbFh1UG9HbGRORGlEVStLVGpIV09qZE5uWmpvTzA3Q3NDQmJC?=
 =?utf-8?B?TUNINE5HVll0cFJhNmlIcXhsNmMzYlRtdzY0NHdvRVl0NHU1Y0FTSlFuNVZa?=
 =?utf-8?B?dVdWTnZMZkJZYkpIUGpkN2ZqK3BFMjRKdDNrdW45VTd1T1VVNDkzZTFDcUQy?=
 =?utf-8?B?bUNKT2xoNzJkdkhpYlAvLzNXQXI3ekFJWmFYYkVWYjhtaG1Vd0pIQ24veTdw?=
 =?utf-8?B?QWg5N2lLRGZ6dXpNWnpVU1hkOXRjK1pTbjZlbnovdFEvYUdMSVJKcW9VN1ox?=
 =?utf-8?B?OEJzVExNU1JOU3Q4RmRBdndoZWNQNW00ZWx3RUV3Mlo1RTJGVkJQMmx0cmQw?=
 =?utf-8?B?RzBzdVZJL01qSFd4UVE5MklPbmYxa054N29sV05aK01HZExsQjhodzdTdVll?=
 =?utf-8?B?bG1LU3FqTC9ibWIzazgxY3VBbWNJQ2lYT0cyZllCNllCTDRDVStSQ2dvcHU2?=
 =?utf-8?B?Zk1kck9UVkFqUmV4dGNvd21RT0oyeG0ydmtvenl3Z0p5bDlMdWI1TFhwUjFK?=
 =?utf-8?B?K2ZETnpSOGE0RmhkWnErTDAxTkhDTlNGa1BXVm96dXNsUmFNbTZzbnBpd2pt?=
 =?utf-8?B?VTdSaWduQXBaMk1OVGMvd1JEdGM1ZDNiUmFOaWxPOFo3OG5yaTNPdS9QZDNp?=
 =?utf-8?B?V25RL2Z1Wi9aYkMwTWNseDgvVmZhYis5RjZNRVlpdTgyYzJ1Y0JLVlYzSTNu?=
 =?utf-8?B?bXBrM2xYWllLdkpUTzBIMWJua0l2ZVFxYnBvZE1DTDloeHVVaDluVUV0QW1L?=
 =?utf-8?B?cXlmVmt0YUZxMTJqYzhySXFyeHBnK2w4cFgvRS9XR3pGNDJEaE15UXF0R2J5?=
 =?utf-8?B?SEVFYWxWUE9oWDJubU1NbWI0eDZ0OUhRZTFYbXNxUFBWV3BBa1M5NHI3NDRX?=
 =?utf-8?B?OGJMMnFhL2gvTUJCdVYycU5HcFpDSTdmL0d5UVNBSStGN0Zpb3FxMmNGL05z?=
 =?utf-8?B?STFnRjhuUW80bnRBVGgzZHg1WnRQL2ZNclhyeUNzdWl2TmVHaVp0SUUxb1I2?=
 =?utf-8?B?aTdLdUM4M2V2dHM4b09qTWJxRG5BM2dMY2FUaWQ5Y1YwNFlnZkQzc2ZKUExP?=
 =?utf-8?B?NUMwUTNnQUlkMk5oZ2JxMGY0eDlqKzN1VHp2TlVZeVhuWk1UWEcxcXlBWnc2?=
 =?utf-8?B?SkFvWDFnK0lvMmcxNXdQOGplcEdqMTZmYTEvWnd6dDJBMUhqN1VGc1N1czhJ?=
 =?utf-8?B?MGRsMlRtR1NaNFVNY0pWZnR3dnpYcnJ3VUxJeFlvY0NMdUpJRkYxSFNBTVJn?=
 =?utf-8?B?dDZaS2plQUZ5Q0NCT0w0N29EcHVsekdJREUwdmRwSG9xR25lU01zWW5BZUhL?=
 =?utf-8?B?Y1gybkJGYktyVVNCZ1BrMFN2a0pEWUxxRStERnA1cTRBRTIxN01sZGtzWlQr?=
 =?utf-8?B?MFFyV2pCc0lHL2tESEVrS1hML1JHZTdzZEZsVm9uMjlacXhJRXBCeVdyM1Q1?=
 =?utf-8?B?ckhvQkFUcEJrOHloNzlzN05aMFZjd1RnRHdEUEpLNTN0WEJTd21ESW1SV2Ji?=
 =?utf-8?B?b0t4WEYzT2RjU2NjRit5YjZmL0pFajY5OTVFOTdSOVoxRnpsZ2I0RlFFNmds?=
 =?utf-8?B?STNUQW5oY3ZpT2NHZTFDN0ZJYXZNb285WXREdGNlN3VaNW1BdmRnR3dkN0pp?=
 =?utf-8?B?QVpidUU5dzhodnB4Y2hPOE51dDM0aklSblF1Y21YTEozdi9SdDRKeXhteFJT?=
 =?utf-8?Q?7GRv3RFKBtgxYGKj5lxRyo6I8G5u58=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:10:49.3502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3cb261-45af-432c-c9db-08dd4a7bfa1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6231

SGkgUm9nZXIsDQoNCj4+IA0KPj4gMykgVGhlIHNpemUgb2YgdGhlIHBhdGNoIGFmdGVyIGFwcGx5
aW5nIGNsYW5nLWZvcm1hdCBpcyBodWdlLiBSZWFsbHkuIFNvbWV0aGluZw0KPj4gbGlrZSA5IE1C
LiBFdmVuIGlmIGV2ZXJ5b25lIGFncmVlcyB0aGF0IHRoZSBhcHByb2FjaCBpcyBnb29kIGFuZCB3
ZSBjYW4gcHJvY2VlZA0KPj4gd2l0aCBpdCwgaXQgaXMgaGlnaGx5IHVubGlrZWx5IGFueW9uZSB3
aWxsIGJlIGFibGUgdG8gcmV2aWV3IGl0LiBDb25zaWRlcmluZw0KPj4gdGhhdCBuZXcgcGF0Y2hl
cyBhcmUgYmVpbmcgYWRkZWQgdG8gdGhlIHVwc3RyZWFtIGR1cmluZyBzdWNoIGEgcmV2aWV3LCBp
dCBtYXkNCj4+IGFsc28gbGVhZCB0byBuZXcgY29kZSBzdHlsZSB2aW9sYXRpb25zIG9yIHJlcXVp
cmUgYSBuZXcgcmV2aWV3IG9mIHRoYXQgaHVnZQ0KPj4gcGF0Y2guDQo+IA0KPiBJIHRoaW5rIHRo
aXMgYXBwcm9hY2ggaXMgZGlmZmljdWx0LiAgSXQgd291bGQgbGlrZWx5IGludHJvZHVjZSBhIGxv
dA0KPiBvZiBub2lzZSB3aGVuIHVzaW5nIGBnaXQgYmxhbWVgIChJIGtub3csIGl0J3MganVzdCBv
bmUgZXh0cmEganVtcCwNCj4gYnV0Li4uKSwgcGx1cyB3b3VsZCBsaWtlbHkgYnJlYWsgZXZlcnkg
cGF0Y2ggdGhhdCB3ZSBjdXJyZW50bHkgaGF2ZQ0KPiBpbi1mbGlnaHQuDQoNCkkgdGhpbmsgd2Ug
YWxyZWFkeSBkaXNjdXNzZWQgdGhpcyBpbiB0aGUgcGFzdCBhbmQgaGF2aW5nIHNvbWUgY2h1cm4g
d2FzIGFjY2VwdGVkLA0KYWxzbyBhYm91dCBicmVha2luZyBleGlzdGluZyBwYXRjaGVzLCBldmVy
eSBjaGFuZ2UgbWVyZ2VkIGhhcyB0aGUgcG90ZW50aWFsIHRvIGRvDQp0aGF0LCB0aGlzIG9uZSBp
cyBtb3JlIGxpa2VseSBidXQgaXTigJlzIHRoZSBnYW1lIEkgZ3Vlc3M/DQoNCj4gDQo+PiA0KSBX
aGljaCBjbGFuZy1mb3JtYXQgdmVyc2lvbiBzaG91bGQgd2Ugc2V0IGFzIHRoZSBvbmUgdXNlZCBi
eSBYZW4sIHNvIGl0IGlzDQo+PiBlYXN5IGZvciBldmVyeW9uZSB0byB1c2UgaXQgb24gdGhlaXIg
aG9zdHM/DQo+PiANCj4+IDUpIFlvdSBuYW1lIGl0LiBJIHRoaW5rIG1hbnkgcGVvcGxlIGluIHRo
ZSBjb21tdW5pdHkgY2FuIG5hbWUgdGhlaXIgcG9pbnRzIGZvcg0KPj4gYW5kIGFnYWluc3QgY2xh
bmctZm9ybWF0Lg0KPiANCj4gV2hhdCBhcmUgdGhlIHBhcnRzIG9mIG91ciBjb2Rpbmcgc3R5bGUg
dGhhdCBjbGFuZy1mb3JtYXQgY2Fubm90DQo+IGNvcnJlY3RseSByZXByZXNlbnQ/ICBDb3VsZCB5
b3UgbWFrZSBhIGxpc3Qgb2Ygd2hhdCB3b3VsZCBuZWVkIHRvDQo+IGNoYW5nZSBpbiBYZW4gY29k
aW5nIHN0eWxlIGZvciBpdCB0byBtYXRjaCBwZXJmZWN0bHkgd2hhdCBjbGFuZy1mb3JtYXQNCj4g
d2lsbCBjaGVjaz8NCg0Kd2UgYWxyZWFkeSB3ZW50IHRocm91Z2ggdGhhdCByb3V0ZSwgdGhlcmUg
aXMgbm8gY2hlY2tlciBhbnl3aGVyZSB0aGF0IG1hdGNoZXMNCnRoZSBYZW4gY29kaW5nIHN0eWxl
IHBlcmZlY3RseSwgc28gaXTigJlzIGVpdGhlciB3ZSBjaGFuZ2UgdGhlIGNvZGluZyBzdHlsZSBv
ciB3ZQ0KZG9u4oCZdCBwcm9jZWVkIGZ1cnRoZXIgd2l0aCBhbnkgYXV0b21hdGljIGNoZWNrDQoN
Cj4gDQo+IElkZWFsbHkgdGhlIGZpcnN0IHN0ZXAgd291bGQgYmUgdG8gcHJlcGFyZSBhIHBhdGNo
IHRvIGFkanVzdCB0aGUNCj4gY29kaW5nIHN0eWxlIHNvIGl0J3MgaW4gbGluZSB3aXRoIHdoYXQg
Y2xhbmctZm9ybWF0IHdpbGwgZG8uDQoNCkl04oCZcyBlYXN5IHRvIHNheSB0aGF0LCBidXQgZGlm
ZmljdWx0IHRvIGltcGxlbWVudCwgaWYgd2UgY291bGQgYWNjZXB0IHRoZSBjbGFuZy1mb3JtYXQN
CnJ1bGVzIGl0IHdvdWxkIGJlIGVhc2llciB0byBhZG9wdCB0aGUgY29uZmlndXJhdGlvbiBpdHNl
bGYgYXMgY29kaW5nIHN0eWxlLCBtYXliZQ0KZW5oYW5jZWQgd2l0aCBzb21lIGNvbW1lbnRzLg0K
DQpDaGVlcnMsDQpMdWNh


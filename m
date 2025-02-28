Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8621EA49A8B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 14:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898739.1307241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to0TU-0001vx-J5; Fri, 28 Feb 2025 13:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898739.1307241; Fri, 28 Feb 2025 13:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to0TU-0001uE-Fl; Fri, 28 Feb 2025 13:32:20 +0000
Received: by outflank-mailman (input) for mailman id 898739;
 Fri, 28 Feb 2025 13:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1to0TT-0001u1-7Q
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 13:32:19 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2607::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e5ba427-f5d8-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 14:32:18 +0100 (CET)
Received: from PA7P264CA0308.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:395::23)
 by PR3PR08MB5610.eurprd08.prod.outlook.com (2603:10a6:102:91::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 13:32:13 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:102:395:cafe::33) by PA7P264CA0308.outlook.office365.com
 (2603:10a6:102:395::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 13:32:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Fri, 28 Feb 2025 13:32:12 +0000
Received: ("Tessian outbound 0a056dca8bdd:v585");
 Fri, 28 Feb 2025 13:32:11 +0000
Received: from L54f6368b9f79.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B888B6B0-64CC-4EDA-9EE7-B59E9B6BF6D1.1; 
 Fri, 28 Feb 2025 13:32:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L54f6368b9f79.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 28 Feb 2025 13:32:05 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB8057.eurprd08.prod.outlook.com (2603:10a6:150:97::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 13:32:02 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 13:32:02 +0000
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
X-Inumbo-ID: 6e5ba427-f5d8-11ef-9aaf-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JhBoSeHTHn9PvFr2FrPfZvmfgGmspwMMnOT80wwOWzGY8o+CDxqOT2Og2S8dPi1uOauXJC4hrtNoR7rsuXKxVv+tpe/BIgbtooLL+y+nikexFxITvizm7yj1JfF7o0P9R1H3ES1VDBpkvT43W30C/rZ+VvbWhwjF6fdq5mQRaPQrvQtp8b+dRoYytjhbd89vK5EiZaFBQmBZw0Qm7F5I2h3cPzEhXWK6kvffOy6paYPFDAI3FPONzbVbHZkqjwIK05CYKL95c1825uCXV5liG9kmXmKJf5LCHqgM0x7USVgODoK38UIZ/T6q7CsRkC4fhv+w6TIlpvsVw2YbzvaOVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNzYYsP4FeSvOWqeroEvJkXrv3GztU/Cr5n5PE0niJc=;
 b=suLz2KpJCvWIbkgXoXOjZt7svw7HXfkA5d6HjCqAWcFLYC2J1Kp2sP9Y5nSnif6UzRSDB53SGYzKCR0m97FiexBk9q+RVoqO3IBPsjXugENp7/uO0d8Lvfvce7SUQBgDFORVvZAbAkVJq2yOU3YlRsx7sahfuLt2ShTYGY/DROEPjClUJWeVjXmgYiRELjQ+YXqfxYA3wed8FEbaJJzc4dm0YxAmXfO279KVjKis/8e9OsCgI6gGDTAyPgA7w7jfxRwxGuLTVecdiZEsjZJE1Lfg5lrDPbL+ZZIfw/MmVmOq5eYCLufmB9P/h8GSUeF6EbjBSx0tlJ6ksCBxxMjVxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNzYYsP4FeSvOWqeroEvJkXrv3GztU/Cr5n5PE0niJc=;
 b=S4YwE6/z/jfmQYTPBNZCn53z3djCtR1LUscF9nDX5S+9fwHQ9hSKFDHAdF3HgcCDq2hlwztUEFAnj6FQqhgQM8vc/20n4cgiw7tDKxrTtVa0iZLJuLVJJkECCwUJuCKPwfEkv1Z94r6UvjrCIv/KX0ftXpyabffEDpSnv3twf/4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9fccc9637580d4c
X-TessianGatewayMetadata: 21/z6s6TRSpm0xBpJvb76JfcgWwlcBCvUCvh9Oz5HxiJ5JDRD62VT4kq1uJ2Rd+EE36qr7VSJtIttdawXJSkOZV90oRdX2t6MoSiBmfIeqCyjbuMfwZ8xaamoj9ePFPZDHQR1sTgYGPRANuaZOmXwUBYpNEovMVnCBnOFs47tTQ=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sa43kEmixeClAXEuVLiSvg3CM1haCMLknEaba0GQCU0438yz7lDub5BcEejCx/7YcP+Tr+MbIOyKANCv3hdDayiAhhvYVKGelwgZ+BSZvgqr+YDb0gDJOARALbbZ1K9banvfdcGkOqBrVgQMysXvGmZBe0GgrwTyr7GEeFhjwNQHHC2LhjCx8lSO0GgYRNg/gHqtfSFhbdtnX3hIb0kixy45wU0V136Kpn3bMMb6DWxJGAN47TIKum8QrdrIdq3XLeWp4aaFDUtHsJxkrYPw7GvbIRS35++vMr5oEwfs153qCEMdb6Oavl29YMPFduSSr4wL4T8x3FOU7rhMFXLF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNzYYsP4FeSvOWqeroEvJkXrv3GztU/Cr5n5PE0niJc=;
 b=OGvlNGvuBhaoU3AXiWHwcKhK411fd2hU1SSYh1Ltp3VwBTCm+S0dA/A6CuOc2BJlcJBLUlVTIgyiiziGH08lDPvd4OOb5RdIipD6Kbu7w+OlsgCDpUQmr6fMYNfY0hSeWNtB971CFCyMKxtgmzh/q2sT/ZXt7+O6se2CpKo7l9BEpqd6I0EUcUcLkKiAKUuOTRmdUM4TxHLL9tvdh2E/eJUCI9CBVOEy/3kK2sq2Lwasm8rrcE6TWXUYjEkdMPbYr35Uh3hZ25WF6mgHfHyjDYMPmkBOz2os5/NZQIRQxewAOcoS0PrCL3PS8vgYJjPO9gVgDuMsQEpuu3xs0501xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNzYYsP4FeSvOWqeroEvJkXrv3GztU/Cr5n5PE0niJc=;
 b=S4YwE6/z/jfmQYTPBNZCn53z3djCtR1LUscF9nDX5S+9fwHQ9hSKFDHAdF3HgcCDq2hlwztUEFAnj6FQqhgQM8vc/20n4cgiw7tDKxrTtVa0iZLJuLVJJkECCwUJuCKPwfEkv1Z94r6UvjrCIv/KX0ftXpyabffEDpSnv3twf/4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>
Subject: Re: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Topic: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Index: AQHbiSmfhnajI8fAUU6893mrw5oGSLNcaxGAgAAw0QCAABwKgA==
Date: Fri, 28 Feb 2025 13:32:02 +0000
Message-ID: <344012CB-AF81-4AA1-981C-8B96FF5C2E45@arm.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
 <9e52cffd-6286-442b-88d7-06eb07de3213@xen.org>
 <e1509155-5910-4c79-9046-7497da9f626e@amd.com>
In-Reply-To: <e1509155-5910-4c79-9046-7497da9f626e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB8057:EE_|AMS0EPF000001AC:EE_|PR3PR08MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: b03f84ef-ef85-4c65-ca29-08dd57fc4ed4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?tLKXKa1VhdGlW+3cUXfO3zBT3PSMgHtseIqMwfAH4Lf7qtJJ5susjkjxUE8B?=
 =?us-ascii?Q?fRaydqz2FmohklVvMKRbt62M3ZA0xy3EzPF4ewbtha/Fqijdl2iztd0+bM0S?=
 =?us-ascii?Q?SGPcisvajfelzDnwJ8Q0dqt29Iy479qGl8tUIoSB7UzmfBT9cyaPp58FvDwB?=
 =?us-ascii?Q?xHdyC8IHaKd9c18IEG3P2zF4O4D1oV7UrZ6zJJIU6l/3Al4zzzQQgz4yNxsP?=
 =?us-ascii?Q?BZ4h/X1OIJvYrVD7JpxHuPxxRl9NmpMfw0ASg7xSRDjGKQ7A3xHEUnLMFPB6?=
 =?us-ascii?Q?FP8oC4qZU9I8t4ehswWy3zHeunRQwJB6HAZWHFGI8wOIyBUQFHMZNCSO3D2v?=
 =?us-ascii?Q?A4X9bFO0cLzN3IFbDNEUITxqBWF3EtwTEMq/IgNZoFlaOg2q9Tt71ZqnjhYJ?=
 =?us-ascii?Q?Dz3Ah1kQKUocnPf069PflkFGHG5f5N+hlJs3Qm00812PG+0muJBFdELic7ki?=
 =?us-ascii?Q?krA6PE3grjzoq09F1zLU61BB/lZ3KN8tZEuddBJ4jKuolzH51TShLBBjKTHA?=
 =?us-ascii?Q?5TsabV297RuIS/COJ9a6L21u4/vy55LJ05yo2IFSGaaZVGCzzoFVrW4qwDDs?=
 =?us-ascii?Q?2VvTrdHyL5XM2H5OqhC8qAosuFc8IBLDGmVr+oQUXDOdmj1ZQAVNNNlCK8x3?=
 =?us-ascii?Q?2FwAsTEhKBpf5D3BmeuXJ8/bRLtCkL2q3bVya6ImsJi4ceFXTF3kujDHCnbI?=
 =?us-ascii?Q?lYp8MwYKbqjTSeLo2RivCLH6tqtSdzHYPoQQ9Scq4r1Ee3Oet5bKTv26OC+e?=
 =?us-ascii?Q?Z9rsVWyZ/3jNMEFib2ffIS48VMHZdpH8IAMKu+NrYQoxyJEH4vsn5Wdigaj2?=
 =?us-ascii?Q?rHQOybYvWuym/DsIKfxzzeO5XXIxk5XIreD4dCJ+z0DigzFWEIE4hCmbNu4f?=
 =?us-ascii?Q?/JBLbsDTThGMlLBtpocygnkVf3fmsO0uwQ26thqdJRLayi+iALt/uooWnuo0?=
 =?us-ascii?Q?ZDHjIlMNk2ofb4zMdsbdm38odiuvvwQx0twtYNWZ6eOwoU4o/gGAOEUJ4bl2?=
 =?us-ascii?Q?ROhieMGXKMzqejgvWCA/TcFMcpNAHEdcT/7mVTVqw0+E16a9iECuEZAXlwkZ?=
 =?us-ascii?Q?tbJwgVtQ8OexGxZXRsRYZs9uafP1Jc9OYmnXZV/vR+qGs6jAjznC48CjN2h6?=
 =?us-ascii?Q?khZLZKueUa1UcKKKBTZqZwQ5T/8XBAjB9hPPVaWUUW1yDPHpjmkFi75u9qZX?=
 =?us-ascii?Q?SX/XCtt0QS/GmEuWYp26mVUsT8ilogUuc0F4CQDK6jLQaJbSgsw6ZWeUK5Up?=
 =?us-ascii?Q?74X2gAsL0oJEGpA0Jx0kVPN7qQDcr92uI0RaV8gjiwmXGYfOTbqea8R01TBV?=
 =?us-ascii?Q?JZZihuVl9b9Qg2t+GawiDWnUnLD4HAYHAY0ooGyqvIeE1IJaapWyMq+ia8IY?=
 =?us-ascii?Q?Lfl/BC1QoUG19+1cFhRCQq21E/K9JNs++oKVYhHVcXd2k+a3GA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2D02290EA41AE64C9171F3DD91D5E40E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8057
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b847a645-4014-4e55-e391-08dd57fc48db
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|82310400026|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/MY2rRvzqO8TTRCKWh1uB6TRUCIU+p7P+T+IbwYlrYWQoqSvNa0x2SoCwmfs?=
 =?us-ascii?Q?/OBVacIIOyhastlGmMkmbgWRnL7gYRbcHRmu8gYYOeu5I3OcrUAdIsweouRi?=
 =?us-ascii?Q?9c+xfoMp01cCLG+fzf6KqXO7BrwTxeIROiiHid47LpL4Xk0yYxd3GuaFiQ4W?=
 =?us-ascii?Q?u4lTTYKUcgykjz9LaO5o3W8qG4uSQTFjrKxIwjiSZI4BfZTl6IXDqdDKzby0?=
 =?us-ascii?Q?z5mCIfBZPWLOzRAN+Idkk5IU7UNKDanxfsB7Vdh3R/16yoX0fN7nDh2Ck9ug?=
 =?us-ascii?Q?+l7aaTcbOJf0AEbjzNCBO8GcAQadvsMmI2hLbh2Oi7jnWhvjWZkjtQ5oks7J?=
 =?us-ascii?Q?W2/uxbjNtVOPm6NNVd9yDv6W+Qkh3rC805QOt9keYZ4BXxcvAcybFWzfIs0H?=
 =?us-ascii?Q?fWuueWuxf04AAtUtUiODqa+5yo5IZ7h6HA4Ob178QcvHRfhW5yVPoGKyW671?=
 =?us-ascii?Q?KvQiO8abB9sDdXRXUFgeVWfosjmBznZyRPTtGQPrik1BnCCVc1eZi0YIThah?=
 =?us-ascii?Q?Bb3O+hms56SgEjysp0Ne/KaHWIM3tvvmzBVROfEbq8vB6TzoQ7SijtWjnvAO?=
 =?us-ascii?Q?/lguDBxC1926YT5X49yL3URvGo1Xu3HX/kWRcUwHSoFIzLIU6zC4sf/bg5A9?=
 =?us-ascii?Q?5EnlQpyZrlmYMzRzxDGuv5I/m20hjELS2GLsKqfdmoO9Jcd6drdfcfSdw66L?=
 =?us-ascii?Q?AcPSSgjGxVaP7cBLYoZ4vTpBU9S5O/x9HXPtI4ZVNo2DGPljxntzatxJyzX/?=
 =?us-ascii?Q?6NQwN2nnqsJsYoT0/CGQBU+idpAMi3npIdAZM21FjKqLy8YTZeR/ydQHys04?=
 =?us-ascii?Q?3Is4eUyeGNXl7mgnA+hsEFDTHi33rVIOEmHEdSJWzk5yixfmU3dor6zRz7BH?=
 =?us-ascii?Q?F+Q1EAB/RSeDT2bEPE7/QtMs418XAeI3n5l5bb7k665Bo3LDX9tsflsNLj2p?=
 =?us-ascii?Q?EXQ/Z3K19zqBHqHj+eGFXii+xH4UnBfCDEQnLTJK71Ki5IvZPo9gkoGIPDFH?=
 =?us-ascii?Q?tMAiR2KuaNFrfxeagjg9R6pah5xf0pMHM0T8ug1pvVltI9R/ldOY0M0PUPWL?=
 =?us-ascii?Q?ap6J32bWhCMgJXw6cw7wM3NFCD/pLuk+tOHLiSgxO3J1pviAWpazuAysSbuQ?=
 =?us-ascii?Q?L9FBGjd/r9F4GQZl1di0SN00Ox6KHJl7XKVCdOwb5O2cn23ul+GO9QkjwZE7?=
 =?us-ascii?Q?193fHweRAhBjOl70y7NxDo7N1GUG7OJ/T/kzM3cGDKdxTZWUG7WCNLR+e9P+?=
 =?us-ascii?Q?s8OgzVTBcZ6BfkvPwtYzAgrFFKB7LDE6ItXFHEgNm1sAidUNqqGSRuI9OdMH?=
 =?us-ascii?Q?jqF21SMAJRSM+KAunbFE+mrNWppyL5+6FFOYB0BjiGwb84ZCN8fhExVJ3Urt?=
 =?us-ascii?Q?mx2nAytnIoeTMsL7KZnfyY9Kb0JpKDyQgYaNvqQ0Zdu0JYn4o8K+NwmbZI2l?=
 =?us-ascii?Q?kiLWDRhzNTuBeMBbHLyk1soOOFLumx8D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(82310400026)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 13:32:12.1640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b03f84ef-ef85-4c65-ca29-08dd57fc4ed4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5610

Hi Ayan,

> On 28 Feb 2025, at 12:51, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 28/02/2025 08:56, Julien Grall wrote:
>> Hi,
> Hi Julien/Bertrand,
>>=20
>> On 27/02/2025 15:09, Ayan Kumar Halder wrote:
>>> In the current patch, we have defined the requirements which are common=
 for
>>> all the commands.
>>>=20
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>>=20
>>> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does n=
ot return
>>> 0 for success in all the cases.
>>> 2. Reworded the requirements so as to write them from Xen's perspective=
 (not
>>> domain's perspective).
>>>=20
>>>   .../fusa/reqs/design-reqs/arm64/hypercall.rst | 55 +++++++++++++++++
>>>   docs/fusa/reqs/index.rst                      |  2 +
>>>   docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>>>   .../reqs/product-reqs/version_hypercall.rst   | 61 ++++++++++++++++++=
+
>>>   4 files changed, 134 insertions(+)
>>>   create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>>   create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>>=20
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa=
/reqs/design-reqs/arm64/hypercall.rst
>>> new file mode 100644
>>> index 0000000000..ffd883260c
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>> @@ -0,0 +1,55 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Hypercall
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Instruction
>>> +-----------
>>> +
>>> +`XenSwdgn~arm64_hyp_instr~1`
>>> +
>>> +Description:
>>> +Xen shall treat domain hypercall exception as hypercall requests.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Hypercall is one of the communication mechanism between Xen and domain=
s.
>>> +Domains use hypercalls for various requests to Xen.
>>> +Domains use 'hvc' instruction to invoke hypercalls.
>>=20
>> Are you trying to describe any hypercalls (e.g. SMCCC, Xen...) or just t=
he Xen one? If the latter, only "hvc #0xEA1" will be used for Xen hypercall=
s. Other immediate/space will be used for something different (i.e. #0 is u=
sed for SMCCC).
> Yes, only the Xen one. I will mention "hvc #0xEA1".
>>=20
>> > +> +Covers:
>>> + - `XenProd~version_hyp_first_param~1`
>>> + - `XenProd~version_hyp_second_param~1`
>>> +
>>> +Parameters
>>> +----------
>>> +
>>> +`XenSwdgn~arm64_hyp_param~1`
>>> +
>>> +Description:
>>> +Xen shall use x0 to read the first parameter, x1 for second parameter =
and so
>>> +on, for domain hypercall requests.
>>=20
>> This implies we are supporting a large number of parameters. However, Xe=
n is only support 5 arguments. So I would just list all the registers.
>=20
> Xen shall use the first five cpu core registers to obtain the arguments f=
or domain hypercall requests. Xen shall read the first register for the fir=
st argument, second register for the second argument and so on.
>=20
> @Bertrand :- Does this look ok to you ? I deliberately changed from x0 to=
 first register so that this can be valid for both arm64 and arm32. Please =
comment.

Yes we should mention the 5 registers as those are the one supported by Xen=
 and also the register where the hypercall number is passed as mentioned af=
ter

Cheers
Bertrand

>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_first_param~1`
>>> + - `XenProd~version_hyp_second_param~1`
>>> +
>>=20
>> You don't seem to describe how the hypercall number is passed. Is this i=
ntended?
>=20
> Good catch. I will add a requirement.
>=20
> Xen shall read x16 to obtain the hypercall number.
>=20
> Xen shall read r12 to obtain the hypercall number.
>=20
>>=20
>>> +Return value
>>> +------------
>>> +
>>> +`XenSwdgn~arm64_ret_val~1`
>>> +
>>> +Description:
>>> +Xen shall store the return value in x0 register.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_ret_val~1`
>>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>>> index 1088a51d52..d8683edce7 100644
>>> --- a/docs/fusa/reqs/index.rst
>>> +++ b/docs/fusa/reqs/index.rst
>>> @@ -10,5 +10,7 @@ Requirements documentation
>>>      market-reqs/reqs
>>>      product-reqs/reqs
>>>      product-reqs/arm64/reqs
>>> +   product-reqs/version_hypercall
>>>      design-reqs/arm64/generic-timer
>>>      design-reqs/arm64/sbsa-uart
>>> +   design-reqs/arm64/hypercall
>>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/marke=
t-reqs/reqs.rst
>>> index 2d297ecc13..0e29fe5362 100644
>>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>>> @@ -79,3 +79,19 @@ Comments:
>>>     Needs:
>>>    - XenProd
>>> +
>>> +Version hypercall
>>> +-----------------
>>> +
>>> +`XenMkt~version_hypercall~1`
>>> +
>>> +Description:
>>> +Xen shall provide an interface for the domains to retrieve Xen's versi=
on, type
>>> +and compilation information.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Needs:
>>> + - XenProd
>>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/f=
usa/reqs/product-reqs/version_hypercall.rst
>>> new file mode 100644
>>> index 0000000000..03221f70c3
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>> @@ -0,0 +1,61 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Version hypercall
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +First Parameter
>>> +---------------
>>> +
>>> +`XenProd~version_hyp_first_param~1`
>>> +
>>> +Description:
>>> +Xen shall treat the first argument (as an integer) to denote the comma=
nd number
>>> +for the hypercall.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Second Parameter
>>> +----------------
>>> +
>>> +`XenProd~version_hyp_second_param~1`
>>> +
>>> +Description:
>>> +Xen shall treat the second argument as a virtual address to buffer in =
domain's
>>> +memory.
>>=20
>> We don't support any VA. The VA will need to be mapped with specifc attr=
ibutes (see include/public/arch-arm.h). Should this be mentioned in the req=
uirement?
>=20
> ....as a virtual address (mapped as Normal Inner Write-Back Outer Write-B=
ack Inner-Shareable) to buffer in domain's ....
>=20
> - Ayan
>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Return Value
>>> +------------
>>> +
>>> +`XenProd~version_hyp_ret_val~1`
>>> +
>>> +Description:
>>> +In case the hypercall fails, Xen shall return one of the error codes d=
efined
>>> +in http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include=
/public/errno.h.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> \ No newline at end of file




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B299CE532
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 15:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837700.1253615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBxkd-0005aO-61; Fri, 15 Nov 2024 14:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837700.1253615; Fri, 15 Nov 2024 14:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBxkd-0005Y6-3G; Fri, 15 Nov 2024 14:56:47 +0000
Received: by outflank-mailman (input) for mailman id 837700;
 Fri, 15 Nov 2024 14:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tBxkc-0005Y0-4s
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 14:56:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2613::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d299ade6-a361-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 15:56:41 +0100 (CET)
Received: from DB8PR09CA0010.eurprd09.prod.outlook.com (2603:10a6:10:a0::23)
 by PAXPR08MB7573.eurprd08.prod.outlook.com (2603:10a6:102:24f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 14:56:39 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::a7) by DB8PR09CA0010.outlook.office365.com
 (2603:10a6:10:a0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 14:56:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Fri, 15 Nov 2024 14:56:38 +0000
Received: ("Tessian outbound 99d3b165dfe9:v490");
 Fri, 15 Nov 2024 14:56:38 +0000
Received: from L5f5aeaf0fdc0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B0C98A08-F6FA-41BC-ACCD-F1769F940DBB.1; 
 Fri, 15 Nov 2024 14:56:31 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5f5aeaf0fdc0.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 15 Nov 2024 14:56:31 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAXPR08MB7383.eurprd08.prod.outlook.com (2603:10a6:102:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 14:56:26 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 14:56:26 +0000
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
X-Inumbo-ID: d299ade6-a361-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjJlIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQyOTlhZGU2LWEzNjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjgyNjAxLjYzNjYyOCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MhTbpO0gfdDguiiHb6Z5FCVqFidtjUjf6yVS93WIQRGiHKlNPMHZci2cj5gQbtfbJwaSyVBSyyNOaH+3tkdxrBmgpMfc8kvCJC6w8rLK3cT3fjTe7Yk1T6fqDPE8wM0e2gj5BaWr3YcdVQygXZ5UIT2XREQYro81rxfG9gXq6bbxVqF2Jj2/EyFIPPgK6KbfOQZES57YrVC1XcsOSgnD67K3Db1RJzH55pyi6hdmNH82ze7uEaWpbz6BxtwfRaDXhW+NzgdwSCQOsBHzeqFtY3Wc420gO3RFcBQnkv213ZcoRJ1plmHgnKArtzTFkVQzXVRH5Mzbd1rUx+DbHz6rRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQm5PRmAqPol3vKxgkvAEAE38jM0XehU8n7J78c1Av8=;
 b=tdslc9+Vs1uZCh1CMeJsu8+CFVm/89lUPQv4xrM6+FFdivjhuywq+7oWa5A6v2PCQGkp+Fz8OUq17lmYBp87yn1lGQtvrn5HZMuQ4Y8ql28gICJbBc2krLM2jrVZO5IL0Z+MRGga3chqq4DHcvFtekDSNqwU38oWMDAS3IQbAogmpkPtGkspwUhA2EZJL4U64yH3R5Y8S9Pf/rxhOIBqzrUwvk6TJE39rT+3M5gNd1jSoCgkX8btr5qpzirxnaNZiyP73KlJS2vzO5OU9/ExQiOZZH0F3fc1B0KJz6qFFBdt8uB/otCg9bJC/qm3bjjTEK/H8WMNJQf+qGly7Cd5Ug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQm5PRmAqPol3vKxgkvAEAE38jM0XehU8n7J78c1Av8=;
 b=XoHH+DGJCW+tJBPI9aFHs8xFMFNST9dlWlcQnktx5MobpieI8KuHieg2+xDJAmTLXJM+BNbls5eZVVZC9Z/4ID1RTvAw0pP/2WGRopIbIuoNlqftIv0cCUDvUjRtW6/r3ZPdG7apNAKw/ggP1ho6igVtYbL2NOxcBbrtEEYmMPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b535ff75437cf246
X-TessianGatewayMetadata: ddeGbUaeA+fLQu54FpLlpdF/j5qs8ua+o3QjNO9XyFjSGdi7ScP0aqNyjwPFnt3UUdVsDvf3MdIy5SVGTwLaZN1W7eJOauwXFzyygi3OYT3XrU1MUYcXbCbdgWXTzWO3LNjfBN5RoWUzFGO0E4Lc6A9CIRjvS3fLHy+G02vGPEA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKDrUQa9BaM+lMXLoVNlhnRKJEkgl/jP8gHn4vWax/FZwEswPy/R/8hsS+Pukn/z3Ri36kqJk9Ku/Ozl7kGaajBQdn8edlWp1b7fofApNuMZ3iGhc6S+Lb6M/WH6PpUY3C2pqmG/HrkTjyL8GQGYxB/baE26zyLIF+csqpnYNIigSYb60bDG9OJiS06ncJ7rcn7BCEWwjGbLKD5+TLxIP32X/RW0e8UCCDKsxB6wcBIKdc53lNgT26RdMilwHGBgoC/POfaqWqMtsaVzReMBhCRSdAQS028CMxHRtrTF8d5KjjBEKAF8YX2EEee2AdgKOd1ba/bOhuSTuINCQq4/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQm5PRmAqPol3vKxgkvAEAE38jM0XehU8n7J78c1Av8=;
 b=bqNVcsBnViCHYn2qedMWnAtRtlPKZJZwuxpezw9Lw1l1UCqikEfyicAZfZldNrCe2TaDBmzipiKY0yaKTqmg++GXRVVz5tWrTHivXHezz4KNlg+dCsaLk2cA7aGZT1o6AwmUdIKwOEYQCjLitwsn75EmM9zbg+CLj0MxJZEKZpzoIPDQ3SjTk/iZL4CsjeZiTosMTd0LITCpOWH3P4Dq2zFl/Si01dczQb3Nbe8nc/Ie86XT4fcsUDS/eZA3fLsJdw/Rnx9De2xBLAbb0jABi3629uc5VfIAGtdFornBDoQfFYizx9CP6NnlOrSYpzZxNS+B/NX9l83wDjHPy7PjIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQm5PRmAqPol3vKxgkvAEAE38jM0XehU8n7J78c1Av8=;
 b=XoHH+DGJCW+tJBPI9aFHs8xFMFNST9dlWlcQnktx5MobpieI8KuHieg2+xDJAmTLXJM+BNbls5eZVVZC9Z/4ID1RTvAw0pP/2WGRopIbIuoNlqftIv0cCUDvUjRtW6/r3ZPdG7apNAKw/ggP1ho6igVtYbL2NOxcBbrtEEYmMPw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Topic: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Index: AQHbN0xEMVIvN3HbzEuhbXugN/BCZLK4PUmAgAAELwCAAANMAIAAKZWA
Date: Fri, 15 Nov 2024 14:56:25 +0000
Message-ID: <EC8A6D23-6CB0-43AC-9C1C-675F2AC8EE06@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-2-luca.fancellu@arm.com>
 <2b13f12c-905d-478c-b525-a3a8c69d5ac7@citrix.com>
 <F693DC5E-C4E5-445C-AE3F-24EE76B34D90@arm.com>
 <f81d4195-a41f-4ec8-bc9e-3e836472469e@citrix.com>
In-Reply-To: <f81d4195-a41f-4ec8-bc9e-3e836472469e@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAXPR08MB7383:EE_|DB1PEPF000509FC:EE_|PAXPR08MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 63637ab7-2387-47a8-cc1e-08dd0585b52e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UXA1azdHb0MyRGhnbC9NV0F3TTBFTVIzaFNlOHBPZEpXak56dkEvUVVRd3Y0?=
 =?utf-8?B?OXlmRG0xTnhVREx4QTJCYzdGQVpwWjNpR1FGZm1CcCtKbEtOTWlBNWRxVUw3?=
 =?utf-8?B?ME9sTE9jTU9YOGFTbTdyMmozK1dsVE44OEZrTFRWOGNjOHVmemFhMzJzN1ZF?=
 =?utf-8?B?UldpdHpQSktOSzlqMDRsdTFiblBkeFVCbnp0SnhTdzZoSmFiNnlTYjNlRGRE?=
 =?utf-8?B?Mk5lTGlsUmEyS0dkTmZsL0NtUElneTdSWk90bEZaSTg5SE9tMXpwWlI2M0dv?=
 =?utf-8?B?MkY4RFVhb1E5cCtyN2dSYlc0cWRvMWNHanFHT0RvSytseFFDanR5cDZndGxw?=
 =?utf-8?B?SHdneUpoTyt0M2dSc0x1SzhXOThkOWJvczh2MWJ6MnR1b0ZRYXpiWm1kdzZx?=
 =?utf-8?B?S2YwWTNLaXJtRUtxb3VFS2tjRkVoSSt4OGVZeG00T3pMSGhMWExyN0F5TWhp?=
 =?utf-8?B?NUNHdzUxaytCb28ycUFmU2doaGcxMU1uUXZDdXQ1Ym5FV3ZhNXR3KzVFcHZy?=
 =?utf-8?B?eHNFelNsUU1vYUc5dHZidjBOY3R1d0N5NHZjbzZGb3BMa2RqeWlwWWNiUTJy?=
 =?utf-8?B?ZzNPcHMrbkNsd2V5V045UUpJdVRLdHJ4VlZENXRpdWphbWlrNjVRbVNWRjdR?=
 =?utf-8?B?SmJYalpZbkY4TXdEd0dCNjFBZWVTUGEwMXlvaTk1SHVQWG9NcVVpRFFabzFF?=
 =?utf-8?B?anJOYkhyNlNLZHdtZHJBTU9JOFBqZk5CN3BacDNoUVM1RnliM3F6ZW0ySytE?=
 =?utf-8?B?U2hKWUlWUEk5bVNvR2xXVDQ3RkhncHlqSXM5NnJJYUk4MFRZZ3FhU3JXME1k?=
 =?utf-8?B?NGlrL29sNHdYVlpBUU9sREVnMEFPTzVXeElXZXdLL2xFeFF3Sm5Hc3JRblNv?=
 =?utf-8?B?bkg4bmg5Zmw5bGV2RjVaUGQyUGllYnZCWnFwS3l6eXdSWHF5QnlhUTdCNXBm?=
 =?utf-8?B?Y1d4UitlcWRoRHFtTnlUcmdTYWlTSUs5VXVxYUNQZEVwd0Z6TTdhL2pyU29h?=
 =?utf-8?B?SlY1dWlZZm1mZWU1cVBZWmVkZWpLRzU4ckl1RjJwZkV1d0NFNkZ0eE9yRGI0?=
 =?utf-8?B?eTFpSk56dll2Z2s4Q2hiZlJ6eitjL3dKaG1QUSs3eFdCajZmejFTTWRHTGd4?=
 =?utf-8?B?cjcxLy9LSzlxeS9GdkZ4U2JVcTZmbVNVd2kyc2F0Rjd6aUJoMy80OUtIYWRm?=
 =?utf-8?B?VFd5d216Wlpid09WMU5aMElWek5RdEJaZGdIWkRzUms0V3p1M2pUbEVabzJ1?=
 =?utf-8?B?VEtHVlZzMzFucXdCdFVNTzZ2ZTYxVno4WkZ0WFBLVkRNVUJKRk9GSjB5cTUv?=
 =?utf-8?B?dGdqZHlhNTNDUm1ScWV0ejI4a3Q3WDRsdkJScWZjOFRjQjU2WlhZVktpRXQ4?=
 =?utf-8?B?ZlJQVEQyK21FUW5sR2JQWENOb2xubFBnMHY4azc3SWdxS0d4QlhSTDFWY1Fz?=
 =?utf-8?B?UjEyTnJpMDNoR0J0c2grSzVNcFdnREQ2UGtwUkFCL1VFRFFubWc2TFV2WE83?=
 =?utf-8?B?SzV0NzVwUkZhZGk2SHMzNWhUbURHOUZ4VHRxR2lrOUhQQytOMkxadXVPeURw?=
 =?utf-8?B?cDM5QXlhWEtYbUgyKzVuWEVMb1J0NXZaM09WdGRtZkNKa0VldjgxdS9ZVkhQ?=
 =?utf-8?B?R1Eva0FubDJ4VU96bkZJcUJKWnd5c1hrZkhTNU8rZk9LQWhsbzludEhuL1U0?=
 =?utf-8?B?Y3N6SW5YM1RBeExTUC9rUVU1djRTYUhZNFhzSzF3QStCcUpNM082TnhRWHoy?=
 =?utf-8?B?Um56aWJUYWY5bTJyaVhDY1BWQm55RmpmVERhekRhRlN1MnZpSkprTGxxeWdr?=
 =?utf-8?Q?nal3HKD7GpnXc+V5vldeax/S+/4ZdUR0SuSi8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B71484E1C5E2E42AE723D245250E148@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7383
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	699a3d78-7641-4b37-1b09-08dd0585adc0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTZ1YnZjZ1o5MFpoeUdUcFZYa01sRTJhdWlHVUpCaXFSOU8wRFJjU0NzSU53?=
 =?utf-8?B?TUhvNnRjMlpWY0lzMG45OXJhc1NOWkpiV0NlanMrMnE0U0FjdkpNS0ZVcEM4?=
 =?utf-8?B?bUtJckIyNlhBOGJKMitRMXErbVlBZVNZUTc3UGhpUndqR1FpWnVSZ1ZDd2h4?=
 =?utf-8?B?dTl0c2FteTUvQnFDTS9YT2NLTGdyRnVaQ2l6eEoxcS80Qlh1b1RDVGxFQk9P?=
 =?utf-8?B?V1JDQ25YOWF3NElHMzBJc0xET1ZzWEdNWHRhR2wyczhxcHJ1L0twQVhrc3BM?=
 =?utf-8?B?NGhHdzZQdlVZeU80SDZLWDhhRTZ6M0dGb2ZkYmVFMVQraGpjQ2VXQ01YWVg4?=
 =?utf-8?B?ZkgzTUc5UGZyOUg4Vi9qZTJYbDRhaGY4YWY3aElqTGE4QU1IQUJCNW1ZMkFF?=
 =?utf-8?B?Tk40LzFjKzhXQW1rbG80ZFZ6L2pRdGsxSDBUaGhuSzV3THFhK2w2SU1LSE03?=
 =?utf-8?B?L3VKeEhqaU5xMU5oOFB4UFFLOWFRc3IrL21nbS8yWm9DdWN4clhxRk9VUHNB?=
 =?utf-8?B?N2FGZ2k0WFJMK0NLOERSb1VITlBkTm1MdDVNQXBYMGQ1T2gybWJNS3MzdXF3?=
 =?utf-8?B?TFV1eWhQQTZUUHhBN0NsR01vMys4cW1HZmc5eWRHTk1RdlMrUzJLRHQvNGRJ?=
 =?utf-8?B?NmgwTTcvL095NjlwRFRyRzJ2TDRmRFkxMWVhc1hCMWRVTTBNV2ZjY2ZVT0Rq?=
 =?utf-8?B?c1ZmNmRmbTVweEZWa2NUd2Njd3VKMFhvaUxaV3VNeHN3NmU5cjJhelRqbFVK?=
 =?utf-8?B?Q1JFdkd1cnhoSUoyZXBhck9Rd1p1aTlibzFhY2M3Nkg5WWRwdjJGVnpEa2gr?=
 =?utf-8?B?RjdXY3V5TGIwOFpSMmlpKzVYLzRRVk82L3o5VWVGcmsyazlzZ01ySW83NVpX?=
 =?utf-8?B?K0hUdkplbysvc2w3N2liYTNzUnVWb1p4eDg0RWpRZGpuVXI3MVJUV2FxdHBJ?=
 =?utf-8?B?V3Q4QlMrTENjckdUNTJSQ21JbzRSTW53VkJzVmxWbFZSU0ZkVkNhV1VBc05F?=
 =?utf-8?B?Z1ZOa0pZeFZMRTRDRkI1ajlPYTJSS0tFY01Id25ZQnMxdE15QU1uNWczTVF1?=
 =?utf-8?B?Ym1FcER4ZC9HdWxIdGFlajBmeDk3SHl5MG4rQXE3bG9Ta1A3ZUZ0Q0RCeXJN?=
 =?utf-8?B?ME81TFFRVUFIMEYxN0czdngra2JpYWF6MjdvY0xYdm5WLzFYYSt5eUNMcVA4?=
 =?utf-8?B?bXhYKzNCb2taYytLTTFYTlBhK1hvRzZXc0R3WWY1d2Zibk5YYmxic0tLaE1T?=
 =?utf-8?B?YTcvc09SWnF1N0VwaloyWk5vQ21HMitvNEpTOFNOa1FQNzdsMU8rUjlKb3NV?=
 =?utf-8?B?V0ZQQ1cxaE9ucnMxSjhmTTh5ZGRvSUNXWWYxVnNRTDlVQjNwYmFaVWNTMGZS?=
 =?utf-8?B?YzhPY0dVcXdZYTNycGUxTUlDWFpjeFphS1dxQmU2bzY4WnMycGxmZjlmT0ov?=
 =?utf-8?B?Z3hBYVVsSms0cmVjVkZ3cURJM0NBOXNreTI3VXFkRk9RODF4YUNXaThjYU1o?=
 =?utf-8?B?bkpUK3dYYnN4T2pMbHBjOHlmRHBzUlc4YkdHa1NsSEFPK0xmRlErS3pXek5h?=
 =?utf-8?B?R0poUXQ1elFsd2hTMDhKcXpTdlVsT0ZQWWw0WFdQVG1WZWYwbTRtOHJpV09o?=
 =?utf-8?B?aTQzV0NGS3lpcmhDMDZoWXlHMnFoQmlCWThnR09QQVRKOWxmbWp1VkRoZkc4?=
 =?utf-8?B?YUI2T0Z6MC9rL2FFc1V0T0FPTTJCQXI4OEVQTmVka0RRWDZ6czFUdUZvNno0?=
 =?utf-8?B?SkdIRG13QWZBMHptT09pbjdWUGJ6Nm1zWjM4ZzcwaWc3ZWNSQ256bGlEZEYw?=
 =?utf-8?B?SUlPUnNBdmRrU0JlZnNYTmpJWkU4WTUwWmtuY1AyUDdIdlVvNlE1eWdKUmN5?=
 =?utf-8?B?VmtEekNVZGRUQmx3MElKeERoNFJudnI2bk84NUpIR2tHOFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 14:56:38.5010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63637ab7-2387-47a8-cc1e-08dd0585b52e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7573

SGkgQW5kcmV3LA0KDQo+Pj4+ICsNCj4+Pj4gK3ZvaWQgKl94dnJlYWxsb2Modm9pZCAqdmEsIHNp
emVfdCBzaXplLCB1bnNpZ25lZCBpbnQgYWxpZ24pDQo+Pj4+ICt7DQo+Pj4+ICsgICAgcmV0dXJu
IF94cmVhbGxvYyh2YSwgc2l6ZSwgYWxpZ24pOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICsjZW5k
aWYNCj4+PiBEb2VzIHRoaXMgcmVhbGx5IGNvbXBpbGUgd2l0aCB0aGUgd3JhcHBlcnMgbm90IGJl
aW5nIHN0YXRpYyBpbmxpbmUgPw0KPj4+IA0KPj4+IFRoYXQgYXNpZGUsIGNvdWxkIHdlIG5vdCBk
byB0aGlzIHVzaW5nIGNvbmRpdGlvbmFsIGFsaWFzZXMsIHJhdGhlciB0aGFuDQo+Pj4gd3JhcHBp
bmcgdGhlIGZ1bmN0aW9ucz8gIEl0IHdvdWxkIGNlcnRhaW5seSBiZSBzaG9ydGVyLCBjb2RlIHdp
c2UuDQo+PiBEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZSBiZWxvdz8NCj4+IA0KPj4gI2RlZmlu
ZSB4dmZyZWUgeGZyZWUNCj4+ICNkZWZpbmUgX3h2bWFsbG9jIF94bWFsbG9jDQo+PiBb4oCmXQ0K
PiANCj4gSSBtZWFuIF9fYXR0cmlidXRlX18oKF9fYWxpYXNfXygiIikpKQ0KPiANCj4gVGhlcmUg
YXJlIHR3byBleGFtcGxlcyBpbiB0cmVlIGFscmVhZHkuICBTZWUgZWZpX2NvbXBhdF9nZXRfaW5m
bygpIGJlaW5nDQo+IGFsaWFzZWQgdG8gZWZpX2dldF9pbmZvKCkNCj4gDQo+IEluIHRoaXMgY2Fz
ZSwgaW4gdGhlICFIQVNfVk1BUCBjYXNlLCB3ZSdkIGp1c3QgZGVjbGFyZSBfeG1hbGxvYygpIHRv
DQo+IGhhdmUgYW4gYWxpYXMgY2FsbGVkIF94dm1hbGxvYygpIHRvby4NCj4gDQo+IFRoaXMgYXZv
aWRzIG5lZWRpbmcgdG8gd3JhcCBldmVyeSBmdW5jdGlvbiBpbiB0aGUgaGVhZGVycy4NCg0KSeKA
mW0gZ2V0dGluZzoNCg0KZXJyb3I6IOKAmHh2ZnJlZeKAmSBhbGlhc2VkIHRvIHVuZGVmaW5lZCBz
eW1ib2wg4oCYeGZyZWXigJkNCg0KbG9va2luZyBpbnRvIHRoZSBkb2N1bWVudGF0aW9uIGl0IHNh
eXM6DQoNCuKAnEl0IGlzIGFuIGVycm9yIGlmIHRoZSBhbGlhcyB0YXJnZXQgaXMgbm90IGRlZmlu
ZWQgaW4gdGhlIHNhbWUgdHJhbnNsYXRpb24gdW5pdCBhcyB0aGUgYWxpYXMuIg0KDQpTbyBJIHRo
aW5rIEkgY2Fu4oCZdCB1c2UgdGhpcyBvbmUgaGVyZS4NCg0KU2hvdWxkIEkgY29udGludWUgdG8g
ZG8gaW4gdGhlIG90aGVyIHdheT8gT3IgdXNpbmcgI2RlZmluZT8NCg0KPiANCj4gfkFuZHJldw0K
DQo=


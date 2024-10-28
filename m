Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D769B351B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826676.1241022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RqD-0005vp-GT; Mon, 28 Oct 2024 15:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826676.1241022; Mon, 28 Oct 2024 15:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RqD-0005t1-DV; Mon, 28 Oct 2024 15:39:37 +0000
Received: by outflank-mailman (input) for mailman id 826676;
 Mon, 28 Oct 2024 15:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MlZD=RY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t5RqB-0005sq-BH
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:39:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f403:2614::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d41c0432-9542-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:39:33 +0100 (CET)
Received: from AM6PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:20b:2e::48)
 by DU0PR08MB8495.eurprd08.prod.outlook.com (2603:10a6:10:404::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 15:39:30 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:20b:2e:cafe::6c) by AM6PR05CA0035.outlook.office365.com
 (2603:10a6:20b:2e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25 via Frontend
 Transport; Mon, 28 Oct 2024 15:39:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.0 via
 Frontend Transport; Mon, 28 Oct 2024 15:39:30 +0000
Received: ("Tessian outbound 0fe1877cedb7:v490");
 Mon, 28 Oct 2024 15:39:29 +0000
Received: from Lee16b7e1f88f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 863B2CBE-E840-4887-A991-23212609DB9C.1; 
 Mon, 28 Oct 2024 15:39:19 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lee16b7e1f88f.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Oct 2024 15:39:18 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by GV1PR08MB7380.eurprd08.prod.outlook.com (2603:10a6:150:24::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 15:39:14 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 15:39:14 +0000
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
X-Inumbo-ID: d41c0432-9542-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vYAT6UL2fZZzy54VHBfrnoQAWqojYma9lVEUE00298X707Hr++uT2MGx+YWmszaGiFeuM0I1QeNPLpJSglxps7bodmGb0DusV4/3+XGKNi/6QCiYn/Lge7PY1YMs4akQF9E5Bk0jK0nppDxlzakeBe46UTYUeeXOdctSB4XZjDsg1UI0jSi1Z14gogscNnHCVsKwysPSRQS/8uJ+1ju/XcNrW3/1nK2TJcbWCia37jokQpg5B3VffFP6S86tgtN/8v1fkOEYzDR82xQaBlIjjBo0bX15BKn9U5Fyn8UaIsyc2f4ciKyZuunEL26E8HaEl+OjqUxMrTFNCJ82ouipnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JN8OndcgIf2vR/RE47v19PBB+J/xFSJ5aaC6NjQV+kI=;
 b=FNC7GKqcI6WwCUgOGIUlOnqAGgxK1lGrzYZiq2GAuE7xBzZ5ngvtE6p+zDz0euV1UGRJQkZZgiskoyZb/vzS6alZdfCulQ5thn0hwWXOTw+E6TUUGB0sBXnZS7xJsYUBC8x44QZcYF3b1QRzQc+b/QU4ZntXbtJ1uypUZdBtUA6X74xdvVeI8YDbhdaJcEDpyWQgoLq3eBWzddeaNc+VDBeI9ygLRkau7HchJ4K/J5J1xBcm9DyP3pSuX1/R9S0FJ4ViRKrtwVFWwfiGTvTuhBCSu/fZLDa5BV03rV+2QqCaeBHtd1l5sstrKMC7l+fjnXWXMeAhjUjVPrUlrqKKUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN8OndcgIf2vR/RE47v19PBB+J/xFSJ5aaC6NjQV+kI=;
 b=Q774YwFbUwQ1XoaTo1LRT1NqRwSheH3iB3RvYtpxeDWfbNnMcXAkso4kgoNFOzkSK476uaedb99vMC0YkVV7V9mZZ+irqeDEB+STDUrnFdjuDdbmCeEkusAg+YV76gQ9SI5aRsQCvZKciS+7Y8LM/D0m3Rcmp2n9TC/bToaupmA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8dc304bd9c8d3f7f
X-TessianGatewayMetadata: xeeKA7P0Pjw2XEYtvKBy74+cD0/sAj69WahCaxwc3GURACFDqEkPgnn8kifNcCl9+a3NHlrGH3ib53t4hNyPmSDFXrJzfQ2jJoiuws+jC86N9i9DeiOUoDQGI94+LK4e5JjvIxVYEnO4L2dVRGnoEZfdxyXBwg4XQ6gwpwUYMuU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0+YTshbXeEbEjPoEz+jArZq3JuWlXoyfIG67Pvdk+yz/kKhou+SnkMCgaby9paPRuyu2k6cLgz9avmtp6OsZejkcbk+7XbBdi+oZsjZ/FIPg7kVDeZ/RxzbQlDzs4e1VGufx8sQJP/NadiuOWbz+8FfRKI4ki2V59o7LkDUhbXiRC4ifZV4ENCyNkI7zX9Gr1RgL00/7QZN7DZDEzCgfU4pdwxOHu2Tcz6lWvvPdVAIJPq7yYYgysEvovLS3PlQJYkO/WVeC6QPKVFUE/2Ymsovdg55rpeGjj4srsT/wZyldsonXD6D5CrMMqXOhcW/sK8esoHlHXPhJ+avs/KzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JN8OndcgIf2vR/RE47v19PBB+J/xFSJ5aaC6NjQV+kI=;
 b=ynQceqUaGJnH+tY/dqf6BliDz6hD9wHyVFIUdwtBtsPPB8Lz0U0bVLKvOR7KbWoQqs+kRJOivv8CNotFj/e2Iy5qBmG48WWkmJACUOeZmAPzusTVXcIPLXoJYOmKcacmNw11Af4cr677TRu3/Je3WgE2jxtz6VeHKo8HCc3jqnnEcWt6DfQK9nwU9XaJOOUPjcByskCNPVkOE51D0kMMcrgmPHjwcIBvxZ1ZAJUgiyt2I0oSQVUyfqAMZJy4KLzNJ8S7PiJkMHxTGmST1jyeYwRlnZXIr1d7ip5cF5AcH+5+yO+R76tTiOnq0Mhuh2NtEBZAAZkep/tZzOYH31P+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN8OndcgIf2vR/RE47v19PBB+J/xFSJ5aaC6NjQV+kI=;
 b=Q774YwFbUwQ1XoaTo1LRT1NqRwSheH3iB3RvYtpxeDWfbNnMcXAkso4kgoNFOzkSK476uaedb99vMC0YkVV7V9mZZ+irqeDEB+STDUrnFdjuDdbmCeEkusAg+YV76gQ9SI5aRsQCvZKciS+7Y8LM/D0m3Rcmp2n9TC/bToaupmA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 5/6] xen/arm: mpu: Enable MPU
Thread-Topic: [PATCH v4 5/6] xen/arm: mpu: Enable MPU
Thread-Index: AQHbKTd4TPW4dZ8zhk2oX5EUPGpTkrKcTJiA
Date: Mon, 28 Oct 2024 15:39:14 +0000
Message-ID: <05A07FCF-DE6E-403B-9B2B-ADBAE3C2CCFB@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-6-ayan.kumar.halder@amd.com>
In-Reply-To: <20241028124547.1371867-6-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|GV1PR08MB7380:EE_|AM4PEPF00025F99:EE_|DU0PR08MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c69c24-f326-459f-5c5a-08dcf766b68b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?SnnAPeHGesqpdtEnODa/uS3Tu35I9yToe9wwQ8iNxZS7vZf+O1wkrPn9Hh23?=
 =?us-ascii?Q?jWiWpi3mQfI08OKWmdNUd3PRuCVaGXHpZnHkKJzIV76uYK18NCCiMn79vh39?=
 =?us-ascii?Q?dG0YVmxAxT54lr4zFX361LHQAUqVjwKo+FXlO175TK9NFx+o27HTypMQ+VG4?=
 =?us-ascii?Q?MuYT5y/dKe159fIgMRvnoAhNDNsJNERwUBODmNryVRM5FmNJGUB969US1CNy?=
 =?us-ascii?Q?eL0dFGvbw2hpQR8/sWWkS3USj9ZtXK4AJhC50NVfGQaB0bft1aZ6/e4mjwHL?=
 =?us-ascii?Q?v0H+tZHPKTo2XsUUL8A0bnhDY3qV9soe05tOKqz5QmUf+7HQGuA6k5lDUPLa?=
 =?us-ascii?Q?uD9SKNv23XATiRnB7AJosfAvMw/UnsMvuQmscKeVqcHoLkEWd6lL8R8Mu+Vb?=
 =?us-ascii?Q?/9v2Ee5afVDySPvIhZK39cE1hDtSpvGqcXUQNw3aIR6IaMvJLZeRce387YpY?=
 =?us-ascii?Q?sZqPA8icDTBxQYIaQvZByP9qMpIEzUrg2J71r3CRaidzlfXUzhv4NskA0uXn?=
 =?us-ascii?Q?ZYLkXD3p5ukWyw0xzGw5lqHtjBa3ABgtqloxp8qlSzKyoY2gQld6bmZ4PGF9?=
 =?us-ascii?Q?qMdQo09hrD9tZtecCjb0zZllnJC9ofOriRUOslFHZDfSGEz0D9SUpNfIO/Gy?=
 =?us-ascii?Q?ziGqqnAASqO3SGH4ppNqnftFEp/+V1WOZxoGaj/Ps9beBiiLXVsSHSj0OGLi?=
 =?us-ascii?Q?SdIzqA3fXnLPIbf7dFueLwdcJijcFOywQHbHX9QNax3hLS6EO9Mr527CNi49?=
 =?us-ascii?Q?9ASpVUPUzKpSGmXSGvCPOfVRu1eHE8dKFNJEL8Vunh4519fE+N/Tnj0REzma?=
 =?us-ascii?Q?mCPk3uQXv6foZld9WE9iXPkqYrlsOT4pzH2n7VciPUtu6EuZ/vOixONopabO?=
 =?us-ascii?Q?WDCApPlkx3lCB8hCa23UUfXo3b44lI5IxQ3AsAmcpFMCfmoKud9hU23cuxHc?=
 =?us-ascii?Q?CKn404LueLD4YOzI+jiwRbOjUFy/W8agCsfb8iG6M6alvVj1LaPqQEisaskX?=
 =?us-ascii?Q?1NQMvWMVzzmZSFlc+5LwKrmuk2EKbC1xoqs9WkIz9ATS/n4PJLFdWqnR+laN?=
 =?us-ascii?Q?Y6Hpf4zPwh7Ro73+izCcu35H+zsQuKYVm0OYDSZdR1CT5e0YV+88YUH0CSFO?=
 =?us-ascii?Q?wzdKHBm0+9+X1PF7+4l/vSSGzYd/+d2gTxNLrkb9xeEh8VsP5LIlN/hLLycY?=
 =?us-ascii?Q?RT54mDJUNgd0+/taI47YaNT0XaAyxnjA2WaqSIIiZsg1C7gSKnCf0PxsEzXO?=
 =?us-ascii?Q?87JnGDkdyTuZaHnKZ/+RF8xX9lPjvhtj+5JgRYAEkzkG6JIZVez97hMOx0hz?=
 =?us-ascii?Q?eIuSutsO1eyVJsUxlSt80RcUMy6rS8FwXa2OYSffEOn2BRaYAd7bkItR2sHF?=
 =?us-ascii?Q?fYKsWxk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <611A1CF4DD23E5468C1B58373E7FE2C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7380
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cee701f4-99f4-41be-c889-08dcf766acf6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vD25lMwLwuntVqpNOV7ganm4Z0fNcpGMCg8PQy7lb0plQC1oHm6C+IxShP9G?=
 =?us-ascii?Q?5Er4kIi8QVjhPCxXCpfpo+//2lX99WaffapwCioWWZHzIM1v2tbKjqug5XoA?=
 =?us-ascii?Q?vJXR45R88uoTW6i1ErFduLiHJzhFGAkoODMTh01f+PfzTDdWfk0/HlFPwwlR?=
 =?us-ascii?Q?2Hl1/4SpWcnGI8m8iYKx0kSM3zkxVPIftZM1QD9YpgZfjwp/8YSzRkGvrN9C?=
 =?us-ascii?Q?KmKEvIihLdqjoCPVMJ0VF6ycG1YHxwZ4VSt7JTT+WPKrXcY1nQiJBWJCkEDE?=
 =?us-ascii?Q?976hjl6wNlXKLLodYeknX6JadaAz4aIZQNufMW8S1HEzESAnHSzDLbZHNVmU?=
 =?us-ascii?Q?cObmZL8n+SSNeckZDD7L3JoLH9MDObFa/JnhxUwi1aOQhZA9n9zPCs7R7url?=
 =?us-ascii?Q?IMVsYZ2DnS6OM9+ykYDV4j1phnhomQQnMrDPIqGphSgQMGqZvwefiUACqIhy?=
 =?us-ascii?Q?QMUIDEb2Fkx4lh7VYk2NB2sj79ZYzmTVA26fomrwA20Btg0RjFNGOsui+zE/?=
 =?us-ascii?Q?Gnz6Fsx8AMsYxHxxHqBMlZ4EYD2xubNP9jQ+zgZGP4sr+6yhFTfWjJSp667L?=
 =?us-ascii?Q?ZnyKj2KgO2UUPsTJqz/hTQo9yIZR0MOpzwaTaWX8WQ5eQd0RX/QB64HjJv1P?=
 =?us-ascii?Q?3Ys35TdVU32HeUPgLdjlabXs9WLU0Jj5i0B+SrUsag9xduHbBMzJED/pNESd?=
 =?us-ascii?Q?FWkXco/Bvmw+FXT6IUia2BGsUkpC9V6XbxYgWNzVXoMYuTef6+wiemUPU+DR?=
 =?us-ascii?Q?FdtSejJ475CzLPSqNZZiOuFnImA7m5dN7bdN3l0pZc/yGRiRuKSFmAQy89Ut?=
 =?us-ascii?Q?NCMNZOj1zDy4ZYpj0iItbE3irB4u7lQA5fvzu8zzhCiYMgcI0GMmSy9f0utR?=
 =?us-ascii?Q?zsgqMf5DImMRjtH/GBsl9ubiwSoEVtvFgYFEuK9l+nFOWdY0jmBBFoUs3/oZ?=
 =?us-ascii?Q?vOhVjVerqvECPMWbRT2jhznVaEe53NjVgGmCrLc7fusq9RVuQBM+VrIXnl69?=
 =?us-ascii?Q?AU550HjZglHtb5VIEIN/+DM1XpwpjAurF3jEGnHG2bmO/Vm9oAXVROry08JL?=
 =?us-ascii?Q?QAl0kLqVgwWrTecVMgxJSuf1FwBJIQEDjpnwp/z6r/QE3wOn9rfJwNQSh1po?=
 =?us-ascii?Q?1cb9fsVcNmcx1KcdaUkbxtMBTUI5YMJSKjY7Uc8+RBLzfoy/GQoxi/Mbirv1?=
 =?us-ascii?Q?7NkZJQSyFQab9Uvm/qk4Vj/NhpgpyVKU9oJK9ADMBm2p47kgcSTh9IAQkomA?=
 =?us-ascii?Q?3WkmkLIVUQJsM2oAIAvfxOpZL55Xn5a39wU91/y71NBTMHFWLFThfbk9P3rc?=
 =?us-ascii?Q?coFbsB+kDsJ4sNVvTRHAY/7JE1i/QN4kkr0oudJXC2qvNmyseap9M94Kbtmh?=
 =?us-ascii?Q?2xEMUUhZJfQ1ijOn2mKh5eTGLLigs8fuwI+LMUVmJClbPwmlRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 15:39:30.0454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c69c24-f326-459f-5c5a-08dcf766b68b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8495

Hi Ayan,

> On 28 Oct 2024, at 12:45, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> After the regions have been created, now we enable the MPU. For this we d=
isable
> the background region so that the new memory map created for the regions =
take
> effect. Also, we treat all RW regions as non executable and the data cach=
e is
> enabled.
>=20
> As enable_mpu() is invoked from enable_boot_cpu_mm(), one needs to save a=
nd
> restore the lr.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>=20

It looks good to me:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




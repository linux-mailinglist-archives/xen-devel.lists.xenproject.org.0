Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31595A38271
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 12:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890306.1299298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzil-0005tV-BQ; Mon, 17 Feb 2025 11:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890306.1299298; Mon, 17 Feb 2025 11:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzil-0005rl-8o; Mon, 17 Feb 2025 11:55:31 +0000
Received: by outflank-mailman (input) for mailman id 890306;
 Mon, 17 Feb 2025 11:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bV9=VI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tjzij-0005rf-I8
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 11:55:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f403:260e::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13bae01b-ed26-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 12:55:27 +0100 (CET)
Received: from DU2PR04CA0325.eurprd04.prod.outlook.com (2603:10a6:10:2b5::30)
 by AS8PR08MB8733.eurprd08.prod.outlook.com (2603:10a6:20b:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Mon, 17 Feb
 2025 11:55:22 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::53) by DU2PR04CA0325.outlook.office365.com
 (2603:10a6:10:2b5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Mon,
 17 Feb 2025 11:55:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Mon, 17 Feb 2025 11:55:21 +0000
Received: ("Tessian outbound b77899637302:v567");
 Mon, 17 Feb 2025 11:55:20 +0000
Received: from Lf6e2c6b31327.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6BE8EEF-7085-4F2C-822D-0EFFC77B9210.1; 
 Mon, 17 Feb 2025 11:55:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf6e2c6b31327.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Feb 2025 11:55:14 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PA4PR08MB6094.eurprd08.prod.outlook.com (2603:10a6:102:f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 11:55:12 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 11:55:12 +0000
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
X-Inumbo-ID: 13bae01b-ed26-11ef-9aa6-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vPmdZfK110FhqItE85vb5iGpZ4RCsiS+7K8AUuLZsNaVcd6JZeR9mx0PMRjiL3PdReVeV77gJqxOJoCQ6VVlf148phOf1jVl3uglVqC2iS//ioE839DGZcgzkW/WA9NXUm31N5FkNclIwN+40Dk4DUVN60JtSCNSmK35ZGWWiLuMTG0KDvO965RZqlI9tDUDdhnkBGEcVqbQTVWKsCJcntteeZKbfXteb9gxd499dXl6l8imT5nPSu60TFSphZD+apHQeVXvFoyUr5L6JrerqCEfEZ5knxXZ9T/t5euC+y6TMcQoCXMYdPivawKpCp5FzVcnQi1Y5v/d+Gl7RfMxOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtcqwSzJ+bpD9L6Y1nKeuj9oIALTP6fA2+FOqPlLlYs=;
 b=LKFhYNyPiTPr+3dJYSGOAx7dmX4HrwpIEXuGGt2YCkrrGFDyaqSoLfLNeABEs/bqJga+AKGqqOTt7DdpuiHnNYwj+zSO+yw8lfsXaXL79D0flQki1yeGhX5HO2FPdYBFp0NLrGo2l2S+Pg0TMr4pHe+/WHvjsJPe73varp8ueaz5GhL5y1wB3KvWYVGAG3reuUvPbuw6Bme89z0GY/OBad4mBbiTQDPhyomCX1AI0nwPdnoGQ+Bz55og+NUx2Ga0OZsmJfrOevq4f1uD/S5ekHLS4DHt2XnPsPG1odqpZ+938UbrqX6OmUJkX/Prk0d+LuY7tPLgka74yI43a7nSXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtcqwSzJ+bpD9L6Y1nKeuj9oIALTP6fA2+FOqPlLlYs=;
 b=rcyhOFK69qMb8ktNnS1XRqJ+tkQzaSRsqYTNGoDwfrizDg5+Xxc8dm1lzgMNTDf6SOLzF8Y+Zik0fHZsWOIqbsT8IJ00BsG1877EZadOf7M7vpVqu4XWyM2gnyMlNoFfsUoPlcX2exBSp6q3qc0Xwgmdw1WdMAv21BbABLtRZf8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ecdab303ebb870c
X-TessianGatewayMetadata: X+dGwJOK7dChQzr35GLVuAcpjmktiRRNgoaaD3iamdBRz8J8Av+vqu7jUUXS9ZuVeck4WBgYdoKx2mqlfKNRO0JMECg/ILm7pV30AnLl996Z8wrw+DwwhoTFyhuMTO6bXceUWzHi+GJsE+i6QN+3cCALzahJXzSQCk9dTOURvOU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJisObkDkVZXR2TVtM26AFh9l0ktAKiWx9Y5cqBzt6TjnSXCXv5ABZsJ+9S/9uusIyYa+eVWnWhiTT5AGbUlaOklocfAj55VDPIns+zYcntzxfM0sni5YC2zWfYFAfVkyewTBkcUz8TyHQDCY2wacjCQb2HdVojzmn9juAgRzSKsv7Okt8Xnb344MtykcgNUKFBOVIIWpEp9tF2+9n7J65bpZB8i4LGC0mfKGfKR2rU5xVFzjTqgH5Ov2trZh6j0rHZ7dktclDbwB8tdJFZd4t7VNAgqzQ/iAqXYLzrhRlUDGFqjjLF4B3i26LVdQw7pVNLTJEhClKzM+dVvQZFppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtcqwSzJ+bpD9L6Y1nKeuj9oIALTP6fA2+FOqPlLlYs=;
 b=uoVDv94KrfoPt6RrVeXmTXKrzt0oVjMhIfxPnem4OS2pEsxU9fGV4FQ/QP/9je7F1WPKOEdt78R0kNJKc7KIWPt2S+LJB6hlWZuhP+ulF+qp/6sjL8Fqk1333t8TqCTiKSgBPxRyywRn//d5iQ3Iqb/EWNd0pSei7tjYHWp5YUvujE/njmKw9BC/xYMrVY8Y+fwa8KxZ7LWiptRxLhHgvflC/7EbqX8qVFrh0L6Slry81H1FdRhxwxgz9frwoGiHQ/ggatVM6B5L1xIPYrGj5CxIS/XyGzfvA5K08MfyLzRGpHJHI7vVYUhLcS+0DwzBYCzCuyAxG5sBxX2cs+biHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtcqwSzJ+bpD9L6Y1nKeuj9oIALTP6fA2+FOqPlLlYs=;
 b=rcyhOFK69qMb8ktNnS1XRqJ+tkQzaSRsqYTNGoDwfrizDg5+Xxc8dm1lzgMNTDf6SOLzF8Y+Zik0fHZsWOIqbsT8IJ00BsG1877EZadOf7M7vpVqu4XWyM2gnyMlNoFfsUoPlcX2exBSp6q3qc0Xwgmdw1WdMAv21BbABLtRZf8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH v2 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index: AQHbgSah9ICbo4twrEWuXsaPYY+0drNLUUYAgAAR4YA=
Date: Mon, 17 Feb 2025 11:55:12 +0000
Message-ID: <5CB44FBF-09A3-4587-B5A5-3D4BBB9D58A5@arm.com>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
 <20250217102732.2343729-2-luca.fancellu@arm.com>
 <cbea397a-e919-4b00-a56a-f706ddc13e53@suse.com>
In-Reply-To: <cbea397a-e919-4b00-a56a-f706ddc13e53@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PA4PR08MB6094:EE_|DB3PEPF0000885F:EE_|AS8PR08MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b5b0f5-6231-4299-3bd1-08dd4f49f48e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SHkvREI3UllZaThKYXlUQkdSTkZEV085VGdvVks0emg0bG9ObEc5YTV6ZDc5?=
 =?utf-8?B?RFc3UEE5ZTlUTmxLUWdiZlIyb2hycnFDbWRxRGJlTTJYVFVWazVRS3ZSUEsw?=
 =?utf-8?B?TjlRZ2hYOHpqTWZxNVZVbG81L0tlZW1oZkhGMWlLN1Vsa0FrdkZIU2lmeitw?=
 =?utf-8?B?dkxmOXFGZCtYSXBPWGoyTkxUbDNtRXNjaExzUGVtbG5VcXE4WWJCNHlGaWRm?=
 =?utf-8?B?dUNDenZsa3U4TkRJYXVzQjgxbWI2SzFXS1dOQU56NnhMcjl2b0k2VU05Tlp6?=
 =?utf-8?B?TlNPd24xdnN0bFhXMnBjTVJiMWdibXpUeUlGaktnWGM1dEFJalhwRzRCUm9x?=
 =?utf-8?B?V0MrUjVQdjYrTDdkU3NwZEh3WGNMVGpWdUh2RCtUTERyUnBVNitDSG9JWkU0?=
 =?utf-8?B?Wk83cWVFNXJEZlhXRm82UXBmWE9YQ2ZpazMxUmphVWRRUlFwWHFHN21rZXU5?=
 =?utf-8?B?WHp6MUVMTTV2M245ZGoxTDFYL1V2RS9DTm5HNGpUZWx4U0NPQ2dYL3NjUjRu?=
 =?utf-8?B?STdvNEF2ODcrTzhUWENHK3RkNXhCSkUzZFJyckluSGNUbm91cnQrU1dDb1By?=
 =?utf-8?B?Y2Q2ZFRRZmxvYWw5YnJXcWhSRzVzWDJpMmpQQzNlN3N4Y28yUG5MWnkwMWtE?=
 =?utf-8?B?ay9KRjNlamZzMDJIK2dHc25iZUpWcHZMdGlvTldjeFJFemc1c2M1TVlMZ1U1?=
 =?utf-8?B?NVNXMjJ3S0lhaVVLelNjbkRFS1ZqVkdSeUNGRFpLQUh6aW0xY1VSc2E1UEVu?=
 =?utf-8?B?bS91VkZFS1NBa1I1a1NsWkd6L2kvbmdhZU9FODR2bUI2NW1UKzJnZVlQbHQw?=
 =?utf-8?B?Q0oxUjVIVWFzTmY3Rm9ldzEzU2xhdUlXU1IzSUVJd1ZPT2wvZGxrRW9LeUVI?=
 =?utf-8?B?SWlYMTdvOTRGNkpHVmhEbDd5WlpwbThuRndnNk9QZkZXK3dNdnJVcWJGT21u?=
 =?utf-8?B?d1hZclFtU2xTVFR4UmpENlA0TEJNMHI3RHE1ZFJOWXRhQUlMdVQ1Rm15dXp4?=
 =?utf-8?B?UTE4Q3dqOGhjVWF0WWYwbTRXV1kwT0Rwb3lRSk02TkdBbUtnUWt1U0xZTnps?=
 =?utf-8?B?QitLK2pkdkRYZlc2NUw2dlFXYnBIR1BWVm5BdDhFRFRCZi81cmsvaUxOcDZk?=
 =?utf-8?B?M1M4NW45ZzI4RUpUT3psa0dROTNGVzdZdUVPRGVQYXBRTEFVNWQ3Qi8zTUpV?=
 =?utf-8?B?Q25JVlNqVTgzWXg5c0E1RmYyNWN0cytwZ0huNzFKejI3cjNJTStjSE5MS3NU?=
 =?utf-8?B?SkVBSDI4bCtCemtlcnA0eGh6S1N4QTM1d05vRUJidmdNTUlHTTRUUm1Delk2?=
 =?utf-8?B?VEltUXd4ZUZUY2lxOVd4cVcwRnRpME1wUTRWSnBkRUhuRWsrMEM1VHVGMS9D?=
 =?utf-8?B?WHNpSk5SSkhQVEhGSnE2dlJTNGlDV1RFNVE2d25oMSt4ZmJENlM5d0l4d1Ey?=
 =?utf-8?B?ZjUzLzhwejhkVCtvcmdHV25wdkZJeDlPNTBuMUd1eHlxemM4NGNGOG1DM0ZD?=
 =?utf-8?B?RjcxMEh5d0l4UUlUanpDZTQwaWtBUjRveWlBVHR4M09obGFMdjlBNFd1UzFh?=
 =?utf-8?B?WE1ZSjVVWndud2ZPR2t3aEJmN1BJMllHS0Jvb0d1VGtSUnE2cGlBTkppbFEz?=
 =?utf-8?B?YThUQ21qdTAydTNiMVJyd0I0d1Y4eXVIcUlsdXI2ek16cnlON3NpWlcyYSsv?=
 =?utf-8?B?djFNRFpSUGd3MG1vK2lBTE9YWmx0N3ZzSTZJdGFZQUp3NVJubHhiUWFrc0p2?=
 =?utf-8?B?eTRzNy8xSm0vY3ZaTmVmSS8wa2NodmhBdlZ1OWYxdzBLMHZJNWNwZTlqVWlH?=
 =?utf-8?B?bGV1cnhkRUpDbE81Mm1UTm1adkZMWi9zQWtNeElOT3hMYUdyNWtSSkpCbmZ3?=
 =?utf-8?B?VWlsM1p6b29OeitwYmxwNWpnS0U0cnQwOGs4d0tTMGpSTmdNSTQycTV2Y2VQ?=
 =?utf-8?Q?NE/zkv5SAI679CZM711OlqnM76dvf8Tc?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8D40655E5C1D746A23444CA325B100D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6094
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d2d52db9-ca23-44ae-ae42-08dd4f49ef4c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|35042699022|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEo5aC81NitndzM0S2d2ZU5TdDNWTlZOK3BHYnVRRGx2QlV3Mm5QUFdqYVNS?=
 =?utf-8?B?Ly9ISEJ4YWlaelI5Y2xtVUtla09LTDMrUVBjRm1VMjFGOEpNc0s0bFB6aWpI?=
 =?utf-8?B?cDhzcnJmeElvc29DdjUramNxcFhvOXZrMGtlalJMYXRickVPUHFxdE45bE1O?=
 =?utf-8?B?eW5BNkphSG9xWFJrbzZQVzY4MTcvSGNqcU5iWnR5aVF5RE9haVhTUVF6OWls?=
 =?utf-8?B?cE9RMVVhK0V0YTZlaXFnS0VaOXNoT3JwYXRxVGNLU1E1VUYyTTUwaVRQRG9j?=
 =?utf-8?B?ZnpHbG9HVlBaK0F3dmRqWWtYMVNNS2UzYzRKRlVtTGVsaHhQSnlWK3gwRCs1?=
 =?utf-8?B?V243NkdoeVBvWWd3V0VDQXNMUzBwdGxZYlZNQjIwcjhHTTIxWWtTaXY4TkNL?=
 =?utf-8?B?Y2toajM2U0RpeFAwc1NvNVJwZ3RWOTY3Y2hsa0lvOXhlTjZQSmR2NU5KbU9S?=
 =?utf-8?B?SEJSSHVjaFBkTDZ1VG1IcHU3Qm5TT0d2REJvVkg0aTZYOEhnRVAwWVp3RnhS?=
 =?utf-8?B?a2hSOHVqb1VhMm5YcnlJVnI5LzUzQ0ZaS2FtaHluQmxtNnVIQVVlaTNIbUJo?=
 =?utf-8?B?TmZQdE1UTUtiNU5lSmlJVEFNVkYvbUE3Z2tTdjFtM29qQklaQVdqNjhoSUJt?=
 =?utf-8?B?RzM2ekdiVnFVVkRHeUhqNmw0S1ZOZE5wUVoyRnFyaTZuT3h1TUhoc2VobVgr?=
 =?utf-8?B?NVMzcG9PZGZpQWNDYzRGQm1Mdk9jcVlFTGc1czNuYjdKN0RpVkJ5UEhzQTE4?=
 =?utf-8?B?UVdHREdUUkpQUkxEa3RCc3Z1R3N6Ny92NmJrcm1BcGIxKzBrMmlWV2JvVkNN?=
 =?utf-8?B?SjRVdEVQL1FzdGx2b05NUWs0aHVtMklVK21QMmNXRE43dTNyaE9RWGhtNFRC?=
 =?utf-8?B?by91Mm1sSnA4VDFwM1l3ZGZDaEp2YnBGWXgrRERDU1lzeGFLU0M2dHlpcGNa?=
 =?utf-8?B?QUxxczk5VVZnRXRGeWllYkljdzluNHpWV2xTeEExNkFpeVJ1NTF2L1dIcmsz?=
 =?utf-8?B?MTlYbk8vR20yZ3pSUVZRQUNuZC9jQTZkZVNMOC9Kc0hoa2NNV3kzbHF0TFE1?=
 =?utf-8?B?SjlkNWFrMmtCN2RnRDlhYmxrQ3N1NGFVMzJsUnVMc0NjRHpNY1BWN0c1cGtC?=
 =?utf-8?B?MUtSSEtCV2krY0hxYzJkVkp4bU1uT3lwTEZFSGpGeUd4VFNsS1EwN0V1WWQw?=
 =?utf-8?B?WnpqVXJhK1pXVWxsdGVENkRGT0lNL3lVVHlKVXdXZzVtWExSbmYxYmQrRExl?=
 =?utf-8?B?UExkbjZXNU04QmNjd0ZMY083clh6c3pVNVEwZWk1b1lrV2xqb29kOU55SUxM?=
 =?utf-8?B?SnBHWGVqMVV6ZjJXT0x3Sk0vOGVuWkIxN3ROSGhCL01xRCtwdG9ob1NsV2lt?=
 =?utf-8?B?VW1UM3V3aERUMytBQk5nNk1VTjJocnVtSi81NTBmWFhyeEw1S0NSMlgyWXVF?=
 =?utf-8?B?NlB3QWVTY0s4elpXcWtGMlMwUnM2OWFZVU1URmtHNGVCK3JRM0tlbEtWd1hP?=
 =?utf-8?B?UkFOUE5YbE1VSXZoYVZROEZJbFBFMnhUSmlYQkhjeTdWY25WRXF4eVJUbzZM?=
 =?utf-8?B?dmM0Y1dtOFVmcmhjMU5Rb0tQRWs0WXNKOU0rQkMrRjAyN29PeFkwTG50TmpX?=
 =?utf-8?B?eU9HOGsrQk5yYnBCSGRHMEJPaW1VVUlKd2pSNUhubkdHSjJGYi9jb01wa0NJ?=
 =?utf-8?B?STlucGI3NHFHU09FR2RhMzBXSXhuVDNjYjZONE9WSlJRUVgrM25IWnM1NUNp?=
 =?utf-8?B?eEk4VzRIaGpITEd5WmM0WGRsTXJOYlliYU1HejNrS0FVSlM3RVJSc0Z6dEdM?=
 =?utf-8?B?TTRBUUhvTUhrMDFBKysxNE44OCszdTB4ZXh1QUdKazVpbHV2STVSanNCTExI?=
 =?utf-8?B?STNXSjY2RnlSMHJ4SUJpVTMyWDJaOVdhK2R6L0FIMVAxaSt4UUFXSHNSVWQw?=
 =?utf-8?B?UFV1eGxyU2xMcGxvMWpyaXhXbmdPZzJwWEFKaEVrWHFVTWRET01YeXF3Q1gr?=
 =?utf-8?Q?9ZcWjL5bJMYhmzLEZtn4SQYCGEq3qw=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 11:55:21.0647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b5b0f5-6231-4299-3bd1-08dd4f49f48e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8733

SGkgSmFuLA0KDQp0aGFua3MgZm9yIHlvdXIgcmV2aWV3LA0KDQo+IE9uIDE3IEZlYiAyMDI1LCBh
dCAxMDo1MCwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9u
IDE3LjAyLjIwMjUgMTE6MjcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBXaGVuIFhlbiBpcyBi
dWlsdCB3aXRob3V0IEhBU19QQVNTVEhST1VHSCwgdGhlcmUgYXJlIHNvbWUgcGFydHMNCj4+IGlu
IGFybSBhbmQgeDg2IHdoZXJlIGlvbW11XyogZnVuY3Rpb25zIGFyZSBjYWxsZWQgaW4gdGhlIGNv
ZGViYXNlLA0KPj4gYnV0IHRoZWlyIGltcGxlbWVudGF0aW9uIGlzIHVuZGVyIHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoIHRoYXQgaXMNCj4+IG5vdCBidWlsdC4NCj4gDQo+IFdoeSB0aGUgbWVudGlv
biBvZiB4ODYsIHdoZXJlIEhBU19QQVNTVEhST1VHSCBpcyBhbHdheXMgc2VsZWN0ZWQ/DQoNCnN1
cmUsIEnigJlsbCByZW1vdmUgeDg2DQoNCj4gDQo+PiBTbyBwcm92aWRlIHNvbWUgc3R1YiBmb3Ig
dGhlc2UgZnVuY3Rpb25zIGluIG9yZGVyIHRvIGJ1aWxkIFhlbg0KPj4gd2hlbiAhSEFTX1BBU1NU
SFJPVUdILCB3aGljaCBpcyB0aGUgY2FzZSBmb3IgZXhhbXBsZSBvbiBzeXN0ZW1zDQo+PiB3aXRo
IE1QVSBzdXBwb3J0Lg0KPiANCj4gSXMgdGhpcyBmaXhpbmcgYSBidWlsZCBpc3N1ZSB3aGVuIE1Q
VT15PyBJZiBzbywgLi4uDQo+IA0KPj4gRm9yIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcoKSBp
biB0aGUgQXJtIHBhcnQsIG1vZGlmeSB0aGUgbWFjcm8NCj4+IHRvIHVzZSBJU19FTkFCTEVEIGZv
ciB0aGUgSEFTX1BBU1NUSFJPVUdIIEtjb25maWcuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEx1
Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4gDQo+IC4uLiBpcyB0aGVyZSBh
IEZpeGVzOiB0YWcgbWlzc2luZz8NCg0KcmlnaHQsIEnigJlsbCBhZGQgYSB0YWcsIGJ1dCBJIGRv
buKAmXQgZXhwZWN0IGl0IHRvIGJlIGJhY2twb3J0ZWQsIGFsc28gdGhlIE1QVSB3aWxsIHN0aWxs
DQpoYXZlIHNvbWUgY2hhbmdlcyBuZWVkZWQgYmVmb3JlIGJlaW5nIGFibGUgdG8gYnVpbGQsIHNo
b3VsZCBJIHB1dCBhIHRhZyBldmVuDQppZiB0aGlzIGlzIHRoZSBjYXNlPw0KDQo+IA0KPj4gLS0t
IGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21t
dS5oDQo+PiBAQCAtMTEwLDYgKzExMCw4IEBAIGV4dGVybiBpbnQ4X3QgaW9tbXVfaHdkb21fcmVz
ZXJ2ZWQ7DQo+PiANCj4+IGV4dGVybiB1bnNpZ25lZCBpbnQgaW9tbXVfZGV2X2lvdGxiX3RpbWVv
dXQ7DQo+PiANCj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQVNTVEhST1VHSA0KPj4gKw0KPj4gaW50
IGlvbW11X3NldHVwKHZvaWQpOw0KPj4gaW50IGlvbW11X2hhcmR3YXJlX3NldHVwKHZvaWQpOw0K
Pj4gDQo+PiBAQCAtMTIyLDYgKzEyNCwyNCBAQCBpbnQgYXJjaF9pb21tdV9kb21haW5faW5pdChz
dHJ1Y3QgZG9tYWluICpkKTsNCj4+IHZvaWQgYXJjaF9pb21tdV9jaGVja19hdXRvdHJhbnNsYXRl
ZF9od2RvbShzdHJ1Y3QgZG9tYWluICpkKTsNCj4+IHZvaWQgYXJjaF9pb21tdV9od2RvbV9pbml0
KHN0cnVjdCBkb21haW4gKmQpOw0KPj4gDQo+PiArI2Vsc2UNCj4+ICsNCj4+ICtzdGF0aWMgaW5s
aW5lIGludCBpb21tdV9zZXR1cCh2b2lkKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIC1FTk9ERVY7
DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgaW50IGlvbW11X2RvbWFpbl9pbml0KHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBvcHRzKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJu
IDA7DQo+IA0KPiBTaG91bGRuJ3QgdGhpcyBmYWlsIHdoZW4gaXNfaW9tbXVfZW5hYmxlZChkKSBp
cyB0cnVlPyAoVGhlIHVzZSBvZiB0aGUNCj4gcHJlZGljYXRlIGhlcmUgYXMgd2VsbCBhcyBpbiB0
aGUgcmVhbCBmdW5jdGlvbiBpcyBzbGlnaHRseSBzdHJhbmdlLCBidXQNCj4gdGhhdCdzIHRoZSB3
YXkgaXQgaXMuKQ0KDQpSaWdodCwgcHJvYmFibHkgeW91IGtub3cgYmV0dGVyIHRoaXMgY29kZSB0
aGFuIG1lLCBJIHN0YXJ0ZWQgZnJvbSB0aGUgYXNzdW1wdGlvbg0KdGhhdCB3aGVuICFIQVNfUEFT
U1RIUk9VR0gsICdpb21tdV9lbmFibGVkJyBpcyBmYWxzZS4NCg0KaXNfaW9tbXVfZW5hYmxlZChk
KSBjaGVja3MgaWYgdGhlIGRvbWFpbiBzdHJ1Y3R1cmUg4oCYb3B0aW9uc+KAmSBmaWVsZCBoYXMN
ClhFTl9ET01DVExfQ0RGX2lvbW11LCB0aGlzIGZsYWcgaXMgc2V0IG9uIGRvbWFpbiBjcmVhdGlv
biB3aGVuIOKAmGlvbW11X2VuYWJsZWQnDQppcyB0cnVlIG9uIGFybSBhbmQgeDg2Lg0KDQpTbyB3
aGVuICFIQVNfUEFTU1RIUk9VR0ggY2FuIHdlIGFzc3VtZSBpc19pb21tdV9lbmFibGVkKGQpIGdp
dmUgZmFsc2U/DQpPciBzaGFsbCB3ZSByZXR1cm4gZm9yIGV4YW1wbGUgdGhlIHZhbHVlIG9mIGlz
X2lvbW11X2VuYWJsZWQoZCk/DQoNCj4gDQo+PiBAQCAtMzgxLDE3ICs0MjMsMTkgQEAgc3RydWN0
IGRvbWFpbl9pb21tdSB7DQo+PiAjZGVmaW5lIGlvbW11X3NldF9mZWF0dXJlKGQsIGYpICAgc2V0
X2JpdChmLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKQ0KPj4gI2RlZmluZSBpb21tdV9jbGVhcl9m
ZWF0dXJlKGQsIGYpIGNsZWFyX2JpdChmLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKQ0KPj4gDQo+
PiArLyogRG9lcyB0aGUgSU9NTVUgcGFnZXRhYmxlIG5lZWQgdG8gYmUga2VwdCBzeW5jaHJvbml6
ZWQgd2l0aCB0aGUgUDJNICovDQo+IA0KPiBUaGlzIGNvbW1lbnQgYmVsb25ncyB0byBqdXN0IC4u
Lg0KPiANCj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQVNTVEhST1VHSA0KPj4gLyogQXJlIHdlIHVz
aW5nIHRoZSBkb21haW4gUDJNIHRhYmxlIGFzIGl0cyBJT01NVSBwYWdldGFibGU/ICovDQo+PiAj
ZGVmaW5lIGlvbW11X3VzZV9oYXBfcHQoZCkgICAgICAgKElTX0VOQUJMRUQoQ09ORklHX0hWTSkg
JiYgXA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb21faW9tbXUoZCkt
PmhhcF9wdF9zaGFyZSkNCj4+IA0KPj4gLS8qIERvZXMgdGhlIElPTU1VIHBhZ2V0YWJsZSBuZWVk
IHRvIGJlIGtlcHQgc3luY2hyb25pemVkIHdpdGggdGhlIFAyTSAqLw0KPj4gLSNpZmRlZiBDT05G
SUdfSEFTX1BBU1NUSFJPVUdIDQo+PiAjZGVmaW5lIG5lZWRfaW9tbXVfcHRfc3luYyhkKSAgICAg
KGRvbV9pb21tdShkKS0+bmVlZF9zeW5jKQ0KPiANCj4gLi4uIHRoaXMsIG5vdCBhbHNvIGlvbW11
X3VzZV9oYXBfcHQoKS4NCg0KSeKAmWxsIG1vdmUgdGhhdCBjbG9zZSB0byBuZWVkX2lvbW11X3B0
X3N5bmMoZCkNCg0KPiBUaGVyZSdzIGEgY29ubmVjdGlvbiBiZXR3ZWVuIHRoZQ0KPiB0d28sIGJ1
dCB0aGF0IGlzIHVucmVsYXRlZCB0byB3aGF0IHRoZSBjb21tZW50IHNheXMuIEknbSBhbHNvIG5v
dCBjbGVhcg0KPiBhYm91dCB0aGUgbmVlZCBmb3IgLi4uDQo+IA0KPj4gaW50IGlvbW11X2RvX2Rv
bWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4gICAg
ICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9k
b21jdGwpOw0KPj4gI2Vsc2UNCj4+ICsjZGVmaW5lIGlvbW11X3VzZV9oYXBfcHQoZCkgICAgICAg
KHsgKHZvaWQpKGQpOyBmYWxzZTsgfSkNCj4+ICsNCj4+ICNkZWZpbmUgbmVlZF9pb21tdV9wdF9z
eW5jKGQpICAgICAoeyAodm9pZCkoZCk7IGZhbHNlOyB9KQ0KPiANCj4gLi4uIHRoaXMgY2hhbmdl
LCBpLmUuIHRoZSBuZWVkIGZvciBhIHN0dWIuIEFmYWljcyB0aGVyZSdzIG5vdGhpbmcgaW4gdGhl
DQo+IGRlc2NyaXB0aW9uIHRvIGhlbHAgdW5kZXJzdGFuZGluZyB0aGlzIG5lZWQuDQoNCk9rLCBz
byBpbiBhcmNoL2FybS9wMm0uYyB0aGUgZnVuY3Rpb24gcDJtX3NldF93YXlfZmx1c2goKSB1c2Vz
IHRoaXMsDQpzbyBJIHByb3ZpZGVkIGEgc3R1YiwgZG8geW91IHRoaW5rIEkgc2hvdWxkIHByb3Zp
ZGUgc29tZXRoaW5nIGluIHRoZQ0KY29tbWl0IG1lc3NhZ2UgdG8gZXhwbGFpbiB0aGF0IG9yIHNo
b2xkIEkgdHJ5IHRvIGZpbmQgYW5vdGhlciB3YXkgaW4gb3JkZXIgdG8NCmRvbuKAmXQgcHJvdmlk
ZSB0aGlzIHN0dWI/DQoNCkNoZWVycywNCkx1Y2E=


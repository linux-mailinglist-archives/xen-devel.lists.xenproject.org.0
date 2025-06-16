Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB27ADAE06
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 13:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017148.1394122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR7hq-0004O2-I6; Mon, 16 Jun 2025 11:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017148.1394122; Mon, 16 Jun 2025 11:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR7hq-0004Lb-ED; Mon, 16 Jun 2025 11:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1017148;
 Mon, 16 Jun 2025 11:08:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KWUM=Y7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uR7hp-0004LO-3F
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 11:08:49 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20626.outbound.protection.outlook.com
 [2a01:111:f403:2405::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d00dd9-4aa2-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 13:08:42 +0200 (CEST)
Received: from DS7PR05CA0105.namprd05.prod.outlook.com (2603:10b6:8:56::19) by
 BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.25; Mon, 16 Jun 2025 11:08:38 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::ca) by DS7PR05CA0105.outlook.office365.com
 (2603:10b6:8:56::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Mon,
 16 Jun 2025 11:08:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 11:08:37 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 06:08:35 -0500
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
X-Inumbo-ID: 42d00dd9-4aa2-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SK6NaSTzE9BJ2jTs1Hn5ktTRUziVDCMWd6SRqkp1jtD8cyykiQKnq9WtekHxYVYMDzDJHPcLehVwLKsT5eQZIbhrVeJX1ZqqsS1W7IaEVBzz8Ev+MQpv3D5aOe/H07tFA8kyCGoMD1h1K3GBg7lUTeQLtGcMjfHQpDdqVzRTYmY3Imsh6SNSa5Ex8wyHSCpLHioAllcsB/62fklQ1wclS3THgfOXNjdThl7HZT0hGHAi6Z27elI7iQbxkwfaU8nAhKbcP+6LAa7oaoQurr5Z9jlnjqKkuzp6Lk84qy0Zi1r39joCCX/6QCe86EfsDsAmfx1YN/bwu6OWRCCP1ovddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tML+fkkAsla4oagPUJMuFrBJe7qpUjDyEplBx4E4ySA=;
 b=qXFWa/cpWM6GtVQq2pHa+H7oOIOrDAnHgfFqAYVdm4sfOOA062Z2P67rFFZ3jOIFVHy2dJ6+dfW6IGBcps4rnw+tuRO/I8w+7Uw/hRz/JFU0U8SZYrvLTO3VwrF0ZupW70qEiy/2BpITSlkaWUT5o12hCS9UsryV5w/cawnYgC0aJwtl9983RSTBpnGKbCYt/So7tKjs41/KiFDldX5tZfpirvSK6KaJ/DmH61sIhMYTcPGuWJPfNKwDMYYuJ0SEmk/e/sOfJg+Ee7mhtQH4bBYcO3HWXRdQkm/yhEMnR7M+hHGiUtt0cNK6PXSjw80G1jS2U88mw3/NipTqQBSluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tML+fkkAsla4oagPUJMuFrBJe7qpUjDyEplBx4E4ySA=;
 b=yuNSRwDf9KsYslKgwgj2jxY7A2LwiTve6nvOx42RWNUo3COjVdLXMMYzPHU/3nSXLjxMoxuo8lF+xL2VD5nueT+YpPK3l5Pb+ZKddtnBvck+ekV3/LgzKBw5mP/lO+6HXGvKuf9WHOIptykRR3Wjvxg7poJbaEaWIRXS24OqRrM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Jun 2025 13:08:34 +0200
Message-ID: <DANWSEFPPT5J.2HD9QN46N4ROE@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 03/14] CODING_STYLE: Custom type names must be
 snake-cased by word.
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-4-agarciav@amd.com>
 <alpine.DEB.2.22.394.2506131731200.8480@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2506131731200.8480@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|BY5PR12MB4244:EE_
X-MS-Office365-Filtering-Correlation-Id: c72d866c-14a3-4f0d-1f38-08ddacc624ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFNkME1UVVJzazYramN1bC9qN1dYZSsrVUtFUm1PQ0tlOW9jTXJteUpZeGRM?=
 =?utf-8?B?SW82SVpvTlVuLzdTZnZPYmRjcGtQZWovQ2NSWWxXbUt4RHA1bjFUejJESEhY?=
 =?utf-8?B?MXMya1ozTTNnS0pmRnVjUi9LSWloV2NKNnNtYU5DR3pCV3AxTVp2U2c5NUMr?=
 =?utf-8?B?UWlMUWYvZkhtc1VqUHd0bS9LSG1jMVJsZkVBRHJTTDY5NDFjdmRrQnR2ZXcv?=
 =?utf-8?B?YW9MWkx6WExOSS9XQS9aWUgyRGZ3VkhRNERPZ2ZNYlVnTE9oUVVrTnViNGRW?=
 =?utf-8?B?WmgwSjA4VDdPL1paOVVqaFhHcC9BVkhQMDArMmt6ZDBvajJJVXZwSVRSZEF5?=
 =?utf-8?B?R0JJdU5qbmF3N0s5cWlyNThTNEdKenl6RlZSMEM4VEowdlZHaU5QNDk4dlhF?=
 =?utf-8?B?M2xYVm5jaXgzM2JWQXJFSk0xVjI1Z3dBYnhsVngwM0l5RGhnNStkckxZTTRO?=
 =?utf-8?B?NWJiWjFJVnhCS284T3pYUEs2Q0hybGtjQ2NmcUI5QjBZKzdjd05ZbzRFdHk3?=
 =?utf-8?B?WHNWM2M4a0FISys3RXN6L09Qd2JPMC9KZzUxeVp5Y2JvUDBOaG5KYWJORnJt?=
 =?utf-8?B?OURkSlZEZllucC9vcFhkOHFwclhwOGtMQTRuc0RJN0g0MDNQWi9YVDZ4anRv?=
 =?utf-8?B?UUhLSjN4YS8zZHIweXhlTWcwTXM4cUhqVlpNN21PTjhELzBNL1U5QzBibFJF?=
 =?utf-8?B?ZCsydCtEWm8xTUZjRXdkRU9jdER6N0FNTDBmaTJXK1ArUDhsTjRLcmdjeFNX?=
 =?utf-8?B?TmZ4QVgrZ25GY1d4bk11dSszRElheVU2WUVpZityd0hPd2NWeDlPbGRXVyth?=
 =?utf-8?B?ZGwxdzFtOS9mYTV3bXFkU29RdFlSa0pxMDFkdmlHL3VvbFFoZklUQmRsUkRO?=
 =?utf-8?B?eWlQZnI0ZlVPLzJjYlBSVE5RcW1RcHA3TGwrVlovNXM5dFZ3dkxtaUdOOERF?=
 =?utf-8?B?bnUzNnZ6QXhiZ25xL0haMVVNZkJabXo3V2dYWnZ1MjRCOVNUdmU2dU5rcm9V?=
 =?utf-8?B?VGFFN2dieUFoRVNBajFYblF3QnFSNUNRcWxoMVNNR2poSE9ZbmI5Nm1UUThJ?=
 =?utf-8?B?Qm1LM1VOSU9QM3pzdWg5TXlZTThCYW1Db0FFR0lYOHh2M3NFaFRBNFppbFFU?=
 =?utf-8?B?MG9PNlRrZ0lPVDBWSUpiaStKTUJkS1lUR0pmSFp0VUh3ekM5WHJhSkVuQVlC?=
 =?utf-8?B?L1gxV0R2YnBuL3FKNEFOaW9ZV202SHhOWlllbmN4NksxMjJiNnV0ektieFNj?=
 =?utf-8?B?c0srV2xZeWtqZ0ord2lDeVdNbkxMOG83eFd6eDdZY3hBOHM0SWlwazdsZ0lS?=
 =?utf-8?B?UG5SQW9CbnpqQmd0Q2k4RUdIYUhqTEgzdmYwS0lPRVdHT2ZFNWxZOGxEYzUv?=
 =?utf-8?B?dVhYNUJwRG5TNjZ6VmdteUpEdHRObms5aVhGQ3lacVl1OFQ1ZFFTaHBzUGZM?=
 =?utf-8?B?ckNJS0RaQTk4RGJFNWtCWURvOXBXQyswVHFIWDZ3ZUVnVnhkV1lNRWIzVUIx?=
 =?utf-8?B?MEdQUHdyNmxLejR2YnFtclBOVUVZY2h6aTQ5a2lHTWVzanVwYS9FRU03MHlt?=
 =?utf-8?B?QmpzWHhKWS9hVDdrWEQremdGR2RiTHVwL1FBSVJ3dkpmK0pnUWpJbVN3YU1N?=
 =?utf-8?B?YjNGL3lXamRTOWRrV2laRk1SeERJZnZUYjRXVzR1Q0F1Nk14RHloQ1ZHL3pQ?=
 =?utf-8?B?alpoZDJSenNqQ2VVSy9nSWV5SVlpYVlUMEZGeFRDSm84VUdSb0hEYVVpY0JN?=
 =?utf-8?B?bmpSL2pVMDdrOExZMG1HazNpWkI3OFM4c1RGRGdiK2o4d0hicVc0eGRYZGNk?=
 =?utf-8?B?WmN1MFRtUVpPT3cxUXFkR05vS01HdTVnbnh5K1dTYzJZaTVIa2gycUFSUGRv?=
 =?utf-8?B?T0ZWM0E2VyszaDA0STFoTmJvaS9ETjZMWVltYXlBSTJ1WExLeG1nSU1pNjJN?=
 =?utf-8?B?ZnhBbGJFQzN3cWhBMWNjMDVhcTlwdG80VVloYllVSXkyUEhINCthczRjY0Jx?=
 =?utf-8?B?T2s1dEtMcFQ4SlJZd3BaakU4Y1MwUWE3dWZXUk9ueXR6RzVqZkdvNlhxVGR1?=
 =?utf-8?Q?Hh4pkt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:08:37.8508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c72d866c-14a3-4f0d-1f38-08ddacc624ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244

On Sat Jun 14, 2025 at 2:32 AM CEST, Stefano Stabellini wrote:
> On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
>> There's the unwritten convention in x86 of splitting type names using
>> underscores. Add such convention to the CODINNG_STYLE to make it
>                                           ^ CODING_STYLE
>
>> common and less unwritten.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  CODING_STYLE | 3 +++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/CODING_STYLE b/CODING_STYLE
>> index 5644f1697f..e91ef7b3ca 100644
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -126,6 +126,9 @@ register).
>>  Especially with pointer types, whenever the pointed to object is not
>>  (supposed to be) modified, qualify the pointed to type with "const".
>> =20
>> +When defining types, split its words using underscores (e.g: prefer my_=
foo to
>> +myfoo).
>
> Minor NIT:
> When defining types, separate words using underscores (for example, use
> "my_foo" instead of "myfoo").

Fine by me. That's clearer.

>
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!

>
>
>>  Comments
>>  --------
>> =20
>> --=20
>> 2.43.0
>>=20

Cheers,
Alejandro


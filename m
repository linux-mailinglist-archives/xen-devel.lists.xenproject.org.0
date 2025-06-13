Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA303AD914C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014563.1392689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6Kn-0001Oc-FQ; Fri, 13 Jun 2025 15:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014563.1392689; Fri, 13 Jun 2025 15:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6Kn-0001MQ-Ck; Fri, 13 Jun 2025 15:28:49 +0000
Received: by outflank-mailman (input) for mailman id 1014563;
 Fri, 13 Jun 2025 15:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ6Km-0001MK-7z
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:28:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2412::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 175ee497-486b-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:28:45 +0200 (CEST)
Received: from SJ0PR03CA0144.namprd03.prod.outlook.com (2603:10b6:a03:33c::29)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 15:28:41 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::db) by SJ0PR03CA0144.outlook.office365.com
 (2603:10b6:a03:33c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 15:28:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:28:39 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:28:36 -0500
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
X-Inumbo-ID: 175ee497-486b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/4RG1UFsnkBZgO06h67fiyzs0tRQuFeqTU4noLDDrelWK8oiJ8a1DRrbmu5H6UW8PNGc4J9KmhJ9WEVWfxRSQSbpVvsM5r4J2Oq5grtzYgOEFoQV9v8VS7jwAE5CHs1LHg4vf5rsFIYaP49tFEdLEwp9z506SE+UQPMRes8nn0QfxXauHzsXmxzNDaA+ZqPnaMKLjllJoXqFUw2mRZ35n7ivXeceRMMQQ/40xmYe1kkMdDH7TfU/POOVCz3iuk4TcbV3jQjyVE+hg+9Xcq+0LS8nXYn1Cjh2XfI70IZbfEUoRhPoGY8mnqzKpsMgcrRDyz71VJeiWmuMCzdNj/bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiVtHZzVUiY9eQQnXi2ggx7iYYniToaPfuwduTW6X4A=;
 b=SMYIKx0GdvwXi3r7qbWO01cEpnYfC8Ug7+vcKclrspb99zL4KNiaGLWg86pbrCTW4abHK0CWkcOvTkq0lBhGUP0gkL5zitmj7HsFr3OIqhCj9c/lRF/aNm3W51VTZb612tYGLkdG0fN8IpzWvhFobKXyvJjURahBTt+ExxTRacrdG3C9eMVufdVYY23NwDTKzddG9ud0TSvOXxCyUfVu8GHbL1aPkrmea6QA+c7YwkTDv80Ncu0nKw8W09Y71S8d/hWJC6DH7sJdhjkzD+qgyLwbevsCGNlTLcx374bhMIi24/PV9z1APD30gfPpSpg74sELZbeReTnmSZow7/nXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiVtHZzVUiY9eQQnXi2ggx7iYYniToaPfuwduTW6X4A=;
 b=dy0heACa1IfADYLu6TM2nH4ckem/FKaI5Yx4YBlFJSqUV8jEUf7mU1MwoHOW8SKqsaCGR6z5Sw9eOm5H4Rh2X+6nzP5ap84Ior3RSFnPt6x9PIq89GfdOY31xOQk1fqwV09JqjFo05Rxr7SEhNpCtS63Af6xJynZxyKNTFf8hvM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Jun 2025 17:28:34 +0200
Message-ID: <DALIFUC6BIJD.268GQ9CJTU5ES@amd.com>
Subject: Re: [PATCH v3 00/15] Allow x86 to unflatten DTs
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 927769fd-fe11-4e05-b50a-08ddaa8ef93f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlFHQ0tQQnMyKzU5UEl1L3dIanNMSUNOOUxpL05hTXdOYUYzZ202d0NNSTFh?=
 =?utf-8?B?YlYwaDJuQ3RONDdxdzc0UXFETU5FRjc5NHlxczJtbmlSalB0OHYra3M3MnVX?=
 =?utf-8?B?QVNVVDVGWU9NeUZGY1hEZnRHWlRnUmtqQUREK3p4eFV5K3U1Yzk3UlJvNzRn?=
 =?utf-8?B?Nys5Yi96bUNud3F3VEdSOXkvTTQzcTZhNWhXS0dtV0RTTDdJQVg2U2VJMG41?=
 =?utf-8?B?T3hDZWxqMGo5WmI4ZSs5VGswQUFTS3ZGSmpvS1E3UkFyZmxjd1ZyVFBrLzFK?=
 =?utf-8?B?Z0JOc0xSK2paakdpamF1SmRVK2ZId0pwYmdxTHNjZThldjV2RUh1OWtsN0dq?=
 =?utf-8?B?aURxdEI3VGhGV0dyMnBjUTFuU0pjRFRuanFRbmpreUI4RHVLMzE2RzFZZ0d0?=
 =?utf-8?B?ZWEvNlBldTVRbHQ5bEpZdHR6S2dtQ3kvQ2VYR0NQbmpqK2ZpRVdZVWppU0Ni?=
 =?utf-8?B?c3U0eHJDck5OaExrNnNxb2tvV2RNc0V0OVZ1YkZBMlJIUUxPUUdwVXRkVXRS?=
 =?utf-8?B?QlVPTk5zRmwzeEZQamhRSmJZT3kzR01OZittRmVjb0Q4UDNXbUtVUDFGNUpS?=
 =?utf-8?B?VWJZVzlZZktrTXg5VW9RSGxhR3I3U2svbElXOTR1b1lsLzYvYUZRT1duSTdP?=
 =?utf-8?B?QkFGdCtyRGh1M3ppWEM3d0tGUE4zZEk3R1RWSEVWaHBKQWtWK0FoQ1ZNTGtB?=
 =?utf-8?B?YWhNQm9tbkMvd1RWc2ZqTnlqTDJZREtnV1VvNklTczhickZtOW5KODdCVWtS?=
 =?utf-8?B?aUxqTi9IUnh0Ti94aTdzaG9hcE0xTW1RWldlR0Z3S2xwSTc4NEM5bGs1UEI4?=
 =?utf-8?B?ZDJwTjdxbGpDTGwzV2ZCQmFWZVZ6K2orRDZBaHNJeEI5ODZvTzBrQS9ZRTQr?=
 =?utf-8?B?Ulk4SGNSZGgrTjZjdVNFbDBvMDRhR3U2SUM1NWp3L3VhYkhMVEZjNDN6STNJ?=
 =?utf-8?B?QXB4OUdLVXkzOStXQWNHbFdxL01GN2dPdmpFOGtOWGZBcTlHTWp0ZWVlQm0y?=
 =?utf-8?B?Y0RuUGFzMCs5NzNwaHRwcDIvRmZSSWJuWjRnRzNPdTNyVUc3WkxrWjR5MmhG?=
 =?utf-8?B?b2VXNWRRT3M1eXNMT0lzeEdYaWlmYjBGeUZ1WXMvaGxrUEpZWDI4VytXWXR2?=
 =?utf-8?B?REgrZ1FpcklTRjNRVmxmMmlSZVhKdWo0ZCs1bWF4dFdiMk5aenFmRTJKSmNN?=
 =?utf-8?B?ZDNMcmRkYmQ0cTlSSkNidUdyNW1QdTVDbmhmSWhnd1h2eEk1ZjNoUlE1Mk5F?=
 =?utf-8?B?SzdlTjZmUEZFL2Jva3U1YUY1c0NtbitOdGozRFpBdzBwZzN1REZnN1Z3eXlE?=
 =?utf-8?B?MHl6ZnJvZDd5UEN2VHIreEVNcnRPaFFtVGFHT2tUNURVQlp3Nmg2NEw4MjhE?=
 =?utf-8?B?NzFwTzVuVFZYVy94OTJKWUkxYmdKU3p1cU5uYXhrbndBMHdJZTdVMWY0TVJk?=
 =?utf-8?B?RGhvaUhHenlpRmRHanNuSUNBYi9CQWZGQUhwbHpIMitsb2pzRkFhSU9FVFRt?=
 =?utf-8?B?S1d4OVpuTEJOaThDa2JidmVtTjFma3l6UUNhdDFVSTJTVStmR0hNTCtxM0pi?=
 =?utf-8?B?bGZlN20vQ0tZYWNVQVlCV1ZBRzRVNUFSMTkxMXNzWkZwaUVSSXlBMjhEdExN?=
 =?utf-8?B?bnZTNExzN2todmtwSnZ2cWZiRjE1eERaVlZvZDFQWkN4d0VPV0lYbDA0M3pk?=
 =?utf-8?B?VEZkK0RLZjZLcWQyVDBaQnhxY2hENFB3N1NBd2JFNHR1VXA0a1NnbXg5aWxm?=
 =?utf-8?B?NDRnaFhYemVsWnNoVnJBME85b3lXbkhnZlR1eVNiNlVmaVRSSG4zR1F6UWtV?=
 =?utf-8?B?UG9qMUJ6SVFOR002TG55S0hYYk82c3VxVE5Ta3FxLzlxUjBDMkNxa0Faaloz?=
 =?utf-8?B?RkRqNkN2QzJ3K01QcHk3YVBhcW1VTmw3SVQycm91YlJBTDg0RHdyODFaTHFV?=
 =?utf-8?B?NDg5UU51TmdaY1YvM1BPT0s4MEZtcU96ZTFpSmlvZ0xlbHBjTFRVRG1xZkM5?=
 =?utf-8?B?dEJONWFUeERZRkVnbEZXN3NHVkRBS0lIeU1vTUx0QUN6d0d2RVdnRVh2cmN6?=
 =?utf-8?Q?3bR6QM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:28:39.8994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 927769fd-fe11-4e05-b50a-08ddaa8ef93f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542

Bah, ought to be 00/14. Missed during copy.

Cheers,
Alejandro


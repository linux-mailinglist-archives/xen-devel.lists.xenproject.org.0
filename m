Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPpEJ0MnlmnxbQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F115999B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235967.1538774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsoZW-0001ph-MY; Wed, 18 Feb 2026 20:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235967.1538774; Wed, 18 Feb 2026 20:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsoZW-0001nk-Ih; Wed, 18 Feb 2026 20:54:58 +0000
Received: by outflank-mailman (input) for mailman id 1235967;
 Wed, 18 Feb 2026 20:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vsoZV-0001nV-Fu
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 20:54:57 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11a9b2cd-0d0c-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 21:54:51 +0100 (CET)
Received: from BY5PR16CA0033.namprd16.prod.outlook.com (2603:10b6:a03:1a0::46)
 by DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 20:54:45 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::e9) by BY5PR16CA0033.outlook.office365.com
 (2603:10b6:a03:1a0::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 20:54:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 20:54:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 14:54:44 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 12:54:44 -0800
Received: from [172.17.121.74] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 14:54:43 -0600
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
X-Inumbo-ID: 11a9b2cd-0d0c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTVBTTI3/fFzNIc8hy+4R58eRIOGBZMZr1sbVKJqnPHy4+GUboyx7Ywj3JFVD7JdFAAfVSwgbvlTFDqznjdFLRvbJ+F1KCebK+T0M4rJJ8XvNOE4ookoJWmw17me3KDCCRrNQtjwrOyvEEwcrsvpdhtsKwQOaia/ag6ZRMwVJtr121TVWbVrLlFodTGoDeFEoEGw4kVXLOxbF4GHVhNcxA3D24Pd/4CDyD4M/9ku2FxlPwKVWBQk0kPobZW6tGgTkqkPdLBKQ7GsoqiOicZeK5wIMsE8s8T+B3hrt+7XUCv2UraIg0uoo5VKrGt17RNXAc89EPIDF8jb9y6uMkVTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8u7rtXsPu949CZVdiy09ETqGzy/1bo+tI1pKBXJTYM=;
 b=eHTmbbOFua7EeuoRwAVe0PeWBVnVHr8dMy+UqLJrjDRGuCqtVXf//Caz410lywu9ZPN7ZpabnyXoPhcry1JZSZygarARGPMdHzTUEBSECLIiYqjO4Gd8txzKLau7A6kJMro+0iUO756vRkyy5hEklcePMyRueXlkRjpY26Aq+Sj+KI1cdrF0cWWaRXa+qWI/7bxTsEv6Ts7mmb3vRSXt3FQ2t7Srst2nX60t6rhihs8QyZrXcf8unORjmzWf/qyp5AGjBiAUfTstvp/Ai97aV+7JnK3k3K8bf75wg/qBdOmxynJFsYhMJnZCpbvclDDaDVUegVCotWFjE5Ssgym72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8u7rtXsPu949CZVdiy09ETqGzy/1bo+tI1pKBXJTYM=;
 b=MRUqEhvh3PF0uTJSx2rJiu36StQ69Oc2hIsBi4FZKYD0J3JbvexkDfosuYh9K3dVsOl63/NRuKKexoOG1EbYG8Hig+3Y4CvpO6yX0+rssu0HhkcxHYoZ6dvpNiPwWwAxQo5gKHGqOc/ETmLmy8cp2gO3ZcZI6iP2VtzvLAkDe6U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <77add3a8-20ea-4313-ba9c-4be110fc80c3@amd.com>
Date: Wed, 18 Feb 2026 15:54:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] vPCI: move capability-list init
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <b5030a1c-bb01-499c-b75d-27651a09490d@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <b5030a1c-bb01-499c-b75d-27651a09490d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|DS0PR12MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b412dde-e375-43b2-6429-08de6f2ff238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TW1BWGFMMEFOSDNMWTNEWk84RzdseExTOExuM21BZWdaSW1xN2dEbjVubXhz?=
 =?utf-8?B?NnpqUDFQemd4RVQ0QWNaWUVUUmdDdXZXeGFkdktuaWtYL28xYzllc0RBNmtS?=
 =?utf-8?B?UG81dFo3bVEwT3hGOHZWc2hPVU0xQ1pzODlmbmRSZTBoVFRUaUd1VU5GOGFJ?=
 =?utf-8?B?MGx5TnRpbEtwa1BYTTBmWFJNb2FJWnJFVFlGZjNIbkFSenpmYm5WSkFmWFRa?=
 =?utf-8?B?bVFha0RJVkNZdUdHNVhEdVovc3JSUGEvNDIyN2c0ZXZJTGhiZS9lRjFCc0FB?=
 =?utf-8?B?d2ZIVDFkQ3huTW1SV1dzblUrOUtzVjdRODNBa0QxMjZ6am8wYVpCS0JsaENh?=
 =?utf-8?B?ajdwSThWbmVKclFtU0x4Z1g5Uk9QY1Qzei80NEptQVNtMDNlSm8wYXdFOUlY?=
 =?utf-8?B?VnFZaklXa1VSdk5LODA4NHRwS2Z3MzY2QUZuclVjbUJha2lzSDhTeDhkOGFG?=
 =?utf-8?B?bW1TbTdkSHpEZk85V0RGaWhGR0VqVkcxU2pDRmhwR3pDaWtRczFBbnVXQWNL?=
 =?utf-8?B?ZjZZZ0N1V3VCaXY2WlU5S3ZLczJjcDEzSHplZkVvWjVSSjhnZmJoMEQreXF5?=
 =?utf-8?B?NWpGSkxxQ21YNHMybGpoVWlVYldrZVZwSzdEaUhGVlY3US9Kd3loeExUV0ly?=
 =?utf-8?B?cjdMWWlDSkJqbUhLdjBLQUdwckF4MU9HcVFnMlFzbnhoeG01aU9tRno3MzlL?=
 =?utf-8?B?cFF2ZVF6ZTBqaGp2blVObXJOZFdIRHRydFovd0hLc0Q4WGhiQTZITkY5KzdB?=
 =?utf-8?B?RlFFcVBJeG9rWnl4M1RQSW4wT3hIT1VKZm11WTNld0Q2dTZHYjVUNVNwUHZV?=
 =?utf-8?B?UW8wNTFIRm9LRGxFejJWazhFVFFOQmRKRmgvMUtLYnVEWStaSWhaZmpESmU4?=
 =?utf-8?B?RFFYWm1jdjlnYkpwTFMvWjI4UnMxVkRVWjI5MDNra0dWclJkcmIzQ0dPT3NO?=
 =?utf-8?B?dEpYL1BHQTlKNlBNSGpFMnhENFlvcjJsdG0ybUhsVjY2SjVKMXExenJPekhY?=
 =?utf-8?B?RVRGTTJyQ1lnZ2FUMHNCWjBSM09QNlZBb3BzWjlOL0tnVzR4Zll3QlIwcHFV?=
 =?utf-8?B?S1VTcHdVL2JsV0N1d2VWUzZHMWYvbnpTSkR1T0w2bFYxM1Q4cHdhUUU2Q1Za?=
 =?utf-8?B?S1hoVW1sVUJCc1Zpd01NaEpwQnB5ajJqMTh2T3RtRmJCUEVvenpZMzJidFB4?=
 =?utf-8?B?UW1SRGIyVW9vYThBVnE0QUQyV3Mvd3ZtUHhNZjR6S3NDRXRJdlJTVStYZTdw?=
 =?utf-8?B?N0tlcElNVzZ2OWZ6M0ZXQmVuUUd6UHVxVW5FRmRQTzB3NnhKQVZhMGdTbjl4?=
 =?utf-8?B?NjNzN3c2aVlEc2Q0T0pSZHN2eTlsd09rc29TQW1LWHowRjFNdk4wOWkxd1Qv?=
 =?utf-8?B?dXdHT0VKbC9Fd1FMaG9BdWNKYmJpRit3NTRxNEI3NW9kVWpibzlWa09SV2pv?=
 =?utf-8?B?VHpZU3Nuek0yWjF4RGtuM2MrQitHQlZyaVo3QVZiNjhKaTJvQ0ZQVlNoMFVv?=
 =?utf-8?B?cFdxLzhLUWNLL3E3VkpvaXFRUkZnYnc3TkQ1eDFPZzhIckV5WUszOHk3MFFR?=
 =?utf-8?B?Ui85VVhxS0dPRVNyNUEzQWVJOGcrR3hmb251b1FmWlMrREMvL1NaRTh0NlNH?=
 =?utf-8?B?VjhxZ0dBT0F0M0U4RkUycVl4MWptTlFVbmZyeit6NGx6WVJyak40WlFXSith?=
 =?utf-8?B?Qk1wd0xDbDVxdWJsT3Jtb0J4RStwOEFMZnY2SWxtQThYV1BoTTU3K25mczJP?=
 =?utf-8?B?d1NzNXVVWE8vMXlYcWNud0VuWXZsTHJnVmxKc1JwWXlia1V3TXY1OEF6MWgx?=
 =?utf-8?B?MEFmWUF3SmYvcG5JdzZMTkV3M0FDSU9jQ2FhQXVzNUx6T0k3QnhpWFh5Rmpl?=
 =?utf-8?B?WVhqUnJsejhlNjJKQVNPWjUxbXpmb1lpam1JbVlSWnFnbXdkN1Q2VW8vOUtT?=
 =?utf-8?B?WisxRE9ncTdZTXl6Q1hBVXNUNUpiaG96VWFxQUJmQklFTkRTTjZvZ1BqZlND?=
 =?utf-8?B?d0VFOEJWNWVoSGxEdU1yZGdUazBBd1gyTS9BUHJqa01ZL0wwdXVLUXkzY2Na?=
 =?utf-8?B?aFNNcjhabFdJTlM1a3pLS0FJcy9Uc3FMZVo5Z2xuY1c1L1VWSXFEZVdQRFVx?=
 =?utf-8?B?eUFyYUdtRVZHa2FoN0RxSWp2OWdkS01kY2FaVThaWG5JVVBqc2RKK1o3eWMz?=
 =?utf-8?B?QStJOG5mRzlObE1EMFNPVHlKNjNvS3dRMFRkOHZKcVlMalJmNE9IVmUvQ0FM?=
 =?utf-8?B?ZGF2WkpkcTMvQjJ5Z0Jtd3FvVFFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j+1/VnwnT4dZ5ZesgDCAav69Ya6GLWf89XjEqTirhT70eB7kNRAM7GIDmjOIhBBHGcUrQk2f4VVZMZORLzC4fbZfl4vcEiZ1a2XJsui8t+XtBaq2JUh4PsNazzvMMao/tb8dJJq9c3CPpRpqDxJcdZBGVuJ12qPUVR5/VNScl/vfIqykcGxBeH3RD0FQ9s21NdGoJNscNDxdTEfMxQAvbO+VEErboQUSsjRL3xkJVE9Tc+yOBSh0hcwQ/k5+AE5aTHSZXKyRxz6DoNKxCbilZE0J8MSaLexGTaA+8jEB1CMtRAhDe/db6or1rjZVisKAZVdvxpUl12jhMOAkWHFuwc3CsAwqp+p2vY4/M3AELBqdi+IKYb/6Ou/LQzEqy09zuG4Dz/8722SFuWeFrR5MaFlj2WuSdUzQ+qmWDUP/ATM0DnAzRmCT9j3TpesDKJeF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:54:44.9787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b412dde-e375-43b2-6429-08de6f2ff238
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7747
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email]
X-Rspamd-Queue-Id: F25F115999B
X-Rspamd-Action: no action

On 2/10/26 05:54, Jan Beulich wrote:
> ... both for when the functions are invoked and where they live in source.
> Don't invoke them directly in vpci_init_header(), but instead first thing
> in vpci_init_capabilities().
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>


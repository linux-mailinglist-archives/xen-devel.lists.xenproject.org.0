Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33FAC0948
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 12:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993540.1376854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI2l3-0001Oy-PA; Thu, 22 May 2025 10:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993540.1376854; Thu, 22 May 2025 10:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI2l3-0001Mg-MX; Thu, 22 May 2025 10:02:37 +0000
Received: by outflank-mailman (input) for mailman id 993540;
 Thu, 22 May 2025 10:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D/RR=YG=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uI2l2-0001Jv-VF
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 10:02:37 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2415::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0fbafc7-36f3-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 12:02:33 +0200 (CEST)
Received: from MN2PR17CA0019.namprd17.prod.outlook.com (2603:10b6:208:15e::32)
 by CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 10:02:29 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:15e:cafe::23) by MN2PR17CA0019.outlook.office365.com
 (2603:10b6:208:15e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Thu,
 22 May 2025 10:02:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 10:02:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 05:02:27 -0500
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
X-Inumbo-ID: e0fbafc7-36f3-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlFpmVnyYiluJhtJz/diImoQXgYGlV4Ik4u6zdIwwXEAXzXUrdNYGiXaO8Q6FlG+clturrTUVL2lkiTJjFaPyJ5TlRzMdzONPohPh4FtqK2Q4mn7zzd7AIbrovrzh4MMWojp6xMR7ZHy/M+v+emkGuh1JOadLM+ATzq6kz9DDDlNjLsCxez5PlHnOevLibvsjdkXtfYb2N27mTZtQC8lRS2YU00Kp6QxIWORGePplWi69GhWWdBpinGJSj0Cev59I+9fBxKAT44BPu/QCZojEOXjZSqAYOKO7JI3RZHjUp9eQoEwCBhoqrTSQF8AdHmMO7asBjIkGmcRzrY6cMm/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDuwohqFm9W06N3m1OX1PgjDeBTjdxPpYim1t1NuvIc=;
 b=mB89g5qLFRJLADfT8gDnA8lEw4mGsJJRyCK4FN3vURAhxcohxksazeXggd4aNL/fC0DIBef+7TEsm0XSNqz9iKmFx0PCyaIKmtIC04zYxpKM3L1FaDXtI4CZm6X/I6h8Wvs0Mcq7eBbtXtNtYTO46vWXUq4GCns6515ZLoXMOr82fhREJ17TJ+G3sKsw2C0NRhW0BDKfQ94QwuAZWyfRDoHKbKfzWhMTltCLiAQtaH/S23VQAeEaxDHjVrA3TeV2pxP+QYxlmxL07EFKiAOn1AIifEEdOpnVXerDJfr5PZPo4AA3xQDWhkexqrAAH5ouuxIiox8juhZUIq5qnLEXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDuwohqFm9W06N3m1OX1PgjDeBTjdxPpYim1t1NuvIc=;
 b=R0m5xPFMfQNQKtrG7c3CTSlmh39qHUNOz3GRpkvffH+a5WAgXHFLh6z7AvoMcQp1haySkSTmzMFB7MuZlClC+hQkCyEA9FsSfHlOOWYbckmulRBwNzeKHf/P1wuwQnr20cqCtyXKA+FqdYgd/UEoqs4MmWNWGkSZSL5yBf4LS9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 May 2025 12:02:25 +0200
Message-ID: <DA2LQ4W7KA83.2BYT14EM8PQQH@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: Hyperlaunch Device Tree Discussion
X-Mailer: aerc 0.20.1
References: <85d65163-6120-4653-8ed5-e7752ae7ce48@apertussolutions.com>
 <ba4ace43-b736-409b-a582-b730c763694e@apertussolutions.com>
In-Reply-To: <ba4ace43-b736-409b-a582-b730c763694e@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 279692b0-7a0f-4fc1-81ec-08dd9917c297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHppR2JmdTBMVUpic1RCeVRVUUpxRnhxTDdNbDRDODJXNUpGU29jNndZVHVw?=
 =?utf-8?B?Ty85bGR6a1VGQTZuSTQ5MFdIRUkweFFvcVdEYjYxdkgwanMxT0J4bUUyMXJ1?=
 =?utf-8?B?UEdhbktkSFJYUDEwUkRScFZGaHpTV1RaV3FraFBFVVQzem5kV3NpdU1uTytM?=
 =?utf-8?B?OVdsQXNFcGdMQVJ1TCtGMG43cmwzeDBuQmlMUXVDZGpxUm1lUkp5RjhOT0hq?=
 =?utf-8?B?UFh4MHlObnRFZWVaYVUycTU4QVQ0MWJBQ3lRVTZPMVR5ZGNwNDVBUkFvMUM2?=
 =?utf-8?B?WGJiNm1vV2ZuZDdpK21jMEhPMWpHQVRXaFk2cjhwYXdUUzR6V2NrTzBudTE1?=
 =?utf-8?B?bklhWk1WbzdCclRjWVgxSHo1eXhXRjBkYVlaZzZMWm1Fc3d3MDBJVTViVzk4?=
 =?utf-8?B?S0k0Vm0zdmlzVHZ0c2lrdzJsMTVSR1p3R3l3eWNGVHpBbFczK2EwZjk1TkRU?=
 =?utf-8?B?OEpML2xlVEpnNFl3ays2YjVOelhRTWVpNmZGMGNlVmxSQ21wUXozWHlxY2FM?=
 =?utf-8?B?V2hGMlc3NWhHNFVXSXlqN3BNWk1SR0V2RE50SUg0d3hhVTEyOVI4Q3hmQkxH?=
 =?utf-8?B?cGRDVTF4Y1RoQmpXSmdMWE9oUHRsOGVQb0g2ZlFKbld6VTQzV21xYytKVWhG?=
 =?utf-8?B?VFoxZ050Mk1vNFpkTlkvbTR6SGRyMkcxUFhCdmFQRGRuUGJxRjJ4YXVKYVpy?=
 =?utf-8?B?a2l1Y2wrWTgycVNxSEpXRVZIK200T3pLTUFtOWJKNXBMZTdVd3VOK0FWcEw2?=
 =?utf-8?B?QzQzUmtoUWMwN3hzVE5haVVMbTE5Y2pFSWE0OEw0NFdoeDRlczVhaFc2R3NW?=
 =?utf-8?B?TnRTcHVUZGFxYnVNcEh3RTdnOEE1R1RPbTRjdGZYTDNnWmlCdnNMVGU0YVJq?=
 =?utf-8?B?RjB0RjIrRDJvL3ppYk1YZTJlTkQrbmE4SFhVbzJBa3p1UllRdmpUU0tKQ0c3?=
 =?utf-8?B?VmxER2t3THdObG40MW9nL1YyclpUK3hsaDM0b09VTVEzRWxkcWtPMS9PdlFG?=
 =?utf-8?B?OXdqdThIUVV6QWVzUklLSjVhUlVUeGFqNkljMjdGdVlKNDJRMDVYSVNVQlpM?=
 =?utf-8?B?SzV0NlRFY3ZxTWZqU3ZWeTBwaHlSeEg2RitZa0taSFkyNHBjWXZMTnBWaUd4?=
 =?utf-8?B?aWZaVW5ScVJZRmk3czJRUXRuemJ0eGFOeTlUcUZNb3lmb2FvSmZpRW5sNmFI?=
 =?utf-8?B?NVF2ait6RFc0a2d0QUp5ZVRTMXJsK3FvdTNjdXNqdVgzUUhob1NyQWRTcmc3?=
 =?utf-8?B?cFZxRXpEOXJ2ZitzYW5QeVEzejRYaXNybG9YY1A4TUxFc0hEYVdPYUZrbXRB?=
 =?utf-8?B?MWhRQ2t0SGRUNGtUenhSajFxdW84a3dVUFp1ME9WL3JnNkhpRk1wNDVJWHFo?=
 =?utf-8?B?NlFKZS9TMkZ1Y2k0c3BRRkZjaTRRdkhwcTdRTVlPcXd1eWg3Q0E5RU15djJC?=
 =?utf-8?B?MUwvU3pmMEVhRWU1bXhkZmJDRTFJN0dmTmtCL2VVazc2alg4dndzQWgxWE1X?=
 =?utf-8?B?TDd5OXJJSHRGM0Z4dTlaaVF4WG9QWERiR3lFNEZnQ2tKZ0ZxY2VOUzNzS2U0?=
 =?utf-8?B?UE9nVTRkV3NBaE05N05NYWY3OGRvSkFheGRPdkpCWlFZN25pa1EwenIwRG80?=
 =?utf-8?B?Nzk5S1pGOEdTM2hqSkJyZUYwRHMwYjBSclI3SkNGM05JcDNJWW55bXZLM0tR?=
 =?utf-8?B?QURIQXUyV01KQVp3bVJFK3ZrRDB3allKUnVHK1gyTHU4Q3haaDJzQTBtSmZD?=
 =?utf-8?B?eG1Tc01zS0VGa09oVVBVTXlxRE5oajlNZVVFaVJjQkR5b2ZYZ0VzMC9CRDVw?=
 =?utf-8?B?d2NkTlVQTkVzZ0ovOUVxS0x2Zk5aejhoaHd4alMxdTlqUlhwUlpXT2N1R2Fx?=
 =?utf-8?B?YXNHdzVSSlRCclZBdmdMNnhGR29SaGtNZnFodVNjVEoxWUpUS0RTZXBMVFdV?=
 =?utf-8?B?UXF3b2ltS2wwOGNER2FmTm43aHZCRUxjaFRIU3RHNVdrL243SzZJWlhaTG9S?=
 =?utf-8?B?V25PMWlMb0FlemFFcFZBTG9UWU5oRXdKeU1lQWY5VjF5REt1UzB2S1gyYWhi?=
 =?utf-8?Q?fVhfhb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:02:28.4047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 279692b0-7a0f-4fc1-81ec-08dd9917c297
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177

On Wed May 21, 2025 at 5:39 PM CEST, Daniel P. Smith wrote:
> Greetings,
>
> Per my response to Allejandro's message, here is the response sent the=20
> the DTB working group formed last year to discuss DTB parsing for x86.
>
>
> Original Message:
>
> I have copied everyone that attended the hyperlaunch working group a few=
=20
> weeks back to ensure everyone has a chance to review and comment.
>
> As a start and to provide a common understanding, first is a quick=20
> overview of Flattened Device Tree and Xen's "Unflattened Device Tree".=20
> The intent is to assist everyone in having an equal footing when=20
> considering the impacts that Device Tree parsing brings.
>
> A Flattened Device Tree (FDT) is a nested linear tree structure that=20
> uses a combination of tags, layout definition, and headers to allow=20
> navigation through the tree. Because the layout is nested, if given the=
=20
> offset for a node in the FDT, it is possible to start at that node and=20
> jump directly into the tree to access child nodes and properties.=20
> Provided below is a visual representation of what any parent node,=20
> including the root node, may look like:
>
> +------------------------------+
> | NODE TAG (parent node)       |
> +------------------------------+
> | Null-term String (node name) |
> +------------------------------+
> | PROPERTY TAG                 |
> +------------------------------+
> | struct property {            |
> |   u32 len                    |
> |   u32 name_offset            |
> | }                            |
> +------------------------------+
> | Property Data                |
> +------------------------------+
> | NODE TAG (child node)        |
> +------------------------------+
> | Null-term String (node name) |
> +------------------------------+
> | PROPERTY TAG                 |
> +------------------------------+
> | struct property {            |
> |   u32 len                    |
> |   u32 name_offset            |
> | }                            |
> +------------------------------+
> | Property Data                |
> +------------------------------+
> | END NODE TAG (child node)    |
> +------------------------------+
> | END NODE TAG (parent node)   |
> +------------------------------+
>
> Before moving forward, let us clarify some terminology to ensure a=20
> common understanding when discussing a tree.
>
>   - node path: represents a series of hierarchical child nodes starting=
=20
> at the root node
>   - adjacent node: the logically next node that is at the same level in=
=20
> the tree
>   - child node: a node that is a one level lower leaf to another node,=20
> the parent node
>   - tree walk: incrementally walking the nodes, to locate a specific=20
> node or to iterate over the whole tree
>
> The libfdt library provides handlers for finding the offset of a node,=20
> as well as handlers to jump to a node offset and iterate only on the=20
> child nodes. While the libfdt is fairly optimized, the reality is that=20
> to find a node, the library must do a tree walk starting with the first=
=20
> node written in the FDT. If a node is not a path match at the current=20
> depth, it must cross a null terminated string, all the node's property=20
> entries and all children nodes to reach the next adjacent node. Once a=20
> path match for the depth is found, then the search may descend into the=
=20
> next depth and repeat the process until a match at that level is found.
>
> This brings us to Xen's "Unflattened Device Tree" (UDT), for which I am=
=20
> quoting as I find myself thinking of it in another way, which IMHO is a=
=20
> more descriptive name, which is that it is an FDT lookup index. It just=
=20
> happens that the implementation for the lookup index structure is a tree=
=20
> structure. UDT uses a structure to represent a node and one to represent=
=20
> a property. The node structure is a traditional tree structure with=20
> adjacent and child node pointers. The contents of both structures are=20
> pointers to the respective memory locations within the FDT. As with the=
=20
> FDT, in order to locate a node in the index, a tree walk of the index=20
> must be done. The difference comes when a node is not a path match, to=20
> reach the adjacent node, it only needs to access the node pointed to by=
=20
> the adjacent node pointer of the current node. UDT provides an API for=20
> walking the node tree, walking the property list for a node, and methods=
=20
> for type-interpreted extraction of property values. NB: the=20
> type-interpreted extraction API is codified around taking a UDT property=
=20
> structure, but the interpreted extraction logic isn't UDT specific as it=
=20
> is still reading the property value from the FDT.
>
> The benefit UDT brings is when repeated node lookups and/or repeated=20
> phandle dereferencing are done. For both FDT and UDT, a tree walk must=20
> be done. The walk will start with a node, either the root node or one=20
> for which a reference has already been found, walking each adjacent node=
=20
> and descending into a node's children when a path match occurs. For=20
> phandle dereferencing, the benefit is greater due to the fact that when=
=20
> indexing the FDT, phandles get dereferenced, thus allowing direct=20
> reference in the index. For comparison, a phandle dereference using=20
> libfdt does a walk of the tree to find the node referenced by the phandle=
.
>
> The UDT, as implemented, is not without cost. The current implementation=
=20
> takes two complete walks of the entire FDT using libfdt. The first pass=
=20
> is to obtain the amount of memory that is required to allocate enough=20
> instances of the UDT node and property structures to represent the full=
=20
> tree. The second pass is when the FDT nodes and properties are indexed=20
> into the UDT.
>
> With the expense of using FDT and UDT established, it is important to=20
> put that expense into context. Consider hyperlaunch on x86 where the=20
> arch itself has no DT requirements. In all likelihood, an FDT=20
> constructed for this arch would only contain the nodes necessary for=20
> hyperlaunch. If hyperlaunch were constructed x86 only, loading the=20
> configuration could be done in a single full walk of the FDT, even when=
=20
> considering phandle usage. The reason this is true for the phandles=20
> case, is that as nodes known to be a phandle target are encountered,=20
> their offset into the FDT could be stored with dereferencing resolved=20
> post walk.
>
> For DT based archs, currently accepted costs are two FDT node lookups=20
> along with the two full walks to construct the UDT. These first two node=
=20
> lookups being the memory allocation table and the Xen command line. As=20
> noted above, an FDT node lookup requires a walk of the linear tree until=
=20
> the node is located. AIUI at this point is that the number of nodes that=
=20
> must be crossed is indeterminate. I did not see anything in the device=20
> tree specification that the FDT must be packed in the same order as the=
=20
> string representation. NB: I have not reviewed the DT compiler to see if=
=20
> it optimizes for early access nodes to be packed at the beginning of the=
=20
> linear tree to reduce the number of nodes that must be crossed.
>
> While the aforementioned strategy for x86 would be optimal for x86, it=20
> is not necessarily the best for DT based archs. Hyperlaunch started, and=
=20
> currently is, focused on the x86 arch, but long term it was always=20
> understood that its more expansive design would be desirable by all=20
> archs. Like anything that moves into common, a slightly less efficient=20
> approach for one platform is accepted for the benefit of a common=20
> implementation that reduces the amount of code while increasing the=20
> number of reviewers.
>
> After listening to everyone's concerns, re-reviewing all of Arm's device=
=20
> tree logic, and considering everything in totality, the conclusion is=20
> that there is a core root cause from with which all the concerns raised=
=20
> flow. First a summary of the main concerns raised,
>
>   - The issue of memory allocator(s) available at the time when the=20
> first FDT walk/parsing occurs.
>   - Overhead of doing a more than one FDT walk to obtain the hyperlaunch=
=20
> configuration when phandles are in use.
>   - Supporting FDT would require the introduction of a=20
> duplicate/competing set of property parsers.
>
> This root cause is due to a design decision difference made for the=20
> hyperlaunch domain builder versus the dom0less domain builder and Arm's=
=20
> approach to device tree parsing. For dom0less, the approach is to walk=20
> the UDT index tree at the domain construction time, which appears to=20
> stem from Arm's need and practice of repeatedly accessing device tree=20
> entries. Whereas x86 has no need for the device tree and took the=20
> approach to do a single walk to extract its configuration into a code=20
> usable structure.
>
> With that understanding, it is believed that these two approaches are=20
> not diametrically opposed and in fact can be blended together to result=
=20
> in a generally optimized approach. The approach will be to conduct two=20
> full walks of the FDT, an early boot pass before memory allocation is=20
> available and a second pass after a memory allocator is set up. Both=20
> passes serve to populate the proposed boot info structure, specifically=
=20
> the scope of these passes are as follows:
>
> Early FDT Walk: (static values)
>   - calculate the space required for the device tree index
>   - count the number of domains defined
>   - Xen command line
>   - XSM policy
>   - arch specific static values, via an arch_early_fdt()
>
> Late FDT Walk: (dynamic values)
>   - construct device tree index, aka "unflattened device tree"
>   - populate boot modules entries (NB: boot modules are expected to be=20
> static array)
>   - store device tree node index for top level index and hyperlaunch node
>   - populate boot domain entries, basis will be device tree index node
>   - arch specific dynamic values, via an arch_late_fdt()
>
> By taking this approach which is constructed around a set of arch=20
> neutral structures will enable another goal of the hyperlaunch series,=20
> which is to move to having a common domain creation/construction logic.=
=20
> Currently, there is a significant amount of duplication in each arch's=20
> branch for boot time construction of domains. It will also allow=20
> removing arch specific code from the initialization of common=20
> infrastructure such as XSM.
>
> V/r,
> Daniel P. Smith

This is helpful context, thanks for digging it up. I'll keep the answers
on the other thread to avoid spreading the discussion.

Cheers,
Alejandro


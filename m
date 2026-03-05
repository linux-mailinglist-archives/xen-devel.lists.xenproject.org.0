Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KW1OopLqWk14AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:23:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D420E4BE
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246345.1545551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4vG-0008K8-KZ; Thu, 05 Mar 2026 09:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246345.1545551; Thu, 05 Mar 2026 09:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4vG-0008H1-Ha; Thu, 05 Mar 2026 09:23:10 +0000
Received: by outflank-mailman (input) for mailman id 1246345;
 Thu, 05 Mar 2026 09:23:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vy4vE-0008Gv-MS
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 09:23:08 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eab49cdb-1874-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 10:23:06 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB4951.namprd03.prod.outlook.com (2603:10b6:a03:1ef::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 09:23:02 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 09:23:02 +0000
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
X-Inumbo-ID: eab49cdb-1874-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0IzIvXX+DUxAQsZPIuKvjE7r140VHs+vDvxCWuwHOvVGKPPRzCRMLVNkUdRx5qZZt9p975V4rS1Z6D7tCCm1IladvkRyo9uweNTln7trwmu1RRF3U8MDwOOLlYFvhiWHmdPuxL5T/NtM3dQij7+nr7Dt4yd8swFC2vtnuMoilR8JJYgJx7w/lkdUVN1d1+SXi68pbhsgRe5QIJvXsMZ3DcTT69Dz0omDrGW22A8caT3XkKusLCo/r1dtNqWNuHKyLLz8dw1Xtfys2Ho5xiu88hSmuw8rXVWDPYXydyawGRME/n7TYfh1kIiNy/7I1rdLjLOHV+XKfCZytsHOuVc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnqH61YeoPBXGbVx1OCxJwj77CibYbG86rJfkhJtWt8=;
 b=MjbsPOGFWCgldrvLP1Z4lbT4AjevvzM8gKxs1rslPnQsnsg9R/JaaZ7RrBDSKvi6VVzWv3k4TqHq7K/ffTFYCdRsJm3UqX3KYlzooZmDIdWcNTIfYYB0xu3fT5VEQ0zy/jhBPSHQNsdg7g+umHb8yukDVEiU9KzkNr+12RWd5eE8EkFiScodklanEtQqvhHYxwqUjZjGNhYaudHd4QsXBDrgdwn+sKMu6rv5lsEAhl5ufSdoyhTIw90i2dBiovYwjH7rEF6TKFTXJMDZjdQh3jy9LNuMuYLLmu8wq4blyAHTa+W5mWWQvhG3kxA9r8E9ft8HaucIw7jnMm5obrM2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnqH61YeoPBXGbVx1OCxJwj77CibYbG86rJfkhJtWt8=;
 b=y/wI6g4F+dis1hycsQYBJbDXCyJyIXifbnZGNJ3Qq8mzsLB6d6r0J2670id52opaTQV7ofn7+R/AdND/z9sQLoHzN2uupsGfwOdSx7XlIZw9yahaUbQwhW15V7tN4T02DJkphpxONldThO2CPckSyj+YDolQGleGU3LdSpBBMu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 10:22:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v5 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
Message-ID: <aalLc4tN5ywM3c_W@macbook.local>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
 <aahKkV2csf28Y0YC@macbook.local>
 <2c3fdfb6-5788-4177-a264-56719e1ae804@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c3fdfb6-5788-4177-a264-56719e1ae804@suse.com>
X-ClientProxiedBy: MA3P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a6815ef-1c7c-4764-632e-08de7a98cceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	jsFjfPD3z3aTWb9fu21YqVL8UvPL5bH+EjiZFYyX5F8KMxDeycg/dSIIn+pu/vTwEJW0hOE68ESGQpqCjaGiXqGjzSi6oBxvwK+pWAEHeWI95yUdFD8Sa7GyJXgmQJeWwNGMQFGX1HAF+yCKS+CXSpiSIcweP5yKxc7eiI8I57ePmCQm3r3qEasSZYUWhERykEHj6YdOiO4nfxs6u/5317IE4Gyd+6S74S6KBUs8NmJBKTH8MaaV5+ao4QrJdKUaBEW8FhBcp577dJoN1Wz+GZKj9dUseePpPYjY5hlkK5ojBztLvj3ZVJ6yncDCjC7v/NtiDY1SG7XM184hXF7Mc2FvqNbqxA+naYi86l1mQcA/uxjOGHUJGTh9JiEKVil049Uj6TgqFgnEj7GVjB8BXa08tdCA5C39pKXbVAOyVkt+o77k2zQm/11AaKHgudRNOhuqhIzWhZJevFIBQk+sofYvAKZTFDTgusXDNzobv0gcvb9u046DOvn/TwxtQCatoS1EjySiBRDfGNs/ZUnMhk9XvXYh8NFfgvMEJzreiLuvNOVQG6ZpNIQFPKlmSxKiPIAN+iguhQYv5DeCgeMddpyHJUnUPQn9fGLQUT8oxS1l4OaBBRHI5kbTuf14yLV2qkTjTco/s/WZlehje44t+mUCGBBUg/CSAivaxoQKKJPJIya4MSQSxeMVpITQfOx/TfV3kW65zk0CWShzbSXFNpySo1J5PzoJuctk8FrlK58=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlZGREJKVHJPOFpzWkpKWDlvMjY4Mjd4bmZHbmd1Q1ZDMlBSaFFwNWJDM3Np?=
 =?utf-8?B?eTc4Q0NvcDV5RldBZU9uT1V0emFVVWlCdWpaOTZWWkRiN2xxUENER0xQQWtk?=
 =?utf-8?B?akVKRDJLeEtxREFQaTYyTkx0WmY5V3o3WFZpQVh5ajlWTG9OSVZ0bUt0aENp?=
 =?utf-8?B?L2Zpd2VuQmRpT0s0TSs0QURkL2E4UWkvZjN4YWxvekpZQlQ3R0xwSXd1eVow?=
 =?utf-8?B?UnQ2eTQ1OHZXT0h4eFdNQ1c4U29TN1EzcStHSnpzVHc2OEptL2dqWGQrMUZH?=
 =?utf-8?B?cTFZbkFZK1lyWTlMb0NmNndmSDYvMTVBUDZXZnVnSkR2MW9UWTUvM1BRMmc0?=
 =?utf-8?B?RHQvMU9MM0F1Y1dkdU1FU0FYaVg0c2Uyd2RjK0tNTkltdnkyQTcxV1Brc2VI?=
 =?utf-8?B?Nmp5QkQzY0RBc1BwMDY1cnJDZURWRHpMTS9Ya3Y5bHdmNEM2MTR3WUdYV3lk?=
 =?utf-8?B?TlBLQWRjYUZKeTNKL3hEU1RhQ2hyQzZ5SFdRUUNzVE9BR2xxRGppWk5US2ZJ?=
 =?utf-8?B?WWdoU0xvdnpldFVjcS82Q0cxUlpXVGxGUEc2L0pqL3BoK1k0VVNKQTdabmJ5?=
 =?utf-8?B?VmtSUDZrYUhCSjc4Zm1MeFNxckFiSEdvdjg2UWFyWmhYRjIxVjBUTC9OUURO?=
 =?utf-8?B?dERkbGJhS1B6Y3lGSzR6TzRNY3QvTTlUTVVvdFVuR05xSk1JanRUYWpVN3Jk?=
 =?utf-8?B?d05kYmdWQ2pSVy9QT1B6bWtzVDMrSENyZFF6RnFFSUFmL0ZabU45VFZtM1JF?=
 =?utf-8?B?N1pSd2RjWU9uYWRkVldBRlU3MVIyM0pGU1RkTThmelEyK29PbnczbGk4V1VN?=
 =?utf-8?B?cUE0OVdWRCtweElmMDM4a2dKYUQyeVlBS2RRQlpIOWhrUGFScXJqK1lLUkFj?=
 =?utf-8?B?QlBnMlEvSFNBd0I2Z0l3bnJ4M0V4SzJzdkxId3M0Ny80WVkvNnNYa3YyQnR4?=
 =?utf-8?B?dHNmZ3VpNnpQSUxnV1pxZG9YTzJVZlNoTkM1RXRKQm1jc1p1VDB3SVlHQlgz?=
 =?utf-8?B?UlV5WTJhNGVWU1liM2UraUViV3RYQjNhbFZDTGZMbVl5aWRQdnNXblh6OThN?=
 =?utf-8?B?QUNHcDc0dExpMzlNck56U3BhM1FGdHZTbDRWc0owZ3I3WW5oYzg2VkZIbzZo?=
 =?utf-8?B?TGhPM2lOT2dPNEdYemRZQXB3RkRYbmdFa1dPYWRrQ0R5cEswMGcrc28vWlBa?=
 =?utf-8?B?dlJNVHlmV3BmNDRGTWNXWC9WTEVaMXVBbGpZbkRoUHNraUJ1bW9xUVMrWE5N?=
 =?utf-8?B?QWtMNVhtSjQrejlUcjFtM2xaVlEyUStIUmtUZHhLdUtJb1NWK0dMOTRPQVd4?=
 =?utf-8?B?eE5PVnZZNHprRy9HQUV1VVdiTkg5Lzk3N0wvMlNsVlhZU015djl2NjdGWTBJ?=
 =?utf-8?B?eW1jaUlsdTh3RVZ1QlVHR2tTeW40aHZxUlNpbzZkL1o0UStmYlZxV00reGVs?=
 =?utf-8?B?Mmt5dWluWEJ0dVV6VGlwdyszM3VienZ5cUNWN09WZUg3eXh6NFVLa1BMTXhK?=
 =?utf-8?B?SzRzdFBlWDRBUm1xLzlaWUZpQVd1VjF6ZEhaTHZLZ0tFM21zMXlNdC9WMmkr?=
 =?utf-8?B?aXBCVTMybDd4S2N3bEFSZVFrUCs3NE1SNnZBRTFTYVVZTFdXK3NPb2NIU2Ro?=
 =?utf-8?B?OUp5SHNWbTdMNTkvS3l2eFpEV2ZHQlY1SWJXOEFMa1UrNXY5ZnlwamdvNERq?=
 =?utf-8?B?cW83eVRhZjdsczFrVFVQaStiM2Fjb0U0bm41NG01c09aWExiR1RjMUlabUg5?=
 =?utf-8?B?MndGaTZ4VUd6S01jNTlMSFp4TXE4OWdNRHFpZTBFeWFhYnFYUzQ5bGFPK0ZY?=
 =?utf-8?B?N3Z0R3lmRXp3RkUrbUsyWXh6enRIUjZ6VGszUndERFRXRDRJcU1TQUF3cVdK?=
 =?utf-8?B?Q1NUYzRJOXZuZUhpa3VXY2dNb1ZrZ1dTR3BXSURpM240VTVJZXNwYStkbnk5?=
 =?utf-8?B?RjJuRkRkNVdhQ0hvUnRvaU5CT0FuUFJScXFDUkZ1ZnBzZDdQR29yL21kbEZL?=
 =?utf-8?B?VGZpZlhnbWhGc1pxQjAvWnNjdTNpak8wTUNqQ0V1cWpnUTRWT21OSi94QjNr?=
 =?utf-8?B?V1ljVmdtaW96bkp4OEgxOFBOZUdXZnJMSzMrWUNtY2ZmQ0VsRkUvcjlPNE8w?=
 =?utf-8?B?aHlyaDk0bGF2U1Zha1A3WTFpWXdEYXNrdmNxOEQwMEZzRytIazArNTIvUEl0?=
 =?utf-8?B?cy9TaTJsV2h5TzVKV0x6RkIzVmxMdmNMNDM1djNnaHNHVnJVK3JkUVVOREhm?=
 =?utf-8?B?eHFPcldraWxKQkx4dVd3bDdIYTJtOEthaEI5QWhRbjlEMjZzeU0xU2xyZlBr?=
 =?utf-8?B?L3hKODdIUHU5OUxYcndRVVFEVnB5YTNrQmJjaGp4aXNhZFJRRTVMQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6815ef-1c7c-4764-632e-08de7a98cceb
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:23:02.6615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23m7ealdRJc4QP//JMG1raNuqnlqAjLTOa1pRDFDsRzj9zJp4IpFy3r+CBfAVPB5R+RLRxKQXerXk0CGdKkeXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4951
X-Rspamd-Queue-Id: 654D420E4BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:00:13AM +0100, Jan Beulich wrote:
> On 04.03.2026 16:06, Roger Pau Monné wrote:
> > On Wed, Feb 25, 2026 at 12:44:44PM +0100, Jan Beulich wrote:
> >> When Dom0 informs us about MMCFG usability, this may change whether
> >> extended capabilities are available (accessible) for devices. Zap what
> >> might be on record, and re-initialize things.
> >>
> >> No synchronization is added for the case where devices may already be in
> >> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
> >> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
> >>
> >> vpci_cleanup_capabilities() also shouldn't have used
> >> pci_find_ext_capability(), as already when the function was introduced
> >> extended config space may not have been (properly) accessible anymore,
> >> no matter whether it was during init. Extended capability cleanup hooks
> >> need to cope with being called when the respective capability doesn't
> >> exist (and hence the corresponding ->init() hook was never called).
> >>
> >> Fixes: 70e6dace747e ("vpci: Use cleanup to free capability resource during deassign")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> vpci_reinit_ext_capabilities()'es return value is checked only to log an
> >> error; it doesn't feel quite right to fail the hypercall because of this.
> >> Roger brought up the idea of de-assigning the device in such a case, but
> >> if a driver doesn't use extended capabilities the device would likely
> >> continue to work fine, for Dom0 this probably wouldn't be quite right
> >> anyway, and it's also unclear whether calling deassign_device() could be
> >> done from this context. Something like what pci_check_disable_device()
> >> does may be an option, if we really think we need to "break" the device.
> > 
> > We may want to add a note there, stating that we have considered all
> > possible options, and hiding the capability and hoping the owner
> > domain would continue to work as expected seems the less bad of all of
> > them?
> 
> While adding that note it occurred to me that in order to keep the device
> as functioning as possible, in the re-init case vpci_init_capabilities()
> might better not bail upon encountering a failure, but accumulate the
> error while continuing its loop in a best-effort manner. Thoughts? (One
> of the two return-s is already guarded by !is_hardware_domain(), so that
> could be left alone for the immediate purpose.)

Right, yes, that would be preferable.  We already print a message for
the failed to init capabilities, so there's no need to print another
one in the caller.

Thanks, Roger.


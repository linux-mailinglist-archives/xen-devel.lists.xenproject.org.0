Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHdTJcMEemlg1gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CFA1765
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215633.1525774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4uV-00086d-6J; Wed, 28 Jan 2026 12:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215633.1525774; Wed, 28 Jan 2026 12:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4uV-00084p-3c; Wed, 28 Jan 2026 12:44:39 +0000
Received: by outflank-mailman (input) for mailman id 1215633;
 Wed, 28 Jan 2026 12:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SYzK=AB=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vl4uU-00084j-3U
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 12:44:38 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17c0ef29-fc47-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 13:44:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6062.namprd03.prod.outlook.com (2603:10b6:5:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 12:44:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 12:44:30 +0000
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
X-Inumbo-ID: 17c0ef29-fc47-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8f5KRMAnGJGY4DqXlF5BLnB75aGsfjruYDKz15XncKAaxC1UaRY9wL/W9PW4k+EbB9q8/a1445EWjpEuq+1JaSqH8hfhkHK3zWx4vepFzqScvnTSfaHl8ZcGvCXaKOGCFpZLcobutVhqH6BEwB+B6JEDR4lB68cs/QubblYTI29CsKgEDF84rVEd62lwDUG0xtRJ++b55zGRbkZnTd5Zy8je95OnQHwDuDLyIgOpKTZzvmiKwT/y0VgAC+siGPnzMzwdb85Jn9mJrr5kU3w7YZ4TB1jSM6JqUW04VGGya6vGorDcv5hdS1fwfTiUfOcklncTQ+R8Xz4x5wbYK/KCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ac4kfezQV6i+ENth2s7TXdBqSDAW/p+vB0il98s9/M=;
 b=Ni8zb9srP9071yVcnFJz9aoh+hPf/SnEZUaRauQaJEBBhFxGUw/AO0P+Tt3QfS8AmvWQXQ5SlSAUsfAY2Ybbe1o2L+J/o3hqXCTRsfXCj8GVLcOUmIFwtga+cBHSQ++nYX5xpOk1YjHU8j+g6EIYWwAkYTahuOrssjJOW5prNRqp8tctcrbeCLgH1bItUvYdK5Yxz14QgH9C6/3ae4jjw5/TVlFo6AL7VXMVQGa53xBH09RUenB/PkGeQ8M5ZunnO5QIfQx0yDlm2nAiCb+Sc8exVPMmaWTipD8aQ2nC01PJdvbXu5SG3sK5hLR4Aq1Sbmtv8yPGi+yJL+EU/LSVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ac4kfezQV6i+ENth2s7TXdBqSDAW/p+vB0il98s9/M=;
 b=HzxOldowgPd/xNTbQ7fxqaidVDXacZ3HhBkQNY7euxNMGAjhtbbcqp2rZ/d+VyrVlhM9ODctSJ/0g/AViv14vtUVHmgsYtIz9+6iTAhR8XMgOfyxh0g38Wc4kJtiwoKYjyCJjoisyr+hrF3xNohy7pZOiEZYKYUHytqvch+SLzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <baee2f62-786b-4ed3-9ff4-cde3a06c4eb9@citrix.com>
Date: Wed, 28 Jan 2026 12:44:26 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260128120339.47373-1-roger.pau@citrix.com>
 <20260128120339.47373-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260128120339.47373-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0020.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a629ba-d981-43aa-c83e-08de5e6afac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1FqMnkxVDF6WmtndXFPUXMxME9ZUTQ3ekFsZXlYMWxSWjZLTVlLT0p6MFhi?=
 =?utf-8?B?SXNpZGFPYVV6SUF4OEZuVFdVRHFYdVRqSVROVHR0MVlFNFdDanZnS2djQ1Nm?=
 =?utf-8?B?M1pxRE12UndJc1B1dDd5a1MvNDZmNVVGVlZEaXdpRGVrdzYzRkh1eWlUQkFr?=
 =?utf-8?B?NnNNbGVQV1pCTTVlVlh2VXZ4TFFPWHNRYXU4cWIxSnJlMVhpUUlrUitJRWRF?=
 =?utf-8?B?R1BLd0ZUVHNTRjZPQUJ2RTJlN1JDaDA3STdGOEt1VFZXR0d1QTJlNVF1VW9P?=
 =?utf-8?B?UU1vNGRGU3RmTWhDbE9teGp6eTB2SUNvVkVDaUxlb2J5N0ExeFFBdjd5dkJp?=
 =?utf-8?B?L2tFYkRmSjN6WDQyNDdrS2MwMEIzMVh4UzJlVy9LV1E3TFZDbjkvcHYxMXBx?=
 =?utf-8?B?eHhzd3F3WnAwQ0xkZkxKbW1ERys1bGY4TzliT3BTdkZjMVl4K0VwdHU2KzlS?=
 =?utf-8?B?SW11VFlsS1BnQTlkbGluYTVaKzRUYVBmQ2JLR3BHaTljd01KYjVwNloyWjBH?=
 =?utf-8?B?NW9DRnVmRGYxOGdTdVYvTUlac3drTzQ0QjBsM3ZOWWYxblBvM2hSVk1MSWRz?=
 =?utf-8?B?UUJHRUF3MW5HOTFrWm5Zam1uZnNxY2xRQ0tpSkZPaTdrQ1VzcDNvd01JQmly?=
 =?utf-8?B?VjgwS2ZpQ0xPbmtUa0dHU0FIeStHUHJiNExQaWNGOTdNbmthVkhBV3Z0K3po?=
 =?utf-8?B?T1M5a2pGSHBtN1pqcGdpUE9aY1VTOFNhK1IrZUVaQzF2RUJVUEl1WmxqZS84?=
 =?utf-8?B?ZnNkMkNjanRkZU9IQkRWY0k4MU42TVY3M3JjamRmaHBhK3YxUWt2Qi9Qb1M5?=
 =?utf-8?B?K0hQanZtNGNaQy9FK2k5VWh5UUM5UmVpME5SUUEveXdWMmM4SzZhenNNNEo0?=
 =?utf-8?B?K2M1dllaYi9ta2hSMHh3Z3gwelFLRnhEL0IwY3IzT0FyaHBnSFgxUW1US3ZZ?=
 =?utf-8?B?RTdxZER1THVFanNHWCs2Y3VxV2VFM212ekNVU2lyRm9TYlhTS2RtT1oxMUNp?=
 =?utf-8?B?T2VQeExWbXgvbEY5Zy9xbFpGeDF4VTJlcEFJQmtudi9NVkE4NkVSaVREZHAv?=
 =?utf-8?B?TFo3clFPRGkvS1NvMmpvK3kycXlob0xOZW5paWplUHJIREZtRnN0M2duM3J6?=
 =?utf-8?B?K0sxWkJlTyt2R3ZYTWVUZmp1U2RYamhKMUNLQzczRHVtYnR5aUU2TjdJU0Ux?=
 =?utf-8?B?S1NiUkI1MU5SaFJXeGp4L016WFh0anBUK0Joa1Q3TGNiWWh3Qk1rWHRWbzhk?=
 =?utf-8?B?TkdnaWY5dWpVaUNvalRERWRyaWJOV0lsUHBCNWI2RnhWQmxjb1QxM01tcy9y?=
 =?utf-8?B?eVk2TXFnNjNtbnZEUktPaFBBTHlGZWF0amFucEFWdjB2ZG8xeitzZDZ5bFZj?=
 =?utf-8?B?VEI5WjFpQlQ0RUM0K3h6b05uZXNZaTVPeVlQTXc3WkQ5L0JZZUZKVkpsZkVv?=
 =?utf-8?B?SmVmV2d0dngvakZoNGtNclM0ZzArdW9lVmErUUl1cFV5NUdXVlBlZGdIdGdu?=
 =?utf-8?B?bWM3OHFld3lDb0IyVWdjL0dNdnQ2N2lac3dweU10Y0p3THJYVjNpOUV4UkM1?=
 =?utf-8?B?OWFORFNHRU40WFRRZC8ydnByckZLNFIvTTV6MUZNeFZMY01xVmF2eXMwZ2Fk?=
 =?utf-8?B?U0JxM215YzVDTzh6eWNMbUtwenhqOStGK0ZOaGFqeSsyMFBPTW9zbmdBMm1t?=
 =?utf-8?B?aGxMUURqS1loZGJmYmF1Z2NSYllzZjFrTXdnQ0pVS2lLY21JcHByTm9oQm4y?=
 =?utf-8?B?dTZzVVAzdGFaejJ2dU5jYndsWFphL2hhbDRyMmRxZmlqclVhZTF6QzZrY24w?=
 =?utf-8?B?VDRydnQrSGE5NGcvNXowMm9TSnJ0K3JPNXd1RkV2cnd4U3ZERk9UT1Z3Nnlj?=
 =?utf-8?B?cEJLUVhDZTNrMGVzaTlNd0lkRGpPbUFYM08rZjZTdHBWMHNxdU1qQjlyMW5Y?=
 =?utf-8?B?Q04rajl6TE9TNU1HNktTQ1pXY2RNU0haZkgwVEhjMFA1cFJOL0dUMXA4akxF?=
 =?utf-8?B?TjV3VG41d2NLVWFPWG5NUEEzN0ZJMnp1L2tPa3ArZTh1eUtKUGo2RFI5b1Za?=
 =?utf-8?B?bGlQelVSc2haVDZ2MURLTHl5SGdIRkRMZnM2YW5CNnRaS2M2Vm4rbjJ0RHlr?=
 =?utf-8?Q?hqHs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVhGN0huRXhlUEN5a2pUaFhRTmFXTjdNWlFOUTNRbFhIUjEyUFREZ2ZVYTZv?=
 =?utf-8?B?ZkJIOVB3ek1oMFlUODJiV0xzb1cyRVVKdGpvOUxiTHRVS2toT3F2djVENSti?=
 =?utf-8?B?NDhzejJTNWlCaVBpNklLcWNLWmtaWUJ5d0U2b0tEcVJTUFlrMHNRTU1uczh5?=
 =?utf-8?B?SjVxOUFnck9oNHNiQlFOdGFkYm1xK2JWYy9Hdm9jNTRGRkdzZEZoS05iaHdI?=
 =?utf-8?B?b216eDNDeVh3WUhSZTRPNmNKaFlIUC81cWFtc0tjZW4vdEY4L05MRnQwZm1k?=
 =?utf-8?B?eEJtKzRwNlJkOG81QmhyWHVic1QrUldVeVpnYUJINlZOdkc3UGtIYlhZYzZZ?=
 =?utf-8?B?YUtveFhyallYTG13RytQbHBGRFQ4UWZIQ08rellRNmd2eFg3d0ZtQ2Y1OFdo?=
 =?utf-8?B?L3FIY0RiK1VkNElzcGxRQjN5VHNVeTZKSzhaV1V5SnpzYnJTWit5aVF6OVRp?=
 =?utf-8?B?ZnhVY05jQytqUnErSXU5b2M1N0Rlb2JBc3hQazNwdG1pbDBVU3E3NFU1Qk9k?=
 =?utf-8?B?T0xqbVN6NjF4VCtqdnZHWmExUG9vVm5mVkJZWHdpaFM0bW1BRG1UeTVmYXow?=
 =?utf-8?B?NlFJZ2dpL2FIZnZmUlR0MWxJcnp4MGhDQituZFZlSml5ZHhPZ2d1djJEZ21X?=
 =?utf-8?B?ZTl2RzYrZkJLeW1NNVUzL2YyMXVGMzVoOVg0Vy9tNWQzTGNVSlJ1TlB0V3Zo?=
 =?utf-8?B?b29VMnN3UlUvdUlYSzJYYVpLeWZFL2tuQ3JTdEJOK3htb0QrMGhnblQ3WVZL?=
 =?utf-8?B?Sm9tYlY2OWxaYWR4RWlsR2Z5Y0RaUHNLOFdzUTZtWVZUUmplYVFmbDRzQ0tO?=
 =?utf-8?B?NHJPalV0WGNYMmNjZnorYlYwZ3BZSmFIdzZNTnZxT2lnRVpROGorY2xuR1dX?=
 =?utf-8?B?Y245c09rcmZVNlppbWRCdU5BVDFMWk03Wm9QU3djTVFqSDhORnB1WkRnUEFT?=
 =?utf-8?B?RHR0Y1Z5S092QWxyWXV4TEgzSXlJVmJtMlg5NjUwUTFGWWExWXMydCtzdTR5?=
 =?utf-8?B?QzdUNWF6amFiYiswTnVOM2hOUVpobVZhUUpvdWhqN2VwS2JmOVl2Q0NJeVlr?=
 =?utf-8?B?ZVBGRWcveGFVMWlmM0tlYkNTRDRDVHlURkdQVEdSU1lEcFJ3TzJPZU5KdXVH?=
 =?utf-8?B?NjRLUVZ5bjk3dHZLZS9RdS80Wnd6T0FYbXlyRHJtZHlKTDlVWndxQW9iYlFC?=
 =?utf-8?B?a3UyTW1DcW9sbGRUS0VTSG1kRTJMRTNxTmRoS1VDQjVCTnpscXpkdlZ6aGtI?=
 =?utf-8?B?YmRVMEt1V2JvWmh6UUlQT1NFS1pYSGE3LzNDS1VLZWJvRnJ5OXpzbzl6MDM1?=
 =?utf-8?B?bnkwVHFGL1d0QTZDSGZ2cmEzcXRRenJYdng2OUErd2hxOHJaZFdmSzBuK1ZD?=
 =?utf-8?B?K1pobEN0Y3FTV1YyTTR4NTdHcHlESWN6MjRFQ3RqKzZWelZYdWRES0JjeHVo?=
 =?utf-8?B?bGRPTHZ0ZkVEaWpRMjhucElvdjRpaVdTRjhhNng5ZnY4c3kwSnozTXNtZndm?=
 =?utf-8?B?T0p1dE84Y2Jka0ZlVE5PbFNtOHo0Z3I2Qk9ua29GUTNGdjJ2WTR6YVBaeFNH?=
 =?utf-8?B?OGNtOENQdEJnQW5kcVU5YXZQN21jSlRtNW9VcFFsNTIvSG1sL08xRHl3aXJJ?=
 =?utf-8?B?dWViVDFIaWJ0K001dlB4dWVRckg3LzQwRElBKytNalBLdGhHMXJlWnpUZk54?=
 =?utf-8?B?b3pYdWoyTGE5bTFQNFBhTVhSRi9HYVUwMENGQVJXSHNKaGdUdVZsMmNNdmRB?=
 =?utf-8?B?WE40TnlNZDZobFFESkVPK1R3NHNqVDZnSVo2TW9DT2RPbkY0bVlCeTJQRm1B?=
 =?utf-8?B?V0trNjg5by9FUmgreUdLNmZYSHk2S0pESVJUT3dPTDA5aUdqTWNsak96cG5M?=
 =?utf-8?B?L3RGeVZ3NEVEZWoxa3BCSVBCVDU1UTh5M2ZYUVhYNTl6R3hla0tBZlMwcTJQ?=
 =?utf-8?B?dTZwWjhNVUtlSGR3d29YOUJ3bmRyemZlaitDcHdaL2ZKdmJZeUg3T1R5YXFO?=
 =?utf-8?B?STlZNFdFM2Y2VTZ0SWN3eExkRFpBcThyUk85UTZodzlhUHhmbEZ6NXFDY1Fh?=
 =?utf-8?B?blprVGcyeW5SR2RkOUN0Mk5KTGJJS09pakFmNVB1b01pWEhKSk9rMzNoeWU3?=
 =?utf-8?B?VW9lMDQ2MDltaXJVa0I1OXBETU5rM3JjeU4yREhYS3VDU2JiaENyQ3VWelMy?=
 =?utf-8?B?cCtrWmtJUXdpNHpNRFMwNnJ6LzZYS2ppYytqNXhDamxxSFZUbXZSK2ZwWDV0?=
 =?utf-8?B?dkFxQ3pmWDZMOEtycTNKS2tNeTd1RTdYYktoSTM2VGlQaEh1cysxckJibWdD?=
 =?utf-8?B?RUlNUE9VeHZmenNWTmE3Yk8vd2s5c3VpZTU4NDY2QlpBMW9LM2laUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a629ba-d981-43aa-c83e-08de5e6afac6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:44:30.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYV/68a8A7y+RYQLV1mq6dmwPGXz3KB6ndYvTSVkVBbeTMu16LKcRLvJ82F026NMpMCnJg6GLE36YAiVYuqSN28ERZswMi6PbCeMqebH3iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EF8CFA1765
X-Rspamd-Action: no action

On 28/01/2026 12:03 pm, Roger Pau Monne wrote:
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 376351b528c9..123202f2c025 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -710,6 +710,23 @@ static int domain_teardown(struct domain *d)
>      return 0;
>  }
>  
> +/*
> + * Called multiple times during domain destruction, to attempt to early free
> + * any stashed pages to be scrubbed.  The call from _domain_destroy() is done
> + * when the toolstack can no longer stash any pages.
> + */
> +static void domain_free_pending_scrub(struct domain *d)
> +{
> +    rspin_lock(&d->page_alloc_lock);
> +    if ( d->pending_scrub )
> +    {
> +        FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
> +        d->pending_scrub_order = 0;
> +        d->pending_scrub_index = 0;
> +    }
> +    rspin_unlock(&d->page_alloc_lock);
> +}
> +
>  /*
>   * Destroy a domain once all references to it have been dropped.  Used either
>   * from the RCU path, or from the domain_create() error path before the domain
> @@ -722,6 +739,8 @@ static void _domain_destroy(struct domain *d)
>  
>      XVFREE(d->console);
>  
> +    domain_free_pending_scrub(d);
> +
>      argo_destroy(d);
>  
>      rangeset_domain_destroy(d);
> @@ -1286,6 +1305,8 @@ int domain_kill(struct domain *d)
>          rspin_barrier(&d->domain_lock);
>          argo_destroy(d);
>          vnuma_destroy(d->vnuma);
> +        domain_free_pending_scrub(d);
> +        rspin_unlock(&d->page_alloc_lock);

This is a double unlock, isn't it?


The freeing wants to be in domain_kill() (ish), or _domain_destroy() but
not both.

In this case we can't have anything using pending scrubbing until the
domain is the domlist (i.e. can be the target of other hypercalls), so
this wants to be in domain_relinquish_resources()  (rather than
domain_kill() which we're trying to empty).

In principle we could assert that it's already NULL in _domain_destroy()
which might help catch an error if it gets set early but the domain
destroyed before getting into the domlist, but that seems like a rather
slim case.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292AB48E0D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 14:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115227.1461934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvbIv-0007m8-QE; Mon, 08 Sep 2025 12:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115227.1461934; Mon, 08 Sep 2025 12:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvbIv-0007jg-NJ; Mon, 08 Sep 2025 12:49:05 +0000
Received: by outflank-mailman (input) for mailman id 1115227;
 Mon, 08 Sep 2025 12:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bERQ=3T=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uvbIu-0007ja-B0
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 12:49:04 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20627.outbound.protection.outlook.com
 [2a01:111:f403:2407::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31cec0c1-8cb2-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 14:49:02 +0200 (CEST)
Received: from BY3PR10CA0027.namprd10.prod.outlook.com (2603:10b6:a03:255::32)
 by MN0PR12MB5737.namprd12.prod.outlook.com (2603:10b6:208:370::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 8 Sep
 2025 12:48:58 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::b5) by BY3PR10CA0027.outlook.office365.com
 (2603:10b6:a03:255::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 12:48:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 12:48:57 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 05:48:56 -0700
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
X-Inumbo-ID: 31cec0c1-8cb2-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPWn8qIgSkTf1qQnPkxNlH+nSpl9bg445X8+3OS6QM4ynDLv1VRU6D7JdFw2bLibjPo55bgvSrzq1cWBcMmatI11BNiJbeHZLGb3y2cquaSSwVRPy5K7lk9wHktgoBzWb0QQKHxoaqB2cgRXstm0Ehj1lsweCGCj4MkoM50Oz4IF7DqQSml//cfmDfI2oyBGeS/v9WiQ3O0/2pM6e+pv+EVZ6BjQFRWQny8ne2YC3z5/AcsTBGAhvjJUuQbZU1m4ff+DzhPNtHV4gplw00NAKDWgTHb+NxSavk8Bovz8LtZlzr67PmezgxrepWnPW0L9TY6vhXkj3CR5a8frMSQ42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGJ3macmuZXuTtMYG3B2beZsSs4EKXW6dNRScVRlVrs=;
 b=Q5n0slTRXBTKCJ/u1ID0gJX3bZ3XVUwPaG6c/TwK6ydpjD3IXltKO0wx+rOspU+CcHK+feNhq2MOa6Eu+/i/KOKTswv/FKJapQCv6c3zI0+eDX6nsqnYLatIECqTYphSmKR/2ugQqhxlsiO5CvqZ3vHXErw66a2287JMh+37w1cUw3St77B4ThfMzTe9zZ8IRY93h+TBWPiwsB+rlHRDz2vx/p4nFpuWged1gpO4D+WbI/v3FLMG+KL++gGaHJ33U5whA0xMTSn/LHuVZBppiYvXDJ/JjJ9u31u4qmx34IYop2x+3lo+isLtY6HrljIWiHX+3fMnKk0EuZ0qN3B/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGJ3macmuZXuTtMYG3B2beZsSs4EKXW6dNRScVRlVrs=;
 b=Ycco47IDBmQYFj4UoAZL4NRcs3Ca5nZX0L+f2gLSWFahasT3W3BAzm0L0BRey5vyXT5wO1Hy+0rIq3PI1NV1k83xMxL0+Ibcct4SEga08Ekm+dNgV1wPh+aXzMj27FDL4zuiE2H3yskM0iVxyt2qh7WYffmg6m+Ckc7de3PD0XQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 8 Sep 2025 14:48:55 +0200
Message-ID: <DCNFIZNXYSZS.2SXOS2FXVOS4Z@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: New Defects reported by Coverity Scan for XenProject
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <68bd98b92c2b2_2afba52d9ed55e79908873e@prd-scan-dashboard-0.mail> <77361e51-dcb8-40e2-a526-9ff90ba942a2@suse.com> <DCNDAW983CUC.C7PT9CRVXUWU@amd.com> <9e474109-7aa1-42b9-9fa6-31c4ef0fb856@suse.com>
In-Reply-To: <9e474109-7aa1-42b9-9fa6-31c4ef0fb856@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|MN0PR12MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ee33da-6898-4052-dcb6-08ddeed613ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3J5V2t2cUNIeThreStDOEdua25OM29ZdThRTWZFVVRFTnZHVDZKS25FWlJk?=
 =?utf-8?B?OU9MMnBWNEpkZnB0TjJHRkdnWU8vZUduLy9oK3dqamY5bWptS1Y3ejdIYTVu?=
 =?utf-8?B?enJabU5BQ0JjQXU5NWl3SUVkVUI1S2lTS0dEL0lMK29aZDZMVnZ2dkZ0dklz?=
 =?utf-8?B?ekVWMTZxL1dyRENCbzk3N1RtdWx1SUNjcnRtZDFxRWhsTFNBUHlqMTJOcXVV?=
 =?utf-8?B?TndHdmdoQWsvWnd3UlN4aC9xQUtQZVRrUWxpRzl4WTZtUUJ0ZE5pTU9OWDFF?=
 =?utf-8?B?REMyWXJYczFQZ0w5UmxJZ2luZDhaRmswd2tPMXpjRjhLbzEyUFpFbW91Wk1I?=
 =?utf-8?B?V0xMVWluSTEzWFBOSFJaSTJ2cXRTTTBPZE5lYUxDS28zbFNDQmNETzBRbVVU?=
 =?utf-8?B?aHJES0FCZHNrM21KMkloZjdHK1JiMHk0bVo5NlA2a2lwTWl4cEFDUnRLY2h6?=
 =?utf-8?B?anowSTUrT3RibGdlR1liK3JHV1JyVmpMZS9PRDRnZ2IrY2JKc05EZWZ1ZXJG?=
 =?utf-8?B?RGRRbEZDY0JvdU5DbEVneFF5NGZOeXlaamdJNDJlMThJVnQzbGJ4c0daclpq?=
 =?utf-8?B?bGdIYS80UytkR1FsSWNEc0kzUXFuQURGZGN3S2ZTM1ZySjJ1dC9XK3MzUDBQ?=
 =?utf-8?B?SHBZK3BYa2MxVmFFWTJqMjJPdUtqOUVhdWlRalorNnFjeVh3SnJwTE8va3hN?=
 =?utf-8?B?dlRzT1ZMQmlDaUJTWS8wdWhWQ3M2RzhiakQzZnBEOUhlMjhROUFSUVNPemRs?=
 =?utf-8?B?SjVaaXpQMjN3elVnc2RuVVFVRHJVaDh5SXhCMXhUUUhydlQvcVZJS0FjRW1a?=
 =?utf-8?B?SklhSFpwRUVQMzZxTkFHOTcxaGN1NU1lMEs0Y2hKKy9NOUdJRjdOdG5zRUQ5?=
 =?utf-8?B?a09KK1ZCdUxvWXp0L1JvQlZLOVR3aWtaV2t5eEdFUkJGckZwVlhRL3NZOER5?=
 =?utf-8?B?T0lGdU5tWWNJU1pBZUNNZEttRHZNM2lQOXA1L1QzQ1FxZDZKTVZKenNqSVJt?=
 =?utf-8?B?b0VMVm1kbkVEQzZtQXhxOUN4M2daVDZxU1hTSkJWbFN0SzZyK3QybHR1SG5O?=
 =?utf-8?B?MXV5UHd1QlV5TTBjNDVXb1BPRVdGRVV3TnZ4c3RkVnJsVXBHUTI3djI0UHFL?=
 =?utf-8?B?OWR1elBmcVJCengxdFZaQS9CNjM4ODhoL1p0bUNBUEhMSEo5dXlpMHpONlJG?=
 =?utf-8?B?Z2FHb1pMMGhMNCtSeS9YMGprbFBVZHVZdU5FMEVIdXg0cUJXZitOSVo2T3hr?=
 =?utf-8?B?TmZNMmIybm5maHAxUVNMb21Ham5kWjZ0QjlMKzNxaXVNMmVjak9CVjNtR1Fr?=
 =?utf-8?B?NFFQekU3bURpUS9QRmVEcDFVdmpKS3A5MGlPc2dYeTl2YjRBZWtFenlpYk9V?=
 =?utf-8?B?UTdWNjg3YmRzc1JnM0FnVGYrT3kxYy9kUW9TVSs3bzh3c0ZoZjJwNStuS3dG?=
 =?utf-8?B?TUZ2TDJXaC91dHZxMUxkMHVOc0lQYWwyUUpuNEpnUUVlOVpGaFRNbWRBRTJp?=
 =?utf-8?B?Zmp3Sy95bzJHSkNZbVFPWjJjNDdtaG5udW1Bd0NPWXlFUTNNMytscHIxcmo1?=
 =?utf-8?B?U3dsM1NETVZ2dFRzOGhUbXJMSGdVeFVjdEdqSEFoUm5DNTJLbVR4eW95WGgw?=
 =?utf-8?B?VXFOcHJLeEwxVDNVL0dJMGFpKzRpRlFtbGszd0h6ZFNhK241Ky9jYXk3TG9U?=
 =?utf-8?B?SHBrdmQ4ZjluUWl0bWVROXdZZ0loVU9peVI5SlJJMUNlZmVQdFJ5aWhQTEps?=
 =?utf-8?B?YXdFWndid1NMWkV1ZTNtaWFOVDBXUnlYUlVIMG85TzlxS01PMUZkckFkaWEv?=
 =?utf-8?B?TkRKYzgwanFiMW5YdUdhTm00b2pCR0c4R0tEbUM5bDNDVlZ3bjBmRDBHQmg5?=
 =?utf-8?B?WGJuc3I1ZHdCSW1idjQ4VlJKVFNHVk0wN0FGTmJkNmUwcEJVSXJEK0FnT2pF?=
 =?utf-8?B?dGtaLzFSVE50RkRNbHk0VjNvc1BvbXUxbVE1Z1I3RkFwY1VFandjUDFHSUg1?=
 =?utf-8?B?YkIvV2N0cDdvWTRiaGNiSXRuN2F0UThkbUE1MDBDWUJFTlJ1cW5qUUExa090?=
 =?utf-8?Q?DEFNvu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:48:57.9912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ee33da-6898-4052-dcb6-08ddeed613ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5737

On Mon Sep 8, 2025 at 1:25 PM CEST, Jan Beulich wrote:
> On 08.09.2025 13:04, Alejandro Vallejo wrote:
>> On Mon Sep 8, 2025 at 12:19 PM CEST, Jan Beulich wrote:
>>> On 07.09.2025 16:37, scan-admin@coverity.com wrote:
>>>> ** CID 1665362:       Integer handling issues  (INTEGER_OVERFLOW)
>>>> /xen/lib/find-next-bit.c: 104           in find_next_zero_bit()
>>>>
>>>>
>>>> ______________________________________________________________________=
_______________________
>>>> *** CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW)
>>>> /xen/lib/find-next-bit.c: 104             in find_next_zero_bit()
>>>> 98     	}
>>>> 99     	if (!size)
>>>> 100     		return result;
>>>> 101     	tmp =3D *p;
>>>> 102    =20
>>>> 103     found_first:
>>>>>>>     CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW=
)
>>>>>>>     Expression "0xffffffffffffffffUL << size", where "size" is know=
n to be equal to 63, overflows the type of "0xffffffffffffffffUL << size", =
which is type "unsigned long".
>>>> 104     	tmp |=3D ~0UL << size;
>>>> 105     	if (tmp =3D=3D ~0UL)	/* Are any bits zero? */
>>>> 106     		return result + size;	/* Nope. */
>>>> 107     found_middle:
>>>> 108     	return result + ffz(tmp);
>>>> 109     }
>>>
>>> I cannot make sense of their claim. 0xffffffffffffffffUL << 63 is simpl=
y
>>> 0x8000000000000000UL, isn't it? Where's the overflow there? There also
>>> cannot be talk of a 32-bit build, or else ~0UL would have been transfor=
med
>>> to 0xffffffffUL.
>>=20
>> The offending line LGTM too.
>>=20
>> The only credible explanation I can think of is Coverity flagging discar=
ded 1s
>> on left shifts as loss of precision.
>>=20
>> If so, "~((1 << size) - 1)", or "(~0UL >> size) << size" should make it =
happy,
>> but surely that error would flare up with all uses of GENMASK() too?
>
> And with any other non-zero values of "size" here.
>
> Jan

Is this the only issue flagged? Or are there any others of the same kind? I=
t
might me easier to spot a pattern with a larger dataset.

Cheers,
Alejandro


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHZQJM2kiWlU/wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:11:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D938410D621
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225022.1531472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNIl-00010G-5t; Mon, 09 Feb 2026 09:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225022.1531472; Mon, 09 Feb 2026 09:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNIl-0000wx-2I; Mon, 09 Feb 2026 09:11:27 +0000
Received: by outflank-mailman (input) for mailman id 1225022;
 Mon, 09 Feb 2026 09:11:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpNIj-0000Uf-C6
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:11:25 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b979bcb-0597-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 10:11:20 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6221.namprd03.prod.outlook.com (2603:10b6:a03:3ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 09:11:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 09:11:17 +0000
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
X-Inumbo-ID: 4b979bcb-0597-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjQ9BrcHdZhB/eQ0Wpupit3vtI5tyTCBY4dst6T+ZhzkfGzm3hvEJ60pz6Qt0uFW+UNaGAsvDTSMrPGe3Zkpyo4hjjZRuvbaJUMhYOhTl+4BPVgDiLdUc/y/zhRRtpwQIKYFDIqtiia4sZ2iPOjqj2f6cT+26KOOJPLohV2NC1iI3DPEOK+14Hmhw2tpkKGoYi+7dn6ErDghpQYOYOcrMtzARjG3yWLBbBctFqJ1jo8rMa4eT/HWlnB2dUVVufmo64HkCLVE4pt7M4b/2IYoru4UBb3xl+ASXgBRwKMYr/bSfWABeJ8UaQHcUUmKv6/7+DPukuQuPSwLf7dGc0wSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/fuDHjQNjG+uV2L8Ai2NYYypU7K2EFRLzlLTUbGX1g=;
 b=dZG2Yejwq7U+pu9dUSdeWMye6mCXQFXoh675a/i/1ZZqdpWmpimty4bIqCoyzRYgY7l+Xh6+LUAswhxVKaX3WNuDv14VWjeSVxjfKvQJRcm/w7IjWjnV558Wvb9vZYBVnmyVE87IMIJ2vOWTmpF2Eb1HfWHkOx5MEgHj3rjaC3w5dIUHnfUBncwhwL7SU+ZZKoe82Vtt8Mdkoja31STJmC33zLviJBPw2G4A5kqrU9m25efUoLe1JvtekVKcWkJnrcr7VjzgSmT8bGIoHbA/0lq9FoGa1n93SPaH4IsMH+Aez3xwsgCRIns9cfdVBr3KOQpxZ4cL128XfJvnFAt+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/fuDHjQNjG+uV2L8Ai2NYYypU7K2EFRLzlLTUbGX1g=;
 b=Og3u65KElM3hkLON145NaZE5y5U41UOLDPjy20ilRpb7wknkeO3/F54ZfB5OepB3Vho+QcOyyKf99wmc+uE7Fwprg1YQn5jWg4yr0VfU0X8w2XSSY6E2wLBCxVdcHzxKI0Cc5SP30jqYxaWLjqO2AvIbPevZcIh0o+7SpdqNBwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 10:11:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
Message-ID: <aYmksdxh5PM7IHDN@Mac.lan>
References: <ff14a313c6ec9b487263e8f823c96533bb70fe1d.1770394705.git.bertrand.marquis@arm.com>
 <aYYkAvGQygf2eNI7@Mac.lan>
 <28DF7F1E-BAA3-49AC-8A53-75100BAE74B5@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28DF7F1E-BAA3-49AC-8A53-75100BAE74B5@arm.com>
X-ClientProxiedBy: MA3P292CA0031.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 746f5ef7-ea62-46f3-8700-08de67bb2e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2U3WDJTVXdRU1puMmFScFYxZFRSTXo5ODJyeU40K0RBeHpwSVJ6S3NNQ0VB?=
 =?utf-8?B?aVplZnh4Y1lNOUdiU2dUZzBja1c2d2JvaWM4NFg3N2N2NEZ4MjlrdHg5NWkw?=
 =?utf-8?B?VTFHeWFlVWJweWdjYy9wR1FlTlRJeGFyRXJXYWZqUFZDL3ZUaEY2VDlKT2VG?=
 =?utf-8?B?ZDN5NEFRZnQ1c01QSTRBcVpWaEVPVk1oSU1MaVZCVStLMWlVaEt1Wkxkb2lO?=
 =?utf-8?B?Y1pBSUJGZEhqeTlzVmNIMlZPekZJeDR2Ym5aKzlreFI1U1doSm9mWXJ5TG0y?=
 =?utf-8?B?ODhOSS9OdWpjUWc3eDh1eXpvYjJsQkhlOFNBQU9UaUhBQlBLUXVWQ3NSdDdh?=
 =?utf-8?B?NEJjWE1qOFdXc2ZyaGQ2eDgzNk5MT0FwTkZtRXI0Z3FMd0Y2RE45NEdjME84?=
 =?utf-8?B?UGZuV2hTenRqY0RqeFcwUGc1aGJpZ0t4eUVneHRaSGdTYkt6TERzMDEzVFpn?=
 =?utf-8?B?VGpGbTNvc2pDbG9ZUklXMHJHdWx5S24vN2xmWDV3Ym9CbG8wSVZCMjlYZGxS?=
 =?utf-8?B?YWE0MDZMUXdHSlVDMW5ySVhPOHhXR2JpWjNUeVBJZnhYWUozL3VzN2c5OVdV?=
 =?utf-8?B?N1AxSDJZVmFENVF2NDM3NDIwZ21iNm9HTDFFTm5zS3BQa3lITTJPVUVXNnow?=
 =?utf-8?B?RERLVVc2TXNwVFp4RDBpQjZKL1N5TU1neG9XMnlZNWdRckdVUkk3RDQ2Qno3?=
 =?utf-8?B?eFZZL0x6NnBnNEpnRkNTYjRWZVozbE4vam5GMTRreEhPcll5bnBtLzZiMUZJ?=
 =?utf-8?B?UVZtVjcwUEExN1kwQWtVenJmVExpaUdjQ3pzS3RGMnd0MFlFd0FrTldUc0c1?=
 =?utf-8?B?NE1manMzMnBVcFRlQk50NWFYZFdZbmx1YlRnQ3JuakE4WGozbUh4QjZSOFA5?=
 =?utf-8?B?WXVHYk5hUG83ZmxNUFFpYXlESnJDUjQ4NDI0ckR4OXM1MGt3TmNBYmdrTmd3?=
 =?utf-8?B?L29qQmIrUzFMNWdhM1RzTDlsQ0lxdzJDclBMOUtYamY0QXB3cEpEZDg2VVZZ?=
 =?utf-8?B?OTdPUDhlNFBSdjlseHd0WTJmY200bXlTY0daMnRsTmpWUGFuMzRIYk1ESTM2?=
 =?utf-8?B?Z3NLQXYzWkU3VDF0UVNTTWJOL2NmTVZoaGVUcEU0N3RDUGNWblgxVkg1YUE2?=
 =?utf-8?B?bDRBb28ySTFqMm82bkk0anFuVEFtZUxFSzMvRURSUVN0MHlUdkZ6c3dFemdE?=
 =?utf-8?B?SkJ0bFQrY2FoR3dObTZnZ1NQSHZibU81RUFsSzJCOGRFSkQ1MGZUQkpQQm1a?=
 =?utf-8?B?VklIbHVnS0VkZHcyYzhVaFFrMmJqZmZjTlZ4N1ZlZkp3NnNDQ1lMT2hnYkZq?=
 =?utf-8?B?QWJnSysyZWZsY2pkRkNEVDNwQlp4ZVZTNzNuWVQ5WTltOG5pd0JnRVBORU92?=
 =?utf-8?B?SThhN2dSQ2djUU0yNmxGYWYrVHRWZTJTMVBxOTVmT2k1VGxjZC83Q3Nzd2E4?=
 =?utf-8?B?TUlWQit6dDJzcHlNcHdxdkRadVBnUzNnVVNaVUc4MFljTS9YcHZNM056Ri92?=
 =?utf-8?B?QWI5N2xWZnRpSUMyTzhLbUJ3QjVZdGN5Nk12cW9ORGkyR3VGa0Q5d1BkNTBa?=
 =?utf-8?B?YTY5UWhzTjBJOVZXSEhENXJHTjdHeG93Wk8xYjBKSzhnM05mV1BXNE5mRGc1?=
 =?utf-8?B?SzFzbDF5YzZ0ZVZTekJuQ2NKQ0hsdUpaT3hJdEFFZHFtQ0RDaDVEUFhFODk4?=
 =?utf-8?B?dG1wcHQ5a2pvWnpRajBjTklaVmdXMjV4dUJ2ZVBUOGNHRERRY2RERDA5VTF4?=
 =?utf-8?B?TVhnOXhaK1lNWFZubkhBaDhQUVJLWUpkSTd6SFlscmZiOE5HaWJmTEdDbmhY?=
 =?utf-8?B?dElRNGtHRlRVVnhnREVpOGZsellRVFY3aDI5WVcreDFjeXlPdGgyY2d0dHgy?=
 =?utf-8?B?YWJVR1F2OHppT0E5eDlzR3AvczZEajhPbjJoZE9oVHg3NnJ4eDNOZW12Ujdj?=
 =?utf-8?B?alplS1RVSTN4UXFOcGlXUVZoeVE1UFdiQXRRMTBWQ2tjLzhVdXozMFV1cU9o?=
 =?utf-8?B?cWpFZzZXdEF5NDVaODdmdzJrVTRjS2ZDODYvaUJOUXpjakhtaFBmcmg1OFkz?=
 =?utf-8?B?SW1wYytHR1VWV3FpejNKcmZtK3VET0FiTXJSUldQS214bGx3NlVHMnh6RTZ5?=
 =?utf-8?Q?cI08=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WS9EbVkvM0FrSHBUcTRwQ2pqMHFZaFM0YlRiNDNlWWQ0S0NDMDk1UFI0MHov?=
 =?utf-8?B?WlVLMGxtRnk1bTVEZ3pJWGpoRjlEU1NleE5xOHVSU3dLQTZkbjVqQjZ6dzN0?=
 =?utf-8?B?Y1FRcEpSTnpjcDZqTVVhLzFXWFVBUzNXZUJndWQ1ek9zM29DWDU3aHpLbTFl?=
 =?utf-8?B?aHdSUTY1Nm83eHZmMFk1T0ZYbm1rSWpwZnZJcU40S1BKZlBhSityU0hBYzRq?=
 =?utf-8?B?dnlvZjZWeDNXSEhjNUwzWEJ4TkNXdVdOZU84WTZRN3Z2VSsybXNSWkk1V0dl?=
 =?utf-8?B?dGwyam5VUGpCQklDM3phamE5bmtaK01BU3lFQmp6b25HTldHMHMrL1ZUR2gr?=
 =?utf-8?B?RVFBRW1nVkE2dG5VQTh1dWxwVUIvUHZQKzBzR0I5UTF1VnVGUjArQ05IekNn?=
 =?utf-8?B?a1dTTnJHNHlTRDQzbDQxRE0yMW1Ud2xvcHZVZ1RvV2syR1ZIR3lPV2pDL0I3?=
 =?utf-8?B?eU5SOU5uSTJFOWg3MDhoV1FWazNlWlcxZDVxNGtLV1I3Z1UvRmtlQnpIZEVU?=
 =?utf-8?B?UnpmN2ZRU0dKRExPSmw5RktjRnhHN0VpaW9GcExhUUM0QjVkb296M3lwcnh4?=
 =?utf-8?B?cENZOW02clZKTkFIWmJ6VHBKS2tuNGxPalBrWWVZNGg0bVAyQVR6VnFrNXZv?=
 =?utf-8?B?c1FDY3BKY3lkbXdWeUphTE1ja1NkTXNRVEVQSWdPWDdUOWNWQktYdEovN2Rw?=
 =?utf-8?B?bVhUSERZSFd2MitKRUcveGJKaG9YVTJmRDNOZy9uaUFRWGJPZ01KRXFqd1JU?=
 =?utf-8?B?Skx0bVc4TUNoSDFKOVpmVk5NY3VMNnNjZGorMElMVTlJdEM1bUpHbzNxYTdw?=
 =?utf-8?B?aGhtVVFCamc2cTVkbHVzaHhiRW5weFNHdW9oZ0ZyODMxWVhpZnpZaCtRblVE?=
 =?utf-8?B?VisrRVBUT0J4WGROTG40RENQRUJvVVI0R3Vrb0JZQVlVVTJRMGd3SDkxTGFL?=
 =?utf-8?B?emQ0S0czeUkrLyttZmw2U2hQeHNjc3gvVW1lYllnWVJOaG4weWRNOUlacjNz?=
 =?utf-8?B?TzJ4OHFETjE4R0IzdHdFT0I5WWJGaUxDWVZtSkdSNEg1eWZUd2ZKQituTTR0?=
 =?utf-8?B?ZGxudzdSZ3FFVTRjOWRWMFZrZ3lOYjFmeXduTThJQUZzZDRUWmZ3cGlCWmFk?=
 =?utf-8?B?S0RLdE9tQmJDekJlemR1ZFJuK1N2dzJqVllqN0JJdk5yS1o0UnRMamo3L05x?=
 =?utf-8?B?VWZlcGhMTiswZ0oybzVRY1U4NldsMS9DMzV4M0g1RmdzV0tiRStWZCtkYlBI?=
 =?utf-8?B?TTE3RkJmWVc2NitLbEp6QldRREp5T1ZUUEJCMzUxMmsydmNza1NHNDdiWDFs?=
 =?utf-8?B?Q0ZyK3JiblMySE1jY3dOYUJwVU9naXk0eGZTR3B6OENnbEFqRjZGYlpaZ0hK?=
 =?utf-8?B?Qy9XNW14Z2hZZlNiQWpha0ZIK3BlWkNiQmc5RnVoTlFZaDFTclhRRWpnanYr?=
 =?utf-8?B?REtmMnRaVW9CZFdhWVNDYTVzVEdVVVJMTit3ejd0UjBmVklROTdjN3YvMW9o?=
 =?utf-8?B?WDliVUhjUTUxVHg2NzZXa1VxS0xPQmx2SWU4ZmNEMzhVOHl3aXUrZTg2WHQ5?=
 =?utf-8?B?ZkRYU0tGVUE5VDdSYUl2UTIzVmVZUWdDbmNocGVRRjh1ZFVkZTZXbDQvVWh5?=
 =?utf-8?B?TEpxRE05RnU2RXhrR3VRdlhJTEMxZGx3d09QTW9GU3BmMVE3U0lYZHFGb1dM?=
 =?utf-8?B?bThxSjd6SElXRzBockhvREhPQ0N3blhrR0NmRW1HMnRocUtSSXhTMHNZSVJx?=
 =?utf-8?B?U1p5Lzd6RmIraGJ5MFBVVi9qTnNTdDRISjJ4YkFwenlaMVR6dUZjeERMTEky?=
 =?utf-8?B?Sm00WHFJQmRYMFFoZnNzQmJ3SExteXNrT1F2a1I5eHprVGlheGJxTE5pdm9q?=
 =?utf-8?B?Z1dRbzFzU3pHTTJJN1lRWW45cTM1Z0hTM01BcFJoR1JmSDJtN1JmOUZLMkNy?=
 =?utf-8?B?bWg2TVlhZEl6Q2JaVGZ1ZGpibkUwS0ZHSlQ5UDBXL2FYL1phd3JPSEErczBP?=
 =?utf-8?B?TEJnYmUwSTlzTHI3R3QxZGJEa1hnSTgxcjVNQ2VWWE1EU0NLSWFDaUg4cmNR?=
 =?utf-8?B?aVQ4aGQxVFFBNENqNHhyekVoSUNaTmhWdGxicFh2bjFwMlJBWS95aEhkSDBG?=
 =?utf-8?B?a0dZRUpRU29vTDdDUldJVTJzLzd6NERwL2VPZW1SOW4rOFJTcGtyTGpEZTBk?=
 =?utf-8?B?R3lSUXg2UDVyVzZ0cyt5K3o4TmhlNDZHWHpuOFRpWE1aK0pzWDlBZFkvVkQv?=
 =?utf-8?B?SFdnckhRQXU0ckdwN0dYMHl1SjNkYzRkU25iMGNxK05ZRXEyNjA4WTlpdmxl?=
 =?utf-8?B?RC9GMm91djVVQngxcWJ4TDJIREFyOTZ2L2ttVVVGcTYxTVdsTFVBZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746f5ef7-ea62-46f3-8700-08de67bb2e4f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:11:16.8946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8rAqCFukrdNDfbH60FPCV0OUA4OmnX/vTbZci63kgABX+aAScU8LJWfUx78tt3XQA8dBmXx/fXZp2WC20sQXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6221
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D938410D621
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 07:30:30AM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 6 Feb 2026, at 18:25, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Fri, Feb 06, 2026 at 05:21:44PM +0100, Bertrand Marquis wrote:
> >> Xen does not provide a Darwin build configuration for selecting
> >> GNU tool definitions. On macOS, the tools we use are either GNU
> >> compatible or we only rely on features supported by Mac OS, so
> >> using the GNU tool definitions is appropriate.
> >> 
> >> Add config/Darwin.mk to include StdGNU.mk and force
> >> XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
> >> the cross-compile path as we depend on the Linux ABI so compiling
> >> on Mac OS is always a cross compilation case.
> >> 
> >> An example of how to build the hypervisor for arm64 on Mac OS
> >> (tools cannot be build for now) using a toolchain from brew:
> >> - brew install aarch64-elf-gcc aarch64-elf-binutils
> >> - cd xen
> >> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang
> > 
> > Instead of `cd xen` I would use `make xen ...`.
> 
> Ack the 'cd xen' line is useless and should be removed.
> 
> > 
> >> 
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > One comment below.
> > 
> >> ---
> >> Changes since v3:
> >> - set XEN_COMPILE_ARCH to unknown instead of Darwin
> >> - list binutils as a dependency to install in brew in commit message
> >> 
> >> Changes since v2:
> >> - Subject was "xen: Add macOS hypervisor build configuration"
> >> - Update Darwin.mk comments to more accurate versions (Jan)
> >> - Remove the build-on-macos help as we have no dependency on anything
> >>  coming from brew anymore and the toolchain can be retrieved by lots of
> >>  other solutions than brew on mac os. Switch to a simple doc in the
> >>  commit message instead
> >> ---
> >> config/Darwin.mk | 7 +++++++
> >> 1 file changed, 7 insertions(+)
> >> create mode 100644 config/Darwin.mk
> >> 
> >> diff --git a/config/Darwin.mk b/config/Darwin.mk
> >> new file mode 100644
> >> index 000000000000..176b27eac676
> >> --- /dev/null
> >> +++ b/config/Darwin.mk
> >> @@ -0,0 +1,7 @@
> >> +# Use GNU tool definitions as the tools we are using are either GNU compatible
> >> +# or we only use features which are supported on Mac OS.
> >> +include $(XEN_ROOT)/config/StdGNU.mk
> >> +
> >> +# Xen uses Linux'es ABI so we are cross compiling on Mac OS.
> > 
> > Hm, is this actually fully true?  What's the Linux ABI exactly here?
> > 
> > FreeBSD builds Xen natively, and it's not using the Linux ABI.
> > FreeBSD uses no specific -target to the compiler invocations, and the
> > linker emulation is set to elf_x86_64_fbsd.
> > 
> > I think the point here is that the toolchain must support building ELF
> > objects / images, because that's the binary format supported by Xen.
> > Whether it's Linux ELF or FreeBSD ELF doesn't make a difference for
> > standalone environments like the Xen kernel.
> 
> This file is also use while compiling the tools and for those you definitely
> to cross compile as they depend on Linux ABI.

I'm not an expert on this at all, but IMO the tools don't depend on
the Linux ABI at all.  Anyone can add the minimal OS-specific bindings
required for the tools to work on environments different than Linux.
We currently have {Net,Free}BSD and Linux.  In the past we also had
Solaris, but that has bit rotten.

> Maybe that works on BSD
> but i doubt this would be the case on mac os.

I doubt we would ever have any need to build an OSX native toolchain,
as it's unlikely (?) that we will ever get Xen support in the Darwin
kernel.

> Maybe we could simplify the sentence to not say anything we are unsure:
> 
> # Cross compile on Mac OS
> 
> Tell me if that works for you and i can submit a v5 or this might be possible to
> fix on commit.

I'm fine with it, I would like to hear Jan's opinion.

Thanks, Roger.


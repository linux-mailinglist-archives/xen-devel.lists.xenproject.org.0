Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAzAM8jkjWms8QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:33:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518512E43B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229080.1535093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXky-0007OV-Oi; Thu, 12 Feb 2026 14:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229080.1535093; Thu, 12 Feb 2026 14:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXky-0007MA-LW; Thu, 12 Feb 2026 14:33:24 +0000
Received: by outflank-mailman (input) for mailman id 1229080;
 Thu, 12 Feb 2026 14:33:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHDP=AQ=intel.com=rodrigo.vivi@srs-se1.protection.inumbo.net>)
 id 1vqXkx-0007M4-43
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:33:23 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3cc76ba-081f-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 15:33:16 +0100 (CET)
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 06:33:14 -0800
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 06:33:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 06:33:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 06:33:13 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 06:33:12 -0800
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB6653.namprd11.prod.outlook.com (2603:10b6:806:26f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 14:33:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:33:10 +0000
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
X-Inumbo-ID: c3cc76ba-081f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770906797; x=1802442797;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UCar5YiqRe9mtbR2usQPHf7wKSZfmQKyOa9UKWi0+7M=;
  b=HoCOIZrvMtY7t6wPYh5KeMEkQcWNsCiHVV3RI31PepfqVI4cw0p0bxCB
   Ub1jMT7f5VZ2DMhwSXGI+bWOc5x9aeJhj3JH2M72k371e2Q7OY3u6CEnP
   x9gA9/rGNTzOsBBm3AvGu1iUk3o27zdjQihTatqKw9LYPhb5DqI3yUjFj
   E2cqyT24zEcqbyMFfah+qjEPykWS+5k6kmwA0MbqZ620QYoTQSp5o8B75
   lCWGrsbIcy8SJSc2zV09buzVZEcqRBCJoihKJh6ovq8+VWBnYb2dwkF9b
   93FZXUeL6GwwFznG4m4iSt7dUxiw/s061dImQljUWw0qZin6caLlkIYAC
   w==;
X-CSE-ConnectionGUID: q/y2dkOGS6Gf7bC8Gmp0hQ==
X-CSE-MsgGUID: Ax4X9ta5QeKds14oVxm/TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="97536556"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="97536556"
X-CSE-ConnectionGUID: u1m5op/rTzelOb2KdP5ueQ==
X-CSE-MsgGUID: k+t2JSSLRaq4mYtAUpgujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211573418"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSCc7MymPriPzYW914ImeVMdnz4v3WV21l5Cg6UydgqRn/PhB5Gj7mO6ZWgGW1t0Lhqe6UmwPY8d1v1eWLcMcOO1+LzUh93Kh2fY161X556AgsbVAdo0bg1vsVdHI+bLOlNV0AWYUExydV/EGcpC+uq3SK4ARTSD5oqP7t9iix3nc9YtotfXVGSSnbKhXLe4X38qb7X+Fm82EGmKBLsg48kOi9baNfoFMgEentMaCoSPDPnpAPD9VxgO/mMOTYniAFA04MQ1Hk4ok99Ek/K9KqGTGifcdCMBLVOmNgJqANDemn40DGcJRnh0ERm678fO8PoaLl3GVux1oO1I+xEWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC706wJgFR6kmhhlbMyWb+pzgV63UshtaQeMKU7hFVs=;
 b=IHkm95DeGWn95tizfBRlcIzuJS43R/dxijtc0ls8GDT/EjFsfn5myxyKYn0SNonE/V2gLYaoA3jkUM+05auTpP40Dqdb/S5d8fwC9l+VAukoUKSgB7opJeB7fInpIQFdvRPWYDPNO50ikjXkT8LMHmc6xcfOQjQejCBjCrL8QHyuXjscywLOx6qymHQZCyvMeCk3ZVQkP/sRWqhL+qwcC9pQRMIvyfwYMmGbQQ+XUSe8sd0wQJQP9afPT2eWIB0ZVbgNgXTxE6BVmCmlCzi+ceFIU2PozY2Jw5AIuFauCeNTTEh5qdCl7Lx84VcMlIDLCYCzZXeWaNCAlDaEupWGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Date: Thu, 12 Feb 2026 09:33:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aY3koH9v0spVmiJA@intel.com>
References: <aYtznP_tT6xNPwf-@mail-itl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYtznP_tT6xNPwf-@mail-itl>
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5dbb9b-9a7d-447a-27da-08de6a43a537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pvYqhAqmFGNqnQxtNUDZO5nOE0jzu2x36ZaeyeD/EvK7jCKA3xVlckqEyj?=
 =?iso-8859-1?Q?9eeabVXa3FsiR8PefHJ4FWRnkOmaE/C3kkq9K9XGDMoA7lD5oIqVtN/5Lb?=
 =?iso-8859-1?Q?n8vnj8g+WP4vHV6hhHzvc8zcZtmtUqREBVxW2m+xOScmGvWDHrt/8dbLPq?=
 =?iso-8859-1?Q?PJi9Se4Sg9t7mJOecKExNfwQJzacHsmIuOk9Akht+2p2ZxsoaKuBhmhcyX?=
 =?iso-8859-1?Q?nmYUm30AfMAWIeLMdQGehUgfNCKqQP9eylTO1NmvxwrDfyUgfq+jFBPAl2?=
 =?iso-8859-1?Q?pXT9tUnWkd7XNZuIvep9iZnKp/c2zpll6IV275C/zK0o0fMhWytOan0aLV?=
 =?iso-8859-1?Q?vYoGHFjJ4GgJj8HYkTIrh2dxuKdwhReSofLbuQTL9Wd4RQ9eT6aal8ci7l?=
 =?iso-8859-1?Q?SZVdHwfqwwewZj8o2fwfNw55+afHZLNZFpaEgftKyEKOvdQoNJfUukz9sq?=
 =?iso-8859-1?Q?Hq9/MFhHKRMezlqLkCcVj3I7gvvQhJUmSvoGgCFLjrFOOO1eV5K7feemiA?=
 =?iso-8859-1?Q?mVc4Z/HcHJn2lFHjbOnTR4crS7ilu5Q7qwT8kuXQwWCNJemoIa9N2pUfyb?=
 =?iso-8859-1?Q?3WoXK8V1GQP55UBmbw30UwZyiKtgRyT+GsAbkCobgOeMZsrxMI3beuMoCC?=
 =?iso-8859-1?Q?WSfmDfqk1gZFKmcMNM/rQ+Tg08m7HZggCQnBXCuKWIyPR9U1EdKvX4dwrI?=
 =?iso-8859-1?Q?SfUyfYvKQyt6hf62VbOmbZafnkemDAPR5uyPMpkXbqwSO2LbP2wOILTSt+?=
 =?iso-8859-1?Q?oRB3YoZIa6DRHmVoBnJOKaVFsRa5thjgjCUV9+OPpHwm7CbCVCMNhExcNi?=
 =?iso-8859-1?Q?kzPO4foGAExknIIQ5aOY5Z9GsQLfUid922GkjWBr4oVPBCG2ZWVXQOgeR+?=
 =?iso-8859-1?Q?bSDX2OLs583bu9XCkWBH/D+YvCtPevrbRl+8XmCtKXvXr1Qdzk454A/XcG?=
 =?iso-8859-1?Q?6k+ZNYnYOnM0JjrfvcBnKGi/HxZITCrtQTFqKgmZJ9ojTIMRBBIp/3LWM8?=
 =?iso-8859-1?Q?vc14QWXYinj9C+Foss7lSY9xTepYeIiL4fEryUN9bS28IiyUzWGIbryUY1?=
 =?iso-8859-1?Q?e6QIGdpR/sJGLO1+MlzI0MeYLJsgkyqMMgOLAdkb2eem15+4IkAxeRZ2Lk?=
 =?iso-8859-1?Q?5GMrtI2AlM5MWH6Q1KqB6S/fgNAejH95VmqAo8N7b/6EgFWCbj4fyiVZOj?=
 =?iso-8859-1?Q?Xtv2b/toFx3XkhiB0hX96Ng6v5Ldwv9qFWYKJShKp5m+EXR7d0XmGmvblZ?=
 =?iso-8859-1?Q?v6O7xWGDPoxSPRpTs3zDwC4VDHPfLZFl35DjTANSEa96wN9LxJU3YGMI+F?=
 =?iso-8859-1?Q?YX3u3wKxIAQA/7Sn+9xMC/1dvRCZs6znxEJVvxftfiP94Nu6JX3t8mkDRN?=
 =?iso-8859-1?Q?37c8XkxxX+Z1/i2Obcd9mjJVxwrQygJMGhUQXorrMzO2wVtuwUmNP62ke9?=
 =?iso-8859-1?Q?lV76NR+vrDLmuD8MSfLFZjHD6aZ9Nb6k6cm5bb579t55Oz5RfJ0CEteHg2?=
 =?iso-8859-1?Q?cmt2XDX3f1aqR7mSqBmRxpc4qs1ZqPFbUicj2KlJ2GoQ3OUgrQ5v14WEMI?=
 =?iso-8859-1?Q?fW7YC7ApRMEyqWzjQuIHPwpI9Gbn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NMyXjBJ3mAlGuSt0SjMDDjS9Y0hCTcXFhuFjNk5fx6z7V5iWETkRq67R6h?=
 =?iso-8859-1?Q?qitEFUSPk5N5YyYG5ANKpoXEL+Xv08F9MYQNW8lxZGfa+fLEqaaPwXtjeZ?=
 =?iso-8859-1?Q?WA5+hCP9jmDUiUxpAi5m44bEvYljpnUeOOjJpWeGw0bG7DwEM2M20UwOXP?=
 =?iso-8859-1?Q?TVmbM1W/rDV0latBzCBD8f8ssjYizxzJRGTfWoSKJyPygJTEuzweWUchG8?=
 =?iso-8859-1?Q?VT0Jdp9qQgjzY3ZsObqnmk+uaP1BJ8lhNeuWq+81cHhDfd4BR6tX/TrvrZ?=
 =?iso-8859-1?Q?Y/+7r10R54YJjw5SPpsgYLY+AU777jjT7bKTbkdXU8PsfGL0JaNB0+IDF8?=
 =?iso-8859-1?Q?tTXjS64/0gSuq8qhZSCVQ8f9vcEKdF5gVkr7DUOjJ4PCBeAhvMyADi9nUw?=
 =?iso-8859-1?Q?2M+8mgv/zL0M9FEzvFQDM8gi8BuiP6x0Knr4UiscQ8OZ+uwJ+lBHBG+MY5?=
 =?iso-8859-1?Q?NeRK636arGkk3oPazQBv3VTE72nW0Y2gw9M60KBSWXZLZoz/0poECJRY9Z?=
 =?iso-8859-1?Q?VkMOZVwlonrPvhEyBGdV7RyMk/LSiWBni1CE1kKm4VWs20wvyMIP4HmM8z?=
 =?iso-8859-1?Q?QVoF1eAiYP+HzZwlYxpI8L2shQVXFP3T/eW3keDmgNxrOnR1U73QbUwzuI?=
 =?iso-8859-1?Q?CziXCMVM31BqdXIBB3j0urGt/k1fdnw+e1uPEZ7sJA/igtqCYmsDhgcswC?=
 =?iso-8859-1?Q?h6fjIu9PjigSMbOJXYhFJEZm0TC7rKJMJwXEaJ1b1Kx0tr6/jrvv1D1J0g?=
 =?iso-8859-1?Q?5zDp8s9aRxYJHXh502/TaYPW0O1gol15+XAPjks5+BavE6oeOHKl2zdbN4?=
 =?iso-8859-1?Q?LKpypSHWo51q1Get7obxlDC63x4+TnuujU/C8ieu/r6ROCdDpM6gB0gGY3?=
 =?iso-8859-1?Q?TBL3TJ1/TZZho+IKsG3QTax+7Lec0eVVHOxbzBWirsjlAl3W6yRtGiFy6o?=
 =?iso-8859-1?Q?EIiumEfaYk/P7/kG4GfpUIP1zTB/MqyTmWHj6ig9eiGpG77Rzya64Tzuo6?=
 =?iso-8859-1?Q?UDIb1oE6N6fYxKH1rId+E+4w3S9j0paT+pU6r+qj95NAvpcCP05L2r3fxs?=
 =?iso-8859-1?Q?FiJFxmLKB2dHqScoghRPLmvFZNOWixwel1QerAqxAVWbt+sIdfK6/7elPn?=
 =?iso-8859-1?Q?0cdJ9B3u8HdHIHkx5H7Vpwo6YInVGkk9B8IPuo1GoTYpIBE07Du9IWXG4/?=
 =?iso-8859-1?Q?t132jw47BtOol79d8N6SHxfo3Vow0E54VuQSOXoZRyhQi6MYfsmsapycDN?=
 =?iso-8859-1?Q?2e3RHhGZQIyeN1ubiBPflF8Z6fp9P808s7ITPsWyRLUyKEjYHzVkqzyLWo?=
 =?iso-8859-1?Q?9vax0xEXcePHl/h2C7Udid8ImKU0Kuzcd7+2WmZj8fqhw+zj7M8JiHgj18?=
 =?iso-8859-1?Q?ohPgPRFEg7jPIk1YI+3ivQgxB0jVIOM9+W5+lLJO3mIfGNHjq/as/2o/iO?=
 =?iso-8859-1?Q?XvCYdOzLdCqEr9AIihi85opFo7PA+lsDiu0NNt7/IrBne0QCrsZ5+mbUz9?=
 =?iso-8859-1?Q?xy98WDZEsI0X672RML10vmeGFtyb/5ELZoacjVNTavpOEVkQ2nDCk80yhB?=
 =?iso-8859-1?Q?y1vTzKSiFwFYrrbvC6D0pxjdE+lNQjHGs9/9lRYwR5lXFzyJCQkdzY29MR?=
 =?iso-8859-1?Q?9Vstww8npfsDnhSC8+nASPlpECvlM5Wepritpoq05lQL05+blRV+NHhW9B?=
 =?iso-8859-1?Q?nOBcgHnF8wQoZ8symMeaCNXqfdtl6+pxtlNJGrIp7jReZ/MJw3nFL+3tjk?=
 =?iso-8859-1?Q?7aecKKneLBxOKIcQDWAWic2oMASfLulY5pZ0VcFOkMJuCvPvhc25q3xH+x?=
 =?iso-8859-1?Q?hdaIFFV9zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5dbb9b-9a7d-447a-27da-08de6a43a537
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:33:10.3709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ac7L3aQLnyObjDzOhJzHM+idJk8jLd62lbQmlrZWZ+UPXONw2q/PqJjf+LvaVyJVNoItm+z4Z8lsDdPWvJhMPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6653
X-OriginatorOrg: intel.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[rodrigo.vivi@intel.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,intel.com:mid,intel.com:dkim];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 2518512E43B
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> Recently I started testing compatibility with Intel Lunar Lake. This is
> the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> Linux 6.17.9 in this test.
> The result is rather sad:
> https://openqa.qubes-os.org/tests/166691#step/simple_gui_apps/30
> or
> https://openqa.qubes-os.org/tests/166700#step/desktop_linux_manager_config/42
> 
> The black windows are mapped from a domU (using grant tables). But if
> you watch the video (in the "logs&assets" tab), login window of dom0 is
> affected too (background is rendered significantly later than its text
> and widgets). 
> 
> I didn't found any relevant errors in kernel (or Xen) messages. Just in
> case, full dumps:
> https://openqa.qubes-os.org/tests/166700/file/desktop_linux_manager_config-journalctl.log
> https://openqa.qubes-os.org/tests/166700/file/desktop_linux_manager_config-xl-dmesg.log
> 
> Some user reported similar issue with Intel Arc Pro B50, which also uses
> "xe" driver:
> https://github.com/QubesOS/qubes-issues/issues/10661
> 
> I tested also Linux 6.19-rc8, no improvements.
> 
> My previous tests of the xe driver on older systems (Meteor Lake, Raptor
> Lake) resulted in similar behavior, while i915 works fine there. But there
> I needed to use force_probe parameter, and blamed the issue on xe not
> officially supporting those platforms. I wanted to compare with i915 on
> LNL, but i915 doesn't support that model at all (and if I force it, I
> get kernel panic in i915_pci_probe...).
> 
> Interestingly, it appears to work just fine on Qubes OS 4.2 (Xen 4.17.6,
> same Linux dom0 version). I did not tested with Xen 4.21.
> 
> In both cases, our Xen has the patch to use Linux's PAT layout applied.
> That's a workaround for
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7648, which is
> fixed now, but apparently similar bug is still present in a few other
> drivers (including binary nvidia one...).
> 
> The same Linux kernel started without Xen works just fine.
> 
> Any ideas?
> 
> Having good and a bad version, I can try to bisect this one, but given
> it requires rebuilding Xen toolstack each time too (due to bisection
> across releases), I'd rather avoid it if possible...
> 
> I'm CC-ing also intel-xe list, maybe somebody there have some ideas how
> to debug this. 

Unfortunately I'm afraid we don't have any good advice here.

First I thought about trying to isolate Mesa version in the Qubes OS
version, but the fact that it works in bare metal makes this a silly
option.

It looks more a cache management indeed, and I'm afraid we will
only find the definite spot after the bisect :(

> 
> -- 
> Best Regards,
> Marek Marczykowski-Górecki
> Invisible Things Lab




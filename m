Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJb1AT9H/GkkNwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:03:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D58C4E4737
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302255.1576226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKth6-0000QN-UZ; Thu, 07 May 2026 08:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302255.1576226; Thu, 07 May 2026 08:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKth6-0000O9-R1; Thu, 07 May 2026 08:02:52 +0000
Received: by outflank-mailman (input) for mailman id 1302255;
 Thu, 07 May 2026 08:02:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.tian@intel.com>) id 1wKth5-0000O1-GG
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:02:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKth3-002kcG-0S
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:02:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.tian@intel.com>)
 id 69fc4720-e002-0a2a0a5209dd-0a2a45029d46-24
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:02:47 +0200
Received: from [198.175.65.11] (helo=mgamail.intel.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.tian@intel.com>)
 id 69fc4724-af86-0a2a45020019-c6af410b65ab-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:02:46 +0200
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 01:02:45 -0700
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 01:02:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 01:02:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 01:02:44 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 01:02:43 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH7PR11MB5915.namprd11.prod.outlook.com (2603:10b6:510:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 08:02:40 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 08:02:40 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778140967; x=1809676967;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pcnZj613tpFQBAUDwRchklhfCdz+IyCwboM0ZJtkehA=;
  b=GD0dHYMsTvtsTBXDfFW74oRfHTeQU6iCVOX0yl2hzuKsqdqCZSyYWItN
   7tDdF00GuKe7BdZnDt0QmowYa4ID4HdTLBuVH2cFe+ZuMhTXcpbHPJP7S
   K9VC6SAlo6xRPaSjFzLKt2tdik8lnclZk4ik7HuLXg6M2krIwVqOY6HoB
   0V114AyrD7OGHPtKuVAfz9N5pKrrXQcUaz1oDm5imBpM0zk7ehyfhV78q
   XnmMcIkoYnVHS+Yu/u3budRxSFqa2XWtNvjygDRvp9stWyQcohwH4AWff
   IbKuAyHpygTr2cjlRtWUOr+1/POnQrHz9nYLcep9clzMedppTRQFPTL9L
   A==;
X-CSE-ConnectionGUID: YizOmbheTWGzNP/hVxdVyQ==
X-CSE-MsgGUID: EiIEDCoBSi2NQWvTpRkLQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89392525"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="89392525"
X-CSE-ConnectionGUID: Htv7n2L9Qcqf1pBgPfwXlg==
X-CSE-MsgGUID: yzYm0vLRT5OCRLUJuy27bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="235399945"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIx0dIDsMSBZmpH57Ql10hs5s0ABl9zK+9Q368yZi5VsvaC+HF5IAfzFM//1UCp9yw3VHlBVsmSIh/us9xGQhOamivcPjlMA/ncdhuijMp0YolESRa1VxEiWY9YUpD8Hmqfk5SYfORGL5LLqkaytHrjce1yRc4u9pCvc2ZzlAk1jGhNmCR7nezBYWvigonwxuDMCWmvYOuci1ugoVs7reZofO4g70UXSEskevO31RlIbzqP4Kibluy50LYq+qGpgY4ODRWTTUBAYey0cpq1jlhmBzxTsO7KRX5yyoIxHBHz8bkkqLeGq3djHRG9zYHXmQeaREr6TNmAHC7eWMEHRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcnZj613tpFQBAUDwRchklhfCdz+IyCwboM0ZJtkehA=;
 b=Fmzhm55YiXz9L8m1D4l8K0+Dxw4fkO9074fVVjvcWswZJAH3BrnT2+/1jhPKZPehLxFrXa/kMUgICK+eahjcI3h+LoSXbkxzKN1+Moypwy9vqvgGv+ckYa99+jFCJ3PUSRly7R+A+H84CTYqI23S9k8YVErBdcxtYZSlcOQMhYoETefRjhmgZ6m2EpJPeerlqDhLu7wEKLzng8FuZ3hdY+aWCkRcFocG9XtW1vaKcfFYUY91z8LBtw2GaA0KbWAhy9AkfaeeYvo+cAnP8dgd4l+8C05aDdjNjfQEfIbiJIW3NvsIUw0Jd6SvQOiY65Dh7PcTr4bqjlOyVZP/l5RCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Teddy Astie <teddy.astie@vates.tech>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: How to express "externally managed" IOMMU domains for
 VFIO/IOMMUFD ?
Thread-Topic: How to express "externally managed" IOMMU domains for
 VFIO/IOMMUFD ?
Thread-Index: AQHc0nD/HbUzotrTgkKZyZa10hSZGrXsSRwAgAUTsYCAEOr18A==
Date: Thu, 7 May 2026 08:02:40 +0000
Message-ID: <BN9PR11MB52768B5170F6CE558B0AC8AA8C3C2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <1776873531.8631fc262581453bbf619ec5b2062170.19db5ea67ab000f373@vates.tech>
 <BN9PR11MB5276B3A829AD624A7E1AB4408C2A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260426133027.GB3501894@ziepe.ca>
In-Reply-To: <20260426133027.GB3501894@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH7PR11MB5915:EE_
x-ms-office365-filtering-correlation-id: db3d8b33-1b3c-4739-46b1-08deac0f02d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: nxDJu+Nh8WNxBhaRr88NqN6NKrH0Khruiw5MXHLB6v9OUplzmHHM7XVRLGMiU3ZSOixwLZu3qb2eb8LViI+TAs8PJZ3bJXy96mDF86ICVODSOHgLDODLRYNEv5/oGvdYbMIP/ew6iQVNLhq9v+Um7qPFBNA+WsWLJWrEeRqle9LIwOw1JJOJRMUOXlgYhPgu1tAW85zC0r17/31EMmdFWUv0f3dbg3Vh7frVonmsyVabkV0mM9hCRl3cEWIj5S8T4/qQA+q9z4KtU75OrVj7fbo6pXSop+qmMeQplKUFtizsv6RpZWn+xCgHDmyHYlWXFte79nMdvIv1Ri7tr9IHOVlqsWgYWrBCaklowKX6U4/qhJ57SQ3MjbqYqRxaMsraqzBKr8wg48LGPuNhyvgtSg3UwqpsCNTBS13pdSAOvXXJmcCW6hKBkrWLnLr8lmV0Np06Angvd7+ak+f8n089DMQB4l8MwZ27vteaGcguLtCi6IGc/9z00jaUBQ+yR3b2Kibwvxw5k2ZA9ojWSGKBPN7S1vjXgARu3fv2kU1KRvdGwwZCSpAZsvkA98aFssz9fMGVs5f/xuCB8eUXPZNlzyEexv7nP/fETaljqKDh8CRM8/PPYSUm32tGvhiYi4MM8lTDQK0IV7ZTUB0ye09d9GCtcPuyZJruglM30HFk1as1kR5cjPoUaf8Nxc7ULDosfKdOkqcoQCVToEbYn6IaTg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4uhUD7gFtiRtHGciyG5UuI/Yx3v7/pCU7LIFZlXxQlv+dzimtDTxmWmdFRSC?=
 =?us-ascii?Q?4doz0ADLn1ivMCK2EbL/qQh/xbAibbh9VqpG9CcYlICpERVMK8QJStMMgZVL?=
 =?us-ascii?Q?n5RG/HWtwSQsri2aPbJ/P7ppYQAQ3SiktGlp5SKvvA7R1vDlXQSLxEOqdWOR?=
 =?us-ascii?Q?GUcF2p6QpK1YQB7nnGqFIHHCqWfSlzvph0LRPHRNkz+EUoj7kIR3V+ykrKw9?=
 =?us-ascii?Q?2/BMLDTyQJcOMUncYyWIQbXUy3YM+SN9f0hnITH2Hl4FNtBccTlE64xEbJM6?=
 =?us-ascii?Q?Bguy5HieVWg9NQntepYaGbEfzE7SByq0DuEdtt6xz/o4UOkFvWs74qiVNNHc?=
 =?us-ascii?Q?eFBc4JtDiT7jDztZ/57/OMWTMZG1/Xskd5tnwvjrwP6uemlg2S+EPPtF66nt?=
 =?us-ascii?Q?DMmcyxyOVo9RkIzaRkt07WWqa+PRRMM6M4IOG9ctg8c8zdLj0fYitD9IH26/?=
 =?us-ascii?Q?peT45MxWIVZAHyeY8ZwdmgftdIl74OqOn2HXJc7yWKdRmIry2wzBE43l2CQc?=
 =?us-ascii?Q?Kl4GxQyrGfVPJdx8E9lipMzb+FpsdMGBaj+Jqk8TeqmdDChXP2Bt22/dsePg?=
 =?us-ascii?Q?nreR79k5YGjHGB0hOlraNVZykFrF10nArg0OJ6tkjIVFab0JKcx8x4D0unnE?=
 =?us-ascii?Q?F4pBO+F7LjWRiq17aZbEbTnARNZwoWtj+MZSUrRsH90+fdTAbQFTGid+qZ3j?=
 =?us-ascii?Q?GVkGZ/TrMFny1q7MV7t8oWk1+zF7U3j2M6NoIqnbqg2trpS5l+wty1C4Tz65?=
 =?us-ascii?Q?dzMs4OQ/ohXZmZQsv5e+1Xs4ts8acS0ZOd7B7O0L8b6FirsjS5CUb0NGALnP?=
 =?us-ascii?Q?YDJKhUb7oagPhtFe0ppSLX/EpuKJ0/dzN5OetZKphmeNg6NLLT73P2M6OcI2?=
 =?us-ascii?Q?/CS+0A85dptOgLa6OAibIrgkgS3/Cwjw5QbwxUobCUvm0hEizgpceCxyxg30?=
 =?us-ascii?Q?213bpHwPznN9iSCyzhI/20GqtdEIT4ERB5efw8VQbqzeCNZfBax6YaNlPhEA?=
 =?us-ascii?Q?VRNwF6y0VY0cjyvIVutOItilqltuTS9AJXcULKLEZNBkKu08WSwmmYwjUrFv?=
 =?us-ascii?Q?P4ysgK7LUcLpcDrX5RY/EEagZwziFdKTXDL3WnfGYMdsXP5Ax+gDem/5/Vj0?=
 =?us-ascii?Q?6OXZ9eJhs//1BE/yXLlGaoMtUHPFVyiG0YNuzSq3D86H/LsaoW0VuNx9AarA?=
 =?us-ascii?Q?BJbx7tj+NrsYv+742QrRra34FjSJj+qH10Qt3Yo68qf47xGDZB/vJ142SWDv?=
 =?us-ascii?Q?jNXxB1VPg8HFA05KqmhEygLCUjd98lE0tJfTY+uGiV3UxMoJzeKTqGSId/Bu?=
 =?us-ascii?Q?z6APrQuml4IBKaw7475UO9HjioasK9NcvN/Sdq6JP93UqwsGKrtXTzzo4YS9?=
 =?us-ascii?Q?2p7c0L8MOhGYqfhhlgmyGWVvoUTO98k1fe8tIw6i7ZVKJ2UteV15SUJCeE61?=
 =?us-ascii?Q?WHcHqi5EGR4doombzz0nvqiJHKffVbRGwW4kMC4cRff+DOFS23JCZQfHFI+G?=
 =?us-ascii?Q?ZclcaK1u+VYY7dCBWdAZ+T8G7jH7jfNX4DnXpYfR9bn7GhXEWozS++JTxJPU?=
 =?us-ascii?Q?PzAplNMc2OAKFHxOlkmQ6brD4R4ajdFB3cHFWbeMxAKvJoBbYWM3YgQ2EZIk?=
 =?us-ascii?Q?7MG7FqIP1QYSgxbmcTZ7SbrxIQLHkCAHbHbqi/4DUb+KQCCMZRWNw8mRYr5b?=
 =?us-ascii?Q?YWJZJ05iH8j0O+y7Tga0Q9vLPjAlXAQ2acpLvIbCsL6plEiUcjh0R1UGOM6q?=
 =?us-ascii?Q?IYwoO/TtmQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VSfCeairwr+tBnZUwy90Y9fH5KsyFjF+1tIfs1/ecuba/9l+N3WijyakW4xUQadnNgyL7wp+YR5wOrY7+XrGJUpH3pA9zz8AQwlECvi0OlvrKb/SbQQv9u+tugQh9qa0hq1WfzMdpKIoxlPAM1BZFEmln2uNlTFTXNjDaUdscjXZKth24drbhaFIlk8XO5DLCoQQEgcO83i8o2EIjhD724gxoyCCuLvvEvln8NAoEzLZL5WKqx3lB3mI7cI8y05n78X3mKtRTgRE8292TW/nnXjPrQOovfhhnGIQAiPXW1NJZcfbpMcZZTzypblhEtNTpBWIMsaRHvsAXadY+LLRGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3d8b33-1b3c-4739-46b1-08deac0f02d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 08:02:40.4075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7Ss62VstNWPi7tykbszPu81JGV3Yl9Mq8W9yQ+bBt98CXAYDUeAGOZIRFCss8lkhvl1PwNQUJeJF5qaZdChBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5915
X-OriginatorOrg: intel.com
X-purgate-ID: tlsNG-720697/1778140967-ABB60161-48381AA4/0/0
X-purgate-type: clean
X-purgate-size: 1551
X-Rspamd-Queue-Id: 5D58C4E4737
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:teddy.astie@vates.tech,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[15];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Sunday, April 26, 2026 9:30 PM
>=20
> On Thu, Apr 23, 2026 at 08:01:50AM +0000, Tian, Kevin wrote:
> > > On Xen, we have a dedicated hypercalls for moving a device into anoth=
er
> > > guest (so it no longer belongs in Dom0, at far as DMA is concerned).
> > >
> > > But it looks like there are no way to describe that idea of "attach t=
hat
> > > device to this VM" nor "the device is in a VM"; which makes that
> > > impracticable.
> > >
> > > There may be things that could be done with the vIOMMU objects, but
> > > there would be no "parent domain" in such case, as said earlier it
> > > doesn't exist in the IOMMU subsystem.
> > >
> > > What is expected to be done instead ?
> > >
> > > Teddy
> > >
> > > [1] https://www.youtube.com/watch?v=3DpLMGRgEJ-Eg
> > >
> >
> > It'd be much easier to collect comments if you can put plain words
> > to explain the problem rather than expecting other folks to watch
> > the video first...
>=20
> It sounds like CC and pkvm to me so I think it should re-use those
> mechanisms..
>=20

for CC and pkvm the guest memory is still allocated from host.

for Xen the guest memory is allocated from hypervisor and invisible
to Dom0. iirc its device assignment is implemented by the toolstack
issuing hypercall to hypervisor, bypassing the Dom0 kernel.

I don't know the latest status in Xen side. Seems it's still the case and
Astie is trying to find a way to orchestrate it via VFIO. But it's unclear
what his proposal is...


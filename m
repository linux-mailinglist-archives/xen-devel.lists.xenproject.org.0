Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2107CF0EC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 09:18:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618927.963253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNII-0007yA-0e; Thu, 19 Oct 2023 07:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618927.963253; Thu, 19 Oct 2023 07:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNIH-0007ux-Tp; Thu, 19 Oct 2023 07:18:09 +0000
Received: by outflank-mailman (input) for mailman id 618927;
 Thu, 19 Oct 2023 07:18:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zn2w=GB=citrix.com=prvs=649eed31f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qtNIG-0007uo-6z
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 07:18:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4596b5c-6e4f-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 09:18:05 +0200 (CEST)
Received: from mail-bn8nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Oct 2023 03:17:39 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5136.namprd03.prod.outlook.com (2603:10b6:208:1a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Thu, 19 Oct
 2023 07:17:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 07:17:36 +0000
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
X-Inumbo-ID: a4596b5c-6e4f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697699885;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1yd4Y+hBPMPioZOX9j3Sw0ZpCvZg/ZlTox1hIMaQRkg=;
  b=MI6MKnONZD2KgPwbjrONqXSMPY3q+cm6oFvJ8jY/AoevFys7tGL6gASL
   /mWa5ZOHh9d8zlNdg60/OqStLyt5W3MsL1iBTMBgrYcBtFsQMxcJxIfi1
   haUEp2zHqVANnuwrEJjQ28qzvTtbAdZOQ1ze4x3mC1hRhcw+UOA/lgfOo
   o=;
X-CSE-ConnectionGUID: UcOfVIQKRPOH4YQSDEqVIw==
X-CSE-MsgGUID: sdflAV9jSWuqqddtnllq1w==
X-IronPort-RemoteIP: 104.47.74.41
X-IronPort-MID: 124629210
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:QbpM4KPsYAeFtkzvrR1hlsFynXyQoLVcMsEvi/4bfWQNrUoq0WBVn
 GMZWGmDM/eKZTbzfNwgbtnn/EoHupOAmIRmGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5wxmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tt8Jm9w1
 MU7EggqTkyyvtma7auFa/Y506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvzG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC7y3L6VxHuTtIQ6D7G28tdU0V+o+XEKEREaSV2/peDglRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkgJSCRQLuMvssAeTCYvk
 FSOmrvBBzZirbmUQnK17aqPoHW5Pi19BWwPey4CCxcE6t/LoYcvgxaJRdFmeJNZlfXwEDD0h
 jqM/C43gu1PidZRj/niu1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nWyERhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:sszJpa1ECaFBDJwqqbInWwqjBapyeYIsimQD101hICG9vPbo6P
 xG+85rpCMc6QxhJk3I9urwQJVof0mstKKdjbNhRItKGTOW3ldBwulZnMbfKxOJIVywygd279
 YqT0BGYOeAQWSTZ67BkUeF+q8bsZO6GcOT9IPjJhVWPHtXgvpbnk9E42+geyUcLmQrdPlJdq
 Zw/vA31wZIO05nCfhTKUN1H9QrzOe76a4ODyR2eyLOKWG1/EWVAX3BfSSw71MxVztOxPMF6m
 jKkwvw4+GGv+ugwhHRk0//hq4m4+cJCOEtOCVBsKkowrqFsHfgWG2pYd3y2QwdkaWU8V4vpt
 HHvhcnOK1ImgTsV1DwmwLk3z/q2C1G0Q6W9XaoxUH7qcjOXz4iDdFd7LgpBifx2g4bpdl55r
 hA2XmU3qAnfy/orWDG/tDNYQthkFG5l3okjIco/g9ibbc=
X-Talos-CUID: 9a23:Sc+gOmxXa8HiGchwP5/WBgUpEecrTFzk703oBG/kOF9SZJCMd36PrfY=
X-Talos-MUID: 9a23:n/zIaAQWnDiiQBZ0RXT3iD9mHfk54Z+RFVkUnZkavc2ALHVvbmI=
X-IronPort-AV: E=Sophos;i="6.03,236,1694750400"; 
   d="scan'208";a="124629210"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WosEzmRKl0eiKfXtSpuz5dksP6YOx2bfWgTNKYh/XWcZgTMKSv+ep2qT9syhhCKC0lR+3Ss16XR+CMl1hm7+TBnbw9geNR4tWEKluwRGVqit7lx9utCKgjkeF8M6NbSQjOqHsv58KOu8bpffNsq5vlIK6etCZYEK0fGzFXja8eoxXv16YAe1Ih+/Yht+DAQNMfJiyRNIILrL001rrU6Gs+1u1rojmSHYn8sXQi/IJUyopg7Zi8xKv3OGQ69rw6bchk3abU33R/ew+cR4Y3oU+yVC0rrCHV2s3a8NbXAosUv8bVfk4x5yVj3xXtvC2KxyNy90U7KgB/o6TXmr1+RwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gVjLa3u4Ce9NTfI662baZRz8jgeAB0yYmtzYoYNsHI=;
 b=CSwqEdXHbqlo2VobvLNmFTnL2BTwR4jxpu53e4qmLHWvuv3ecC1gpuUZxyOo7WysHKFx2YsLKeRHdul+rkV1Y5k1iEaBI/jRxcper+MuuNnZa2uRMu1BRDpugfY2XItZ8a1XDf8M+KI6y66vtds3XV8G3A6Lxm1bEfyEYRPpqR5Bw6alHteGqCsoJdsX3FHkvwnAD/QZQT0TEcPl+mSe8EuLf2cdJNTFwrkEsX/H/o/mePwTcQ1bc4Lq4J3WJqhf5fl9RIKiSiNJAbEGt39C6pkwq1keFstWVrmxRBHTws/DvGTcn0Uz6qvv8b82UCCE322V15oJ2ztzIOfjt8kzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gVjLa3u4Ce9NTfI662baZRz8jgeAB0yYmtzYoYNsHI=;
 b=ePg2Y66DoQn9fegpv//OFM+UbXiN7VuuqsTDAD2RO+UDVNS5PqfKZQT/iurHFy6Zg0XZCGpAVcUjt4br8QB99L2yH/Wko3CngBcOPM/7ic91rWyQc0K6VpOK0LmoiOINDMRrzodXzQSbl4Jg3178qPzSF68JAI//ej7zDT+vVFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 19 Oct 2023 09:17:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.18 v2] iommu/vt-d: fix SAGAW capability parsing
Message-ID: <ZTDYC95LkxjV1O3c@macbook>
References: <20231018160733.24655-1-roger.pau@citrix.com>
 <0237931f-dd15-43eb-9751-171615a005bb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0237931f-dd15-43eb-9751-171615a005bb@citrix.com>
X-ClientProxiedBy: MR1P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: b7eeefc4-5d8e-4489-2d07-08dbd07378a0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kzlULT2m9UYmJDjQQqYXXrtL39tQQZzL1tbkmXDhsCap1jyQ9mljS8X8ApIMIx5IgwRKNYpUQNt/oeNM4ynNA5YvCz6qwKZc9PiS8HxXwbpAWl8QACWEKoUJN+Go2YVTVclSxzlDf6mg72G79RQwIYKYOqXUfYqam/ywfpQeRL1NDzfYtdYfHJlPe3ucTOiJDYAV+lr/QCMt883Lmgblml0ldZazbB5lUzZMe/2rGzZzlSuEh2tFHJzmafEEd9kCZ0iteAgHrNVh4u3TXFYEyPk8zS0M8tXW0WhZGomN2Hy8OxoTGGqdV599RNYvQ7xUHTSFadD+r9F7gDcNMow1r/pfhLFC0MtbaZG5PUY0lLypzDKSuO/TnMBfGNRm3YeFpAVtJl49PmWfFpHkemJQVheVbj/oE3zdf57VmQJiIiCCKN5y3KcXHe39Q2weiINbRighSMjCGJnbicjv2oaqn+tyCw3k4SngvLg9H1QIBGwKSuJzB5DoAYZm6CysHQuUC91Me31buYtI/ZrMU6xp8TPs/DAxVdTUSHoC+jksjVIfLais+S4Jg3tfBE02Zdg4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(396003)(366004)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(4744005)(2906002)(5660300002)(41300700001)(8936002)(6862004)(8676002)(4326008)(26005)(316002)(66946007)(6636002)(9686003)(33716001)(478600001)(6486002)(6666004)(6506007)(66476007)(54906003)(53546011)(83380400001)(86362001)(66556008)(85182001)(6512007)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czdwYjh3ZnpWY1FPUU42N3ZBc25lWGZQRHVUNUMvWWxGVDVpVldNbmc4WjRy?=
 =?utf-8?B?QlQwQ1R0UTRQRDcvejhrTi8wT2hIU0J0WGpyM3hvTUNGMnZjVCt1bU9Bd25v?=
 =?utf-8?B?cFBTU2NmUXhkQVRUaU5GYzZyTWJQSXRCMHZQR1M0VGpkZ1lUa0d2a0NJNmxm?=
 =?utf-8?B?YStMSUhIeFQ3S050bW14SVZCeFZ0QnlST1VobmhYUHhkSk41T0NTTWJEcURk?=
 =?utf-8?B?bVQyc0UyekhsTkJDZUJleEExa01mNitsNzl5Y0p4Z2lIaEZTTFZLZUdRUlBj?=
 =?utf-8?B?WkNCell0ZGc3UHpsVkpmbzlxaC9IQWpRR1hsZElqZFlYdHEybVoycU1HdVF1?=
 =?utf-8?B?b01kY2lKbzRqLzd0eThmeUxGVlNyejNvN2ZpNkdpWEhVMEJSWENDa3dlTTNO?=
 =?utf-8?B?TmxJdWNDZlQ2S3hJaGwwQy9EWXZwYU1HQ0w1cWxZQkdxR0JQaU0wQitXY2hz?=
 =?utf-8?B?YmpDMTlpRjMxeG5IUmJvbTBvZlFGTUd5NFp3VGhkVEVoMHhYMUlpVkQ2T1JJ?=
 =?utf-8?B?VXQrbFBEbS9vTXIyMGNTdXAyT1hDOUZ3REhFTmk0R2Q2QWE4R3llT25iZUMr?=
 =?utf-8?B?U3Z1dzFvSkNsWkpoNkxjZitoZ3ZBSmhZaVRyZ1VEcVkvRWluNStFUmpuNXRw?=
 =?utf-8?B?NC84Vk1GLzlYdFk2SE9qTnhRd29lVFVBbG1lS2JUUXZVNUxMUCthMGkwczZF?=
 =?utf-8?B?dW5pZnE0MVE3dWF5ajhpUFlpN3hQTHZoNzdOZXlkRFFuRUNYOFpsL29ZSDhO?=
 =?utf-8?B?WjZWNXZWSE96NDVDMG1UWTBTSVVjVXpZVzJNOU9yK21xS1V5Q1hwNDMwVFJv?=
 =?utf-8?B?eVEwMXZVT2pQNGg0TTA3QVJCZjBxNThDd1Y0YURrRUJPWXQxUkpROHNHWlhx?=
 =?utf-8?B?enB6VEJCeEpqU1lYWWVKOVN6RUNpeFBySDdQZHY2YTVPU1pvMTF2SElVNFh6?=
 =?utf-8?B?c1BCemJFMFJ0WU0xWXc1ZnVPUVhRYnVmUTIybHFFYkhyWVNiSTNWOTB6cy93?=
 =?utf-8?B?UUpNYm9tMWh5MXZVY1gvK2ZwdEllN1pqOWdMVWNIMFR4cmlhR0w3Z2IrV3hD?=
 =?utf-8?B?WlRTQXRRNjNlczdXR3BTYzRGc0VVa1VRem04R2lHdUx3M1VHdFhnMXYzUTVp?=
 =?utf-8?B?NTBzN1cwc0hQdnJ0NXVZdmYyYWcxV3BET2FGajhZMDIxNm5BclhPYjJtYUF4?=
 =?utf-8?B?OVpCcU93OWtnV2hKNC9td3l1K3JFSzJQci9EanlTWmZmcDBuU3JwT0w2SFln?=
 =?utf-8?B?S3A0ejd2c0wxellYMllPWE9zQXd3QVZUeHBSWi95b2h4VUpJZmhES3dhYnRw?=
 =?utf-8?B?MnBncmNRb3lFY24vdENMU3BaamRjRmltbzh5Rmd5U2tiM0J6eDUvK0V2UGNh?=
 =?utf-8?B?N2JFampyaTNBTHdrb21qcFc3U0ZGNVEzOGdpL09mQnUxbEIyaHFXK3Q1VmF3?=
 =?utf-8?B?YzRVb3cvazZxTlVYMWpYREFnaUU2c1VtUk40ZlJFb2FJSExUbnE4c0x1bzRY?=
 =?utf-8?B?WkF5MFlqbmR1V2o3enVpdHM0SHBDaC9SUjROUzdsSURaVkxUeG1KY2cyMzdH?=
 =?utf-8?B?WTFYOHMrcm9MWFk5YUV5akdwZksxV0VBTThmS1kyakVPc013Y0w1ZkNEQlk3?=
 =?utf-8?B?YXBaSU9uUS9rVXVvNzZkTmNUZTQ1U0pSZmFFOGtXR2sxTmwrZGlmWEJkOVE3?=
 =?utf-8?B?Rjd0QzVxMHJIUGkzdTY5by9sdnd1Z3lXRnJ5RTViWWZpV3poOTYwVHcwK05P?=
 =?utf-8?B?V1pLYzR5b0p4YTRtbWxTUiswSXBWYUpMNE1TaXN3dXYza3NVTkxIWXR5T0Vk?=
 =?utf-8?B?K3RQU0hkVkVmYkYzMXg5UHYxNDFuM2dnUEZjMldoRFQ1TzU1V05pQmlqWlkr?=
 =?utf-8?B?ZmNEWHFHNndJUnhIZVR0Ly9HSnlkQnNZUnpLZ0ptK1JLOGF4NVNMK2V2ZGZ0?=
 =?utf-8?B?dnd1SS90bnpoL0FzTVRTY0N0aTRKVTZFeHpFU0l3VU9lQnhtNEdSanZZV1hT?=
 =?utf-8?B?MG9zVTZzdU9EeGQ4TkQyd1orckhhZ2pxVVVsdzhYNmFLMXZyaVNZKzd0STF5?=
 =?utf-8?B?R1FHQjJLVU5PNEZCSHpPYmhTNFRHb2dCNjZtc0RqQjgzZVdCNm9wTGtCbHVL?=
 =?utf-8?Q?VzcDp7WDvzf/ltdPpIZXk6b56?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KIWmwhKajpzWFau/wkMY53ChYWj53UEpl+1PWHjuNGhoP+uH1TlRMSAiu2zUtXmkgJDQDMbttpAUGh2H/8adejPkjWJ12B3tvJAsx95tg02qYo8a2PnKm8XdyJzLUxkQtUoPEXPdCwv6ZvKtgsmJflxY8OI/H/cIRoYfmOFVq94mj0+P26KuVlPbHT2ldtUSS8QSdEjvEigD5qVA3Kr9gdkUr/H8mo5A+/wb5z9HV2kXk3qkKDezmUQ1FsedR92RTEamWsQV3N7Hf5nF2RV/v2GDI9bveOqzKmcSpsKHyIQCGA5EcOubuta9agA32/yfRfVOq8X15tQ4qJyewFg9d+R9OiXtfkaaSPflJKzJ+n43ecUs3OtRahqUCbbutyT8s5fuNJdCZEI3JGU+MS95Lk9//XOsQlh/89ytN/j35N9M0ZhHfZ/RQXFXnX/5z5vK5OmQRxBJS6jPpgbrRSKW45hzYmvg4RkiqJy6JNIqpMzVLK1hk89NLc6I0EgmcyoDRlRzHO6TRSaDxMrgj4hldEhmuLRqBDC3m0IYGsWucc5MUSycsVnXRSxjwxZMFKCfJlcBK8dJfsiTdhKGxw0nc6pegV/TGBbMpFjg2TBc+8N8ncAkzFvj59h2LLeZFlC6odn05W0YD/LdYVGsqzK2bxr0jC7TPYe0BAW8w9/ViUJ/mDVm0NLihthJ58L6TFY7c8vSeltB1c70BI01MlBrz2hFNfV84PsshzI4aAaitZm55vATt3s06iHaEpDZjIv5/TY8nV3XWcd3dKGsCX89LGS8wVCjvqWHuKIlBUj4Vn6lJRsCHwOW0Un2sldMffrSA3Ug0dRBuCOOMMXEN+3/lbgNZ4tnMQJr8LFGeEKJ+qU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7eeefc4-5d8e-4489-2d07-08dbd07378a0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 07:17:36.8520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36NfWqHH/FykyChbmvCZKOiHHGKfC9gbR2Dz56PbZj8fy6WNA6CS7kc8fMow/aaQG1hs5dCI+834n0lms7454A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5136

On Wed, Oct 18, 2023 at 06:04:29PM +0100, Andrew Cooper wrote:
> On 18/10/2023 5:07 pm, Roger Pau Monne wrote:
> > Enabling 5 level paging support (AGAW 3) at this point in the release is too
> > risky,
> 
> This comment will go stale extremely quickly.
> 
> "It is too late in the Xen 4.18 release to enable support for 5 level
> paging, ..."

I was hoping it would be close enough to the branching and tagging,
but your wording removes that ambiguity, so that's better.

Will wait for further comments.

Thanks.


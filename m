Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22EA7A4DD8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 18:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604129.941360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiGgP-00038H-M8; Mon, 18 Sep 2023 16:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604129.941360; Mon, 18 Sep 2023 16:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiGgP-00035N-He; Mon, 18 Sep 2023 16:01:09 +0000
Received: by outflank-mailman (input) for mailman id 604129;
 Mon, 18 Sep 2023 16:01:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OhQO=FC=citrix.com=prvs=618330109=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qiGgO-00035H-B9
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 16:01:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8eebdf1a-563c-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 18:01:01 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Sep 2023 12:00:49 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5655.namprd03.prod.outlook.com (2603:10b6:5:2c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 16:00:47 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 16:00:46 +0000
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
X-Inumbo-ID: 8eebdf1a-563c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695052861;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VS5KYQ/9a9yfEVFLY3obnzBb2ps0qsxEBluG1jAApbs=;
  b=B0BzwoMwBaAuvKI/bn/XqO3DL35xxGmOKB8POefnYB3BlLNASMw1h4DJ
   JKnMFgKFYP5/TtomPbHoO5C8+nLt1MbYh5s2uzqAuj1suXhAkGAUh8s+t
   DV/Ttt7cKTUXuPcJQ6K5QPgIZpBUSFoPbdYoMG1+reLovQS2yxI24pPqy
   Y=;
X-CSE-ConnectionGUID: Ih3uThSgTDqBfrVA4xwcbg==
X-CSE-MsgGUID: Bl3EPe8ASU64SfDXwumXAQ==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 125717139
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:bpnmy64KPsXWlQXCK4yEcAxRtB7GchMFZxGqfqrLsTDasY5as4F+v
 mAbDDrUPvjeN2r2f9pwOo6x9BtX65PWx4djT1M+/3tnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35pwehBtC5gZlPaES7AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 PxDNQwNVR+/q/uczqiFY7V8mc8pI5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojuiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx36kAd1LT+zQGvhCqlnI61QeWDQtaAXnmveVulGjXuJ2E
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACAEDs9/qpdhqigqVF4gzVqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:R2jOkqyan+o3YUs5PjXaKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: =?us-ascii?q?9a23=3ArTCPXmlMvyuoJ0zgdRewJchdBHfXOVzdl2rsI3S?=
 =?us-ascii?q?3NUpwYrOPd3bM6LxvmcU7zg=3D=3D?=
X-Talos-MUID: 9a23:GV5IGAWlEIxgSyzq/BXo3xxaOZdB2JnwVHsDvaUZpsy0HBUlbg==
X-IronPort-AV: E=Sophos;i="6.02,156,1688443200"; 
   d="scan'208";a="125717139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcWLH1hH6Uw9bV9W0R6TRKNtUDXSzJHpVHMoCI1HKj5TbJQrR+5Z+PvnG1Z5Ygpsi2TPjzcTG9OUOub7S49Lfo381NNrwLVifBkyPTRIGG2AiXjlvNiaCnC8WvY1vdtOiV8fivK5zgwRC6gusX76AghWl9K/ieXRIND3OfbQLvgJhY30NWw6FRDh5pXpolHl/SJQRIfkdi31EYQkUb73QQTxGOEJGxgcGHvKeHaimJhR6OLCLe2Qc1yr85CjaqE96y6MUrmX31Ad+7PZvl3y4o7WMLq0K4ISunAr0SScbPwJZSaxyt9hCveTJ8TBjM5x5V6XY7t2PUs5ax9S8RyDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+JSiLyydEbaukD5kRGTXd4mxUVTLMmmMm6k8K6qlhc=;
 b=SiHU5IAVCQz8TNvvduFmzITspeawR6BPjxJzrMb1Q0aZ+VgaopJqbj2p1blFwrHVqpdWEqpw077p1cFsKtlLCLsoyC6ehYnrfsN/uLXdq8p/feedXEWCODx4RWk+oHWbYRtbsUG1sy47hDyvJ3heI+dYPi9u1ge1/g3DRrjo/9Dcigffcbs7D/0P/iF+boLGCyPqj7EtA6qN2qF6WGKnmpQYFCdvg52HEer/+txUPuEjwn0b7P2vURJY6sQGDMYF5lSKs2iKdun3ujYGxp3rsvbnDv3OgEpQY89fz02PhNdj+Nr6OSZXiS3VrtyaHVID/GmBdIdJcrX5L0aG6ZDEWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+JSiLyydEbaukD5kRGTXd4mxUVTLMmmMm6k8K6qlhc=;
 b=vrk4H8gPeYdnV/Cbx9HwKyi7fgRhz87Yd9bn69JXXTW+Ly53+2nDYqXxTTbNHztBj+c1UQ4eLawwho9RdzAdZH0KLiCfD6PfIrppIqjBZob9INvNBZa8p33ugKrP0RG5gpAoHat6dEd2ByT7xcdjs6uQqlcw4cYaVDdJpKzQfrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 18 Sep 2023 18:00:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Message-ID: <ZQh0KXX2yLewO3uV@MacBookPdeRoger>
References: <20230915074347.94712-1-roger.pau@citrix.com>
 <e22af903-cbdf-dfed-8f69-44e5ea05ef8b@suse.com>
 <ZQhoHZvk7tXfGI2g@MacBookPdeRoger>
 <b92b994c-a9cd-10c3-033b-3c1aa752fa8e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b92b994c-a9cd-10c3-033b-3c1aa752fa8e@suse.com>
X-ClientProxiedBy: LO4P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: 35340ce1-6a77-461e-a3cd-08dbb8606bad
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BeXzWkMVE2JOB/lJd6qU6arzUAL7cI5MBle6BTL8ZkoXORrjix7E9uoeK4cmoDk469ylDwJipWbqvX7qBf4XCavOh1Mt/t9+KdENSYwTrdpAjR7SQAGGnQDXJepMKPXvoAFGUiJ7LhpuRjn5vTiSPeYugrtipKy8SzLIE5ZwAhjb6GJxkj1w5pt4KRoMFqG379TMe+Tt1gwDa3xRBKxfVEvJhnH4GwrKbI4nwA31C1o+ybaECTPKLhyd0iTyruKir+oK6Uj1pwcXoXJgRqAJdaIJEZ+b02CHbF7vnd383DaS9fpgedaTKnxCXutVBwi/E8Q0ijlm62tcFSpmRKfDmXRGjE/7Ph+BuBl3o7BP2ojjAtOF39V8PnreVUsG/qpBSHpftNFm0m26eYppfwH3Xv3CzwuiYGYPoJumNstDaL1w1T0VL+pW8E3VD77HuAYgJ5edrkIadOTcgKZ5wWbQHL9os9QIzM7o+WD/dvAEY7gtPQuajTE8jdt9s7sGi+aPUc9+zUurNILBjzzzYNpPFBejt+yx63QXmp0hhWkqiIEo1fOkxVkrw2hudZZ4RirU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(396003)(366004)(136003)(376002)(346002)(1800799009)(186009)(451199024)(2906002)(66476007)(54906003)(66556008)(66946007)(86362001)(83380400001)(33716001)(478600001)(6666004)(6512007)(6486002)(6506007)(85182001)(8676002)(8936002)(5660300002)(41300700001)(4326008)(6916009)(316002)(9686003)(53546011)(38100700002)(26005)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGZSeVZOSGpZclF0ZHlsN0taUjVKcXRVOUx0MGx4VUtWZ2N0WkhqTjhPVkVs?=
 =?utf-8?B?bzdKbWtOSXdQMmk5SWdjYkFETlc0aHd4MUdtaFhra0R5NmtkQ1M3dld0eDgx?=
 =?utf-8?B?ck5VcHhnK1JrYm01elpBaFB5U1F1Vkp2a0llVTNWU1RHODEwYVJVVlBBZnZK?=
 =?utf-8?B?SUxPZ2VhcEtiZFZPTElXU25mY3Flc3F1OEVLWmdVVGY0MTZVaHVJYUpVRmFF?=
 =?utf-8?B?V1I3Z1k5cTcvVE9rR3JPZHl5VWZBUXljUHFSYnpaeHUvYjBIb2NubGJURTVR?=
 =?utf-8?B?YjRNMm44dkxsRFF6TWlFSXhzdTRITzhrRVVJWUxTRzdRM2IwZWZPSjEzZ1Q3?=
 =?utf-8?B?clQ5Y3ZlUHk3V3FoT3ZobUkvSkg5eGl5OFBVdU9WUW9mMFBsaGVMbXZTak82?=
 =?utf-8?B?ellwZDFHbHl2YTlaZjZvL0s3SHprRlkyUy9kZU10NHd5dktmUHhwTE5ENjRn?=
 =?utf-8?B?MzkvWnU5Wm9kMStlMTZhandTWEFSVG5Gc2kydXI1aHlBcnRYazNnbXk4aEVM?=
 =?utf-8?B?YTRwdG8zV3pDRjBkSkIrTjdIUGNrUlBTaDJ0UFd1L2N0dXVpWVcxbTJDb3VS?=
 =?utf-8?B?SlhHWTR3MU9rV3RWS0RKd3d4SFZNd1lWTGRMb2s1VzQrcFpHQ29raitnR0h2?=
 =?utf-8?B?UEpHSTdKa29zeUcvVzNHNzgyL1REYmJpbjFSb1cvRmQ2VmpBTEtGSHM2aWxi?=
 =?utf-8?B?K3dwbTh0aGJSek9STmxGOVNGdUU3ekUyMEMrdVVEYnF1QlljVU9LcmtVWGt6?=
 =?utf-8?B?elBuT1VROExWdlV3ZUxTNGN5R1JQeFFqTzE0WTlBbkZLMnVHQlMwUStpN1Rt?=
 =?utf-8?B?bEpmYUExd3h2ZkpKRUsxc3hCaVJtTGh4VkNuNDRhYnZoUEZRTmtMRWgzRHhl?=
 =?utf-8?B?dHNSU3U2M1pyWjF3UkMyMG1xdGluWmFCSTdPUGRlV1VkRko5ZlpPOGtDdm5B?=
 =?utf-8?B?MDNjTHMvb080TkxxRzh4SmN3YmF2WWpJYzNNZHFFTU5yNGowcCsyYXN2RXpx?=
 =?utf-8?B?YWtTMWxxR0xJNE5KbU5KN2pvdkpEeUxSV2U0TUxpQ3oxNU84akRyZmI0WHdS?=
 =?utf-8?B?VHBYUkdsYkpwb3hXRlpWbEhmMjZLOGw4RUVxMjNkM2ZoZlVVaXhzcFBFRVJD?=
 =?utf-8?B?SzJ0cHlSOTltM2NWRmgxblhSa0ZpblpaaWgvRXNyWW5Dc2NPZXpEYmFwL28y?=
 =?utf-8?B?elArc3JaUkh5R0l2NVc0djVqY08zNkZQSXV5R0hLQ3Z1VTZRMXltWkhaWmNU?=
 =?utf-8?B?aUdaV3hMUmduamQ4VjJSSzF2WFU5NmNZT29tQ2ZaZ2piSzZaenhvejZHR2JU?=
 =?utf-8?B?VXd2Z0cxcko0Z0dJV0M0ekovSGNIZ3NYRzFpa0xjam5IaXdsNWsrZUdaQ25D?=
 =?utf-8?B?NmNPWlpHckNZS0l6akVFcWpqbFBROGRaQXQ3Y1ZCZlFjVndNQjA4QnRueHU3?=
 =?utf-8?B?SHdpSVRhdDZ3MDdCYUFaNWNNRE02UFBjU1ZwazJjZDVNSWFPT0pjVEZrTXBq?=
 =?utf-8?B?N2U2MWx3bGQvRHcreEl2eHpOekNNb2QrQzJ5WEpncUt6aTBsNnVGTXhPRXhD?=
 =?utf-8?B?RXBUbHByU1pxUzdwUHRYbmRST0FoVVNCMWdIa1F6dlg0U1JLN2tjU25kNnlH?=
 =?utf-8?B?TkpVSWEzQlZLYmJsOFRaYTV2TTFWYzNzQWlVU0tUVWpFNHRrcWVTeUNDT1B2?=
 =?utf-8?B?N3VDVkdzeVRvc09FRDhhZ1hnSHBubWdZTm4zSlhOK0czQTVpOXVpMlNYTmRB?=
 =?utf-8?B?R1VESXVIdCszeHZ5THZ2N3hUZHNsaVNsT3ZQQW5XR0tKVDJXZGRYbFp3V2RT?=
 =?utf-8?B?NnNEN0FOeWNPVENqUCtJQ1RCWjFnc2t3UUhuSlpBYjU1YmJBcUdyRlpvZzhz?=
 =?utf-8?B?eUdCVUJyeE43dG84QnhheURWeno0eDRpdDROSXJjNXZZTTh3MHludm1ReHRt?=
 =?utf-8?B?ZDF2WjZTejh5cTllMTcrd1dKL1FoRjB1WGlQK045SGNoQytFb0xiQTMyelZU?=
 =?utf-8?B?V01MTHduaXZiOVltekJlKzlPYk5SZnY1aStpNndlcW1Hd01Td0tCc0NCZDlq?=
 =?utf-8?B?OWNKTzdKbG9qcWpaekFGQmNqK1picU9lRHhHR0FjRktEckpIcGtINjduZmo0?=
 =?utf-8?Q?7C/n8frXawKVqF1p3mDk1xZmg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QuWOl7/FqACFC/5q54NHH/wK41wkClmKEDuSwJgWYo4duN+ve7fh8j1UKn4+NEbq05WF7JZFCBVY70pQ6l3oWmBZStuDgeF+ZRllAZBAUXB+WqoxhtMvdp6zSsGlcgQUpCm+fKM8OpeSGYZnpnUdFBdTZu4QywWVvpFhQSkfQZZBYonM941AF1SN6SjDNx3glQPdfqkb6AFk8aS20e4c+3o1QyDAHpSrrVHKCzoL3lDNqmvlCT4pIkm2RKgqYXcaTZAqs8FjxgTZ9eyRPmw+DZxz3pL0POLtUP1y1bNsp72ZNNnbSNueZFNNG6IsylrQVQud4GU0DLQxD5BHzHq7rZ9+V6BpGPrmynEd3rXmhVd0BuQbaAMks8kkigNllauHZ6e6Kv/o0txaLTMVrmD1Y4OMCZ6p6HEJ9zb1KUmUhvcf4gnHKOR/hG8Wu0ahc/vJTLP2fa0JO/p5XEX6tlN3lcKv+2cgESCqwzFkbZKNgGUoTw1dzWF9X6jaBTVSzO1FQnKDVWcZpNUfnmy8oCw+d+QuPdouYY/vMZ0YFZ/wFlYG6HSS+Zy8P82HFh/YDik4RMzyA5DVVspiA3mauxhMTINntUoMcUdv5eqiZqd65IzAZg+fwflkUa1zV30r7kE8KMYbw9uHrSyKBTnRdMGQkt2VAZI/gJoY7yC+3/40LnXZlBFtyRf/tCjSE2tgAzuonHWLmKluU9Iv/JWPB0CasSNY5Btxq8Ji+s12xkpsAuCizH330KYMqWmaw9CQpkgLpVH/6aRY7ODB7OPFXVeszaU3eMyU+/xXdIFYM4ymZrSsuR3RlGvIg9wyxkFUy9Ny
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35340ce1-6a77-461e-a3cd-08dbb8606bad
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 16:00:46.8604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXdcl2PWLuYrUwcBpQoCcISbxy0FucTmWMj/+4qADDMPmRJ/EvoG176UvMNMejC7QXKlXmLzxqjhQ8RpUpJQ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5655

On Mon, Sep 18, 2023 at 05:44:47PM +0200, Jan Beulich wrote:
> On 18.09.2023 17:09, Roger Pau Monné wrote:
> > On Mon, Sep 18, 2023 at 02:26:51PM +0200, Jan Beulich wrote:
> >> On 15.09.2023 09:43, Roger Pau Monne wrote:
> >>> The current logic to chose the preferred reboot method is based on the mode Xen
> >>> has been booted into, so if the box is booted from UEFI, the preferred reboot
> >>> method will be to use the ResetSystem() run time service call.
> >>>
> >>> However, that method seems to be widely untested, and quite often leads to a
> >>> result similar to:
> >>>
> >>> Hardware Dom0 shutdown: rebooting machine
> >>> ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> >>> CPU:    0
> >>> RIP:    e008:[<0000000000000017>] 0000000000000017
> >>> RFLAGS: 0000000000010202   CONTEXT: hypervisor
> >>> [...]
> >>> Xen call trace:
> >>>    [<0000000000000017>] R 0000000000000017
> >>>    [<ffff83207eff7b50>] S ffff83207eff7b50
> >>>    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
> >>>    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
> >>>    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
> >>>    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
> >>>    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
> >>>    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
> >>>    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
> >>>    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
> >>>    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> >>>
> >>> ****************************************
> >>> Panic on CPU 0:
> >>> FATAL TRAP: vector = 6 (invalid opcode)
> >>> ****************************************
> >>>
> >>> Which in most cases does lead to a reboot, however that's unreliable.
> >>>
> >>> Change the default reboot preference to prefer ACPI over UEFI if available and
> >>> not in reduced hardware mode.
> >>>
> >>> This is in line to what Linux does, so it's unlikely to cause issues on current
> >>> and future hardware, since there's a much higher chance of vendors testing
> >>> hardware with Linux rather than Xen.
> >>
> >> I certainly appreciate this as a goal. However, ...
> >>
> >>> Add a special case for one Acer model that does require being rebooted using
> >>> ResetSystem().  See Linux commit 0082517fa4bce for rationale.
> >>
> >> ... this is precisely what I'd like to avoid: Needing workarounds on spec-
> >> conforming systems.
> > 
> > I wouldn't call that platform spec-conforming when ACPI reboot doesn't
> > work reliably on it either.  I haven't been able to find a wording on
> > the UEFI specification that mandates using ResetSystem() in order to
> > reset the platform.  I've only found this wording:
> > 
> > "... then the UEFI OS Loader has taken control of the platform, and
> > EFI will not regain control of the system until the platform is reset.
> > One method of resetting the platform is through the EFI Runtime
> > Service ResetSystem()."
> > 
> > And this reads to me as a mere indication that one option is to use
> > ResetSystem(), but that there are likely other platform specific reset
> > methods that are suitable to be used for OSes and still be compliant
> > with the UEFI spec.
> 
> See my reference to ia64.

Right, I understand that on ia64 things might have been different, due
to the platform lacking any other reboot method, but I don't see how
this applies to x86 where there are other reboot methods.

> With ACPI_FADT_RESET_REGISTER not set, I don't
> think there would have been any other non-custom reboot method there. So
> while perhaps not mandated, it's still the designated abstraction layer.

Again the spec doesn't mention that ResetSystem() must be used, so
while it would make sense if it was reliable, it clearly isn't.  In
which case resorting to the more reliable method should always be
preferred, specially if the spec is so lax as to call ResetSystem()
"One method of resetting the platform".

We should also take into account that vendors are much more likely to
test new hardware with Linux rather than Xen, and hence it's low
probability that the default Linux reboot method doesn't work on a
platform, because that would hurt the vendor.

> >>> --- a/xen/arch/x86/shutdown.c
> >>> +++ b/xen/arch/x86/shutdown.c
> >>> @@ -150,19 +150,20 @@ static void default_reboot_type(void)
> >>>  
> >>>      if ( xen_guest )
> >>>          reboot_type = BOOT_XEN;
> >>> +    else if ( !acpi_disabled && !acpi_gbl_reduced_hardware )
> >>> +        reboot_type = BOOT_ACPI;
> >>>      else if ( efi_enabled(EFI_RS) )
> >>>          reboot_type = BOOT_EFI;
> >>> -    else if ( acpi_disabled )
> >>> -        reboot_type = BOOT_KBD;
> >>>      else
> >>> -        reboot_type = BOOT_ACPI;
> >>> +        reboot_type = BOOT_KBD;
> >>>  }
> >>>  
> >>>  static int __init cf_check override_reboot(const struct dmi_system_id *d)
> >>>  {
> >>>      enum reboot_type type = (long)d->driver_data;
> >>>  
> >>> -    if ( type == BOOT_ACPI && acpi_disabled )
> >>> +    if ( (type == BOOT_ACPI && acpi_disabled) ||
> >>> +         (type == BOOT_EFI && !efi_enabled(EFI_RS)) )
> >>>          type = BOOT_KBD;
> >>
> >> I guess I don't follow this adjustment: Why would we fall back to KBD
> >> first thing? Wouldn't it make sense to try ACPI first if EFI cannot
> >> be used?
> > 
> > This is IMO a weird corner case, we have a explicit request to use one
> > reboot method, but we cannot do so because the component is disabled.
> > I've assumed that falling back to KBD was the safest option.
> > 
> > For example if we have to explicitly reboot using UEFI it's likely
> > because ACPI (the proposed default method) is not suitable, and hence
> > falling back to ACPI here won't help.
> 
> Perhaps, but falling back to KBD isn't necessarily going to work either.
> And it might well be that on said Acer no reboot method would actually
> yield consistent behavior, except for ResetSystem(). The fallback logic
> here as well as that in machine_restart() is all based on guesswork
> anyway.

Indeed, hence it seemed a suitable and less risky option to fallback
to KBD in both cases.

Thanks, Roger.


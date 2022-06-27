Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4855B55B95D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 13:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356502.584750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5n2Q-0006yx-89; Mon, 27 Jun 2022 11:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356502.584750; Mon, 27 Jun 2022 11:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5n2Q-0006vl-4J; Mon, 27 Jun 2022 11:36:18 +0000
Received: by outflank-mailman (input) for mailman id 356502;
 Mon, 27 Jun 2022 11:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVBH=XC=citrix.com=prvs=1703a0240=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o5n2N-0006s5-T7
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 11:36:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 589502bc-f60d-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 13:36:14 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 07:36:07 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH7PR03MB6864.namprd03.prod.outlook.com (2603:10b6:510:155::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Mon, 27 Jun
 2022 11:36:03 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 11:36:03 +0000
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
X-Inumbo-ID: 589502bc-f60d-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656329773;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sLnEsSn9N6tQX12uZfjf7qDq+SwWi58qpFw6JowZJ4I=;
  b=OvNNg3EPaw/KDqluYJ/xIPg+X6DDM/9XB8RGZQ4vSJdwUhqOw2q3jg1s
   WseOODdRS+4znvWX9XoZKLiHaQODgWxZoW0UrP1bYNPG+ufz4ZnrN/+Wb
   IiMjh5CnwOl0P664eQE3/vXCbVPkZNg7dqgTnQ9je9h84gXvm33urgg7X
   8=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 77053822
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Qsnmi64QHcIRwEIFoZjrgwxRtM7GchMFZxGqfqrLsTDasY5as4F+v
 jMaWj2DMvuKMGD9fot3PY/j9kwC6pfczNBiSVdprXsyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjXFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSKDisnM42UoN1HeB9YFnwkba5cxOfYdC3XXcy7lyUqclPK6tA3VgQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YHgl/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IH8A/O9fBti4TV5BBP7oHKAsLVQ/mlT+hngUOZ4
 Tzf2V2sV3n2M/Tak1Jp6EmEhODVmjjgcJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8ywSEAmkJSBZRZdpgs9U5LRQg2
 0WVhdrvCXpquaeMVHOG3r6OqHW5Pi19BVEFYSgIXA4U+e7JqYs4jg/MZtt7GavzhdrwcRnyy
 T2XqCk1h50IkNUGka68+DjvnDaEtpXPCAkv6W3/XG2/5wd9TIegbp6v7x7Q6vMoEWqCZlyIv
 XxBkc7O6ukLVMuJjHbUH7tLG6y17fGYNjGamURoA5Qq6zWq/TikYJxU5zZ9YkxuN67oZAPUX
 aMagisJjLc7AZdgRfYfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:gVa79q98LqcqFwBpagduk+FDdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 X525RT5c9zp/AtHNJA7cc6ML+K4z/2MGXxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.92,226,1650945600"; 
   d="scan'208";a="77053822"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCv09sCFd8/5jgLpNBQ8O4XfExKn3R+6e8vSvf1C4G67eEidnw32iEG0F6BV4yLwNPFk9a5zdoPm/WKPnEH6PYznJiJ4X8EgrtevsbyCR7dNpnm7N1FDBLjcNFoOIJ1ex+y7FFcBJzCSPpEIqs5R48yBGzOfSGp/tIe44Yiz75gjxqp4AjpLBlQ78cj7nKxV/OL7OCIRIUgh3lnv47s5OSf9XTfXQxLDcIWdnKhVjzTr5t6FmfHZrelSfUkWQcCLvwZHeVkpdLbsOJgX3nSSzxUfM4yM26YAJcgxAlTC0eehfnvYhvukq07hOrhI5u86cMd9QDCpjF1ycPbSOnzEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5j/HxpLkNcop0QKCe8dQZoWa0FXAWdea4btaSz7mTzQ=;
 b=J4vygAGUTlqfGoYj25Y7O69b6jijbkGMU9NzqZo6004kCKQ46CJwn1ApEf0KZ14bFJVTe1j45pq78h9mCF/dRSTQ0Pypz3AUa5LH6AKKYxGBpDT0lw3pCeAPJglJpV9gvTjkW7b1XLMzpvzMxhG9Q8ql6CXMmkMg39KozTgiMSo+gl587dCT8718dTGm//1jwWdOm+9a6KUM4zb36UU/fgXSQHDLo3GRO6tHs/1PeIGGPO1qdXUVJS7bsZBr1xeFjaUt8ZKyAlHoCenrlcc0jHPa9GOw0Mj8aKDAVLF+IeH2ZWO0/o4r7CDx5U0XZ+NndfQ9uNpehnHfd+ToowsVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j/HxpLkNcop0QKCe8dQZoWa0FXAWdea4btaSz7mTzQ=;
 b=A1Zz580kJO+5lotFeExeze49/AyjN0Vz+iRnRviOZ4l0GqD+fzYSgJXQlW5jeXHSkmL50IeR1HvHfhtiAhmwVK1TKwSg/eLVwvmMNIqaYXnXhh855M09LOuVe+jTO0Kcg1hcCZRUsj+WKMooxUn/AGTo+uImKz05tdhsBi18qK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Jun 2022 13:35:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v6 1/9] xen: move do_vcpu_op() to arch specific code
Message-ID: <YrmWHrqwJOnb0iPr@Air-de-Roger>
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-2-jgross@suse.com>
 <YrmGQj/W7KTzJ1vo@Air-de-Roger>
 <8951e03f-ba63-4524-99e9-c030e273c1d1@suse.com>
 <YrmOQPQlbAMwULWc@Air-de-Roger>
 <e0b54db4-af1a-fb54-e6e5-ef0b71194091@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0b54db4-af1a-fb54-e6e5-ef0b71194091@suse.com>
X-ClientProxiedBy: LO2P265CA0301.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a2ecd6-8763-4180-4073-08da58313776
X-MS-TrafficTypeDiagnostic: PH7PR03MB6864:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UTIjwhof/KzBDpNj+pqP8udriPYOXnPsAnu4iW+NYNYGHAIRa2bS0rZmMHhDAVVlts8Q7LBKuys85Pr4yApf+KkERTKzGC6Y2CV8gUbVmTAaeToBoMuFkXya/JFaFHEXRfmD+ws0HX3vKQoh0ameg/iTpxE+WmnkDu31Xnmyk+RmJL6E73IPUQ0g/KFPjyjhGRmQMDkWlRKeYoeAGXtHPB8WA+OYvQGHBzo+4M/plwro/enqurtxcJ23MCQUS35o8ouV7E5Pp5L58a2Wl/i1YOyDVmJjr6u00bhfhhbo0E0dzSaO1LbMf9KepS+IbLq170licGEsocFeSQI4KdBUWnzZPfyi3mMNJgZMKwNNwyEoOtOC/Me+J585eEdA00FcOjvX9PjDw1jy2bWS1Rbjo6BcLPO18NWmb+AtcjyCsxXduxnMIGX7WTXRYRvUJ5zVdiw0YGMLBbkrKKUs0GVVqJxjJ2dRinzEvVAqpTXEFkRCH8L5G9ck2qsFB5fN8rINGCWTh+KCUelt5aGy2rhMQ9Q5ZUNh8Khs0gyyee8UGYyw2fY0P+T1tbRiwAW/yjs19FVyTd096adpL9ZR6siAIOO8yjf5ah3XcApnfDai2MlimEMCqXyfs2zIOG52V4dacHKiWN+IZ8+I6piHSoEgM6GJ9ZTZl6gBVXmMan421V0t3jHA77QqbXp1V6bWd6ekT1HtErktjid26+AteqRmaEawBrfVOY4MKudfTv1VuQbxicYfeJSwFr8aBBg2wQtl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(186003)(9686003)(6506007)(66476007)(478600001)(66946007)(33716001)(86362001)(6666004)(26005)(54906003)(53546011)(6916009)(41300700001)(8936002)(5660300002)(8676002)(66556008)(316002)(82960400001)(38100700002)(6486002)(2906002)(4326008)(6512007)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3hQemNCZWtXREQzM2FkV2ZKQkJRVVlmbFVnZnJZNk1TVGt2WjFEaGVrdWdX?=
 =?utf-8?B?M1hNeU4zTFNwY3RhRjZsbUM0SGI5K2htcThuMmxaQTVaRVBoWG93TGpVTlNv?=
 =?utf-8?B?Y1h3aUxMUlJDRmFrenFkeVhZYnEwZk5IVThQNWU0RStqaWdTZGthdisyNXpi?=
 =?utf-8?B?bDl0NG45dTdCU2NsMFpTTVVERzlTU0s2N2ZuZ292aDdRUGU5YWk2ZUpFZjFa?=
 =?utf-8?B?aHBSb0JPeDhab2dHNEd1aFFTL1NKc1d2ZnRadkNFRzJVQXNIanJhUlA4M0dO?=
 =?utf-8?B?RUxHazNrTGcreTc3SFVpcjRkZHJHY3ljcERtMzhNNElSU0ZtV2o0em5YNTNI?=
 =?utf-8?B?R0ZPWFpNaERGdERwZllxaGJyMEhDeHlaWVl4QnJhT0VVbE04bmp5VHBLbWp2?=
 =?utf-8?B?WlpjQ2tBcHNybHFrVFUwenlzVFY4dkVIYUs2cnl0emtUZStiMUxXOVhEM0px?=
 =?utf-8?B?OUFBZzBZWWEvdEdLWkpIQ0tuVFRIcXl0b1prNjhibmhmcHpMT01Va0dLS1hE?=
 =?utf-8?B?NStqZGc5U084VW5KREZLZ2txZUFnVWtiYStEeE1ZWDBrUlhQSEJDYUw2ZHBk?=
 =?utf-8?B?UktVWnRLeDVKOUZUakdGRlFGOGxsSDRYNnY5Y3NIQWJHcUZlVFhsdkM5WU84?=
 =?utf-8?B?ajhReXA0eFdieXM5UkNoKzBBMkNweVBvelNLQXRyMmpnOFR5REZsU1Z5aVJQ?=
 =?utf-8?B?ZUZpQnVERnIxam1vdWJiMnF0QzR2czNvcWNaZmY0UnQ1Uk0wWkIyakozZEtx?=
 =?utf-8?B?WXJ4TFdXTFVOaU9MY1ljdVQ0Uit3RXkwMGtOekk0ckhJbVpKV0xpclhNNjhP?=
 =?utf-8?B?Wk9WdndyTktxdDFnY3FnL29rTERpVUlJRVNXL085TFNTWm9WQ296S2Z2S0Zx?=
 =?utf-8?B?WW94Sjg0b0xWbUJTSkRTbUsrMERNc0pTWFREUkNJU0VsNnJMUUdVbnVKUVpL?=
 =?utf-8?B?azZ6cjhTb0lpSnFDUitiSDBXMk5HUUhnQkg3RnplYTJFeTJaeXRHbDhldDhu?=
 =?utf-8?B?bEZVYkRYUVovOW9yTmg5U3pxblNDVU56SGxTMkJLSk0wRkUzc0xtbjZtcHVm?=
 =?utf-8?B?eVg0SkVrbmRGaGc5Q3ZRMDZ0YU1YTU9GRklkZW8yRXhaalQwbjFTVWlmUXVR?=
 =?utf-8?B?QU5WWnIrUHBhblVBY2k2ZGdxc0VOOEt3ajA3WkdMSTRxblM3RGllaVEzMUxJ?=
 =?utf-8?B?VWpwZWo5V2pSMGg4a1NyWGM0QWRXSFhQM1pCMUNpRVRXbXllTVlxNnEyTDQ3?=
 =?utf-8?B?RDdOazcwVlVNbGVzUXZ0Tm9Vdlo3cjhEUTJNNjlJaWk2Wmt5SXBDQ29rUWpF?=
 =?utf-8?B?RXZSMXpqYXNaTDJ1aWZlQkE5b0ZEUmg1SDNSOS82L3R5MmNLa3EwWk1wZ25h?=
 =?utf-8?B?ZFVmc0w4TDFmSXZNelBsdnA1eHFDNmVRblJrTjVpUjBlRkJkNTUyZGpCNDNG?=
 =?utf-8?B?d0x4ckptekFSRUltSVI2WTR5V211UytDZm16VVY1MWNoTEdHYlBtbEk3V2tm?=
 =?utf-8?B?bnJuYmN1am9VcVk4V2xZWGRLczl5TWd4OFNpUVRpekpwbjNLWU1WelFTT1R3?=
 =?utf-8?B?aXN5T2tPZlhDVmtoWkg3NDRUUnRvbkxZSjJ1WVpjNm85R1dqa1YzOWdHZS9j?=
 =?utf-8?B?Ymc2YTdFRW9UemFVWTR2WWJBaU52MEcyaDFjbTRxNVVoT0Y0TEVXaW93S2l6?=
 =?utf-8?B?S1M1NTlONytLMXlzY0hiSEJzUG0yNkZVcVJxbHpFS1gvNlNqY0FuY2I5TkUz?=
 =?utf-8?B?TlQzbzd1Nld1YURNdk9pK2c5bE1xeTdkM3NxbzVvYVpSb0VyN1VlSEt0MHFQ?=
 =?utf-8?B?OGJOVEg0T2k1SmR6L08yTW5GOCtTMFhnamlYb3M2Q3Rjcm1ZNHlGOElVc2N4?=
 =?utf-8?B?YjVDVkVZeHpiLzZRV2FCN2tiS0FtcWxsbWJFbEJxTEZkWUtLVHZ6OTl0cWp6?=
 =?utf-8?B?bTB0N3k1VUE0eEJkQUNUNTJ2MXRpM2VvMXRxUG0yMXlxMXEvREFSZGtEeXQw?=
 =?utf-8?B?QXcxVTJDanBRYUExZ2MrbjR4dFpwRi9NQjNDVHN4Z01hVDVBRGg4M042NXRr?=
 =?utf-8?B?WGRMSldZTXExREdyNzF1MndYVFJEMVBCdEZIVkZPMmE0dUZieEQ1azRCNHBu?=
 =?utf-8?Q?Qvy9v2diB+figxUbIE9EAlozu?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a2ecd6-8763-4180-4073-08da58313776
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 11:36:03.5685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUwcQKDP9acln9jMo0S2EH+Zqdfs44+IyhaLS+EdP5l0vm7apc6q7htlctzszlcNDZTG5FuKfVID20e94o2zew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6864

On Mon, Jun 27, 2022 at 01:08:11PM +0200, Juergen Gross wrote:
> On 27.06.22 13:02, Roger Pau Monné wrote:
> > On Mon, Jun 27, 2022 at 12:40:41PM +0200, Juergen Gross wrote:
> > > On 27.06.22 12:28, Roger Pau Monné wrote:
> > > > On Thu, Mar 24, 2022 at 03:01:31PM +0100, Juergen Gross wrote:
> > > > > The entry point used for the vcpu_op hypercall on Arm is different
> > > > > from the one on x86 today, as some of the common sub-ops are not
> > > > > supported on Arm. The Arm specific handler filters out the not
> > > > > supported sub-ops and then calls the common handler. This leads to the
> > > > > weird call hierarchy:
> > > > > 
> > > > >     do_arm_vcpu_op()
> > > > >       do_vcpu_op()
> > > > >         arch_do_vcpu_op()
> > > > > 
> > > > > Clean this up by renaming do_vcpu_op() to common_vcpu_op() and
> > > > > arch_do_vcpu_op() in each architecture to do_vcpu_op(). This way one
> > > > > of above calls can be avoided without restricting any potential
> > > > > future use of common sub-ops for Arm.
> > > > 
> > > > Wouldn't it be more natural to have do_vcpu_op() contain the common
> > > > code (AFAICT handlers for
> > > > VCPUOP_register_{vcpu_info,runstate_memory_area}) and then everything
> > > > else handled by the x86 arch_do_vcpu_op() handler?
> > > > 
> > > > I find the common prefix misleading, as not all the VCPUOP hypercalls
> > > > are available to all the architectures.
> > > 
> > > This would end up in Arm suddenly supporting the sub-ops it doesn't
> > > (want to) support today. Otherwise it would make no sense that Arm has
> > > a dedicated entry for this hypercall.
> > 
> > My preference would be for a common do_vcpu_op() that just contains
> > handlers for VCPUOP_register_{vcpu_info,runstate_memory_area} and then
> > an empty arch_ handler for Arm, and everything else moved to the x86
> > arch_ handler.  That obviously implies some code churn, but results in
> > a cleaner implementation IMO.
> 
> I'd be fine with that.
> 
> I did it in V2 of the (then secret) series, and Jan replied:
> 
>   I'm afraid I don't agree with this movement. I could see things getting
>   moved that are purely PV (on the assumption that no new PV ports will
>   appear), but anything that's also usable by PVH / HVM ought to be usable
>   in principle also by Arm or other PV-free ports.

I see. My opinion is that when other ports need those functions they
should be pulled out of arch code into common code, until then it just
adds confusion to have them in common code.

I will take a look at the current patch, as we need to make progress
on this.

Thanks, Roger.


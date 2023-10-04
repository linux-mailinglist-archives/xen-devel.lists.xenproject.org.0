Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C27B8125
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612582.952547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo26D-0004gu-Gj; Wed, 04 Oct 2023 13:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612582.952547; Wed, 04 Oct 2023 13:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo26D-0004eR-C2; Wed, 04 Oct 2023 13:39:37 +0000
Received: by outflank-mailman (input) for mailman id 612582;
 Wed, 04 Oct 2023 13:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8y1=FS=citrix.com=prvs=634504905=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qo26B-0004eL-HT
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 13:39:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7136f039-62bb-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 15:39:31 +0200 (CEST)
Received: from mail-mw2nam04lp2175.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 09:39:25 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB4982.namprd03.prod.outlook.com (2603:10b6:a03:1f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Wed, 4 Oct
 2023 13:39:23 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 13:39:21 +0000
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
X-Inumbo-ID: 7136f039-62bb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696426771;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Apm3UCvnhUV2PFaMvCP6ClhDtGz/jG6HYQmlSaGvk2g=;
  b=Prs2HQvi35CvR9RlEb5/L+0MMNhIKavrRF2e0OwcldUcdFmWaBGbGgr/
   X8n8/gsbLmWK/i0f4KhbMSLLAhjk9pmM/7TXPVEsa6h9MtFiJTi4jdr7W
   ICxoGS00/rF+QknsWnkC5ejYlmK0kQa1f7vCK4HJL/YEfpdu49UjpUbpT
   Y=;
X-CSE-ConnectionGUID: 8IkLGbLZRa63aSBlaPUFKg==
X-CSE-MsgGUID: xXet+z5aR+O31cmPJrpb4w==
X-IronPort-RemoteIP: 104.47.73.175
X-IronPort-MID: 123860890
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:vHe75Ky6NdsVPQOzmiZ6t+ehxyrEfRIJ4+MujC+fZmUNrF6WrkUDz
 GEcWmnUa/3fYDfzc98jYd/j/UJU6JOHm99rGQM5/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmPawT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTFv9
 tg3IhQ/VBnd3OuN6rayctRCpct2eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVMsuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WUzX2jCNNKfFG+3u5ajUHQ1DEaMl4xDgKwpMGbkFa0B80Kf
 iT4/QJr98De7neDTMT5XhC+iG6JuFgbQdU4O+A65QTO2qfSywPEHi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adhNDvBSv5x
 TzMqSEknqgSluYCzaD99lfC6xqSoZzOQh8w9x/gdGuv5QNkZ6aof4Wtr1Pc6J5oK4KUTUKIu
 nQerNSP9+AFDZyLlyulTf0EGfei4PPtDdHHqVtmHp1k8iv3/XemJdxU+GsnexovNdsYczj0Z
 kOVoRlW+JJYIHqta+lwfp61DMMpi6PnELwJS8zpUzaHWbApHCfvwc2kTRf4M7zF+KT0rZwCB
 A==
IronPort-HdrOrdr: A9a23:IMYE4aG/QYqSmojbpLqE18eALOsnbusQ8zAXPhZKOH5om62j5r
 iTdZEgvyMc5wxhPE3I9erwXpVoIkmzyXcW2/h1AV7KZmCP01dASrsD0WLM+UyCJ8SUzJ876U
 4PSdkGNDQyNzRHZATBjTVQ3+xO/DBPysGVuds=
X-Talos-CUID: 9a23:TiTNoW9DvguvqCHxeliVvx41GeQKeFnv9n6OeEaDI2JgcIC7alDFrQ==
X-Talos-MUID: 9a23:ppNKdgbCpIsU+OBTpw/hmHJwac5SoIP1UUsIqbcco8PYKnkl
X-IronPort-AV: E=Sophos;i="6.03,200,1694750400"; 
   d="scan'208";a="123860890"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPmgXIRr77/GManq4M/+rEIAejA9MhcIHcJUHF/lTZrrFYvokigBN20HLm8Iv9shUT5E86Az0+nN0iweD8/2376RVqwGbdk3hONxioHpY4Nprm4cEHOd3j3KYpuX8NnomKrUF7JkORMs+vKqYjI7coGSENgIGn6yO9I/a3zm5IY6FxaY2F30znqy8Q/9UUmhMNOmDayg9UkhM0EUuoQGrTkzEta7UZIY6prx1LyXemetEfVv2nkB6o5OOjbVDGWQSdDnsvswYMH+G2JMQAICBvN9LBkO2rsMNS3egMBVVMJ3mNyAPJw+5iTaLFTsFwSxdUX3BiOEbLFJ6k08Y1yuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QiJSPwtPgu9Rc9sZEOFYFdzftKCqQS+Q+S3fvi+Wog=;
 b=GGBLQN26J+QjaWKcQ6pIM2eWoThRJKsU4LpZlih2BLVtt24df4wXb70+Ui5vRY8IikX71ZpVJVGRTUHSZHwTojEJeEeu4N7hnhGyWmVrmBlxhyUB6nr0bwsjXxIzsTanUQwZ50HqjQsxyN2oYlKX6XRTxcFspChJGBL4Qw0Ip91ogiSMXIgrMjbZLRE0WfhrkT0OyJ35+NByWmZIVi/e5YQzz+fcYDy3oW42/5TZyKwxFnB5Uk3eyFAlfZTKmH+eYvcXy+w9ls0DRQRQpWQ9lmhcJSEoDS9lptKYa+yZNiOwLzi/LWQ+lPBYhmWDyJHDugmTxtXvfeCa1sOTDyUinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QiJSPwtPgu9Rc9sZEOFYFdzftKCqQS+Q+S3fvi+Wog=;
 b=PLiOP/z1CfJhndjpSLdwT3m++/N42Q9bdiiFaVChTX1sp5V65kiQlW93rjEeJRGYMhhDfGKMFs3CLDF28XcfzUeiR3euiqMTkQYLg5Upqhh41P4y5b9jYqFhMdHiZTaig1kf1oStc/5+YePYAasyRcQjncTnnzFcjkXdnGbTLiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Oct 2023 15:39:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
 <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
 <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
X-ClientProxiedBy: LO2P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::33) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d99495-d27d-4e28-ae3a-08dbc4df50bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sKYhHaloX/ncvS4BAuOzvcDbyNMtQZ07M3O5SGRatRurNpoKttF9HMw6Vo+T8w9NoQ4A1shE0g6w83UzEt8jsPccZ4FqzQ53nWAgmkDeKyIzWZC96DkyEenWa+4cocYfTSfuaTFF8Y5RYsOJu7ilosSPBagxIgkkGdDTc+v6qKY45GHkl7Rr+C822YjPgDri0FMLybgC1Rc4St+V8PXEXiFYArW3/tNWNLCMMYHRzKFvR1Vy5f/kY8nC3sMoCc8A0OUOiLFjfN7LgzBijmtX8eD5zepKVnWZrXOv9k3eIjqGIAKImibnmfCXFK8pNS1hockgMw9ekeMVZbwcR3r8uYNcGEsly9cigrAlF1R6Z/5apuPiEwhMStxD0j4zqPag8s9pMhnaDNwIs2VgiqC7ucR5f1S92UDdgh963YNoBdfa57MdgHBlaJ2IrvJFNKeb3nmGAkiAWEhH4/+9qyqlcqxahy6N0LGb4kknGJPADkVJbqcA06krkYy/b3jh7znkhVqNK/4s+klYJUIu8OaOlrb2bWlF4fCeE1R4+8ZMV17z//I+DtmcBzy5ijDlah9G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(39860400002)(396003)(366004)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(26005)(6512007)(9686003)(83380400001)(82960400001)(86362001)(33716001)(85182001)(38100700002)(66556008)(66476007)(478600001)(316002)(6916009)(54906003)(66946007)(5660300002)(6486002)(41300700001)(8936002)(4326008)(6506007)(6666004)(8676002)(53546011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzBNMk50Z1Z5WFpqNllSOXNoV0VkSEZWR1RSV0h5WStNU2RWNUl3T3M1M0Fl?=
 =?utf-8?B?NXBVM1kvbGRkaDdnQ1k2Y0FPU25MQWphQysxNTY5R0hIajhIaUZKSmVZTi9T?=
 =?utf-8?B?eWdQaHhBVkFYSzVEWU1MSldBK3pHN3lHYldZK3NIMjd3SkZzeEFrTnFRRlpt?=
 =?utf-8?B?VjRjU1FDU0ttSWh5ditzcWxKbU0xYWE1cVNZcER4M01UNmY1NnlrN1cxZ21M?=
 =?utf-8?B?MlI4QStvNk5WMkd6NHJUdkxuTHYrM21jaER5UmoyOUE2dllDN3JRRS9lTnNF?=
 =?utf-8?B?b0Qyejl2ODJ2a1VDcSs3bm1YcWI0N0RXSlNoeHNVSHBVOWhGQTduWXpVSzBt?=
 =?utf-8?B?cVFXTWViT2JYbXNkekx1NnhMeFp6eUE4Q0I5S25WeTgzYlBuN0xTVndTQ2lT?=
 =?utf-8?B?WnNhTnd5L2F5d0tTTHVYaUlUWXIzMmtQS3k5VnZvRktzdmQ1dzFrWklxbDBW?=
 =?utf-8?B?RVJLWnNHOUxsLzEzdXdOTWlCSEN1VFdRTGZJNTZReVJnWGROVURCNFdlbXBO?=
 =?utf-8?B?RnE3T1dxT3ViNTlsMjBSWnJ0VnJTYTMyWVZDcGdNWS9QUjN6dUdSV1NVeTJS?=
 =?utf-8?B?K0JDVUdvWkdJT25BR1ZBaXJmQnVZeTJnSFNja3VueW1Rb3RRNmsyQ0pKYU90?=
 =?utf-8?B?dTY2Y1hubzQ4Z25tNnAxWm1rdXFMWDljbHY0V1ZVUzF5c2M4YnBDS2VuSS9B?=
 =?utf-8?B?b0Ruc1R2bGl6dW1sMXVlSk8vZE16VXZaL0VSLzVnU25QTTVpTktDYnprMDdJ?=
 =?utf-8?B?UlZyV3krRE84RVN0YWU4anI4Z1VFcGhqTDRvRWJLcURKWXdLSnE5M3RyOXpu?=
 =?utf-8?B?ZFZiMG8xK1BDazFSUEttUFl1Wjk5TERTaS9KVm50bUd3aC9MYnVDNzVHdnJN?=
 =?utf-8?B?NlF2bVVoK0o5NjEyTUovYlMzY3E3cjRzc0NoOWhNZDFrUGgwYnV1RndyMFJt?=
 =?utf-8?B?L1QxYXg2U1VXVzBXaS92d2VYa1VFY2RjekNoQzBldUttQ3lLMHBDY0dwdUZM?=
 =?utf-8?B?LzB4cTR6dVREQzlQSENZcG9ZQmowQnpBVTkxM1p3T0o1T215YmtYeE4zdHVK?=
 =?utf-8?B?Wjd0dzZXalcrbnI4bEhodjF0eHUxa2ZQRGNvL1d1OXMzMCt5NFluWnJYbm5p?=
 =?utf-8?B?Z0pBVW1NVlhSdCs4aWh0b25QbFBySEM5Sjl2eTBOSU53NEZlU3pTZUtWMk9V?=
 =?utf-8?B?c3F6OWxjR3loYmRIb2ZFamJYMURLOXpvd2hkZWpJenJoOGhUak8zOVdUSFVx?=
 =?utf-8?B?YjBxMGtTai9OSjh4d0luSCs0c0pKNTNocnRKb0xGU25Ga3V3UjFWNHFtTUgy?=
 =?utf-8?B?WUNMV1NQWnEyZ0hyTDdoNzFuaHRUWmVCbHk0Nm9NOFRkY3dTbURVYU5nc25h?=
 =?utf-8?B?QUxCOGdFdE5wOHZWRTA3Z29BSDMrbC9WdXJuaTZqTFR0S3NweENmaVRpYUFs?=
 =?utf-8?B?bDg5TEs2ZDVXbGt1QWYzcTNEeGxsNVVaL3ZMS09aQmhwQmJtTmIrQnRzeXNP?=
 =?utf-8?B?ZjRjbDUyckRtNGd0UzBuZVM2QjhoN3QvZUdDMk04KzlERzhRUU1nSW0vaGg3?=
 =?utf-8?B?b2xpTWgxNXZnYUxHWDg2NlBRYTQwTUhXZzFZazJOUklwMmVyQndCRmZqN1la?=
 =?utf-8?B?amE0Q0d1N3VJQ1VpQ21acS95MHMwVm9pQ2c2VUJFL0xOZXV2WkhGNXRFMEpv?=
 =?utf-8?B?Nlh2a0tiSktZN3BWSkJQbmx2VVlHT094SVZFRTY4WkplTFZ2ZXNBeVVzMDUw?=
 =?utf-8?B?b09jSW8yZ1ZVNVJERlFML3ZOblRkaytXL0ZQYjBaUERKa1p2TmxzUWZtRk04?=
 =?utf-8?B?d3diK2d2VFNsTjVkako3WHRCWWQ5WHZsTzNvcWs3eTcxbE92K3EyN2F3dVgz?=
 =?utf-8?B?S29ub2YwbWNJdEJ0SXZibGZYSExWM0x5b3hjaVpHVUJkQkNldlExRmptc0Vm?=
 =?utf-8?B?Nzc4TVFmaVFQMVhyaXBxMGk4b1lkNVZnTFV5ZXpxa0srMUhrQTRQa0hMRjdu?=
 =?utf-8?B?SmVDR1lYS3phcERqRDU1bFVpTUtGaERWZThyaHhTVUgyaXNPSGxkb2FjN0J0?=
 =?utf-8?B?OUlrVHhJbmFLREc4dG9wajZmOEpsbk9PUGVUeEdDVHlaZXloQ2c3bDhFL2Jh?=
 =?utf-8?B?UG9SaHQ2OFVwZC9lME5wdStBQVFFSHduSGk1ZGROME5RR3huUU5TazMrb1c4?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WIea8fvTsDFp8euzNhhmdm5WfbGm0BQhxO+3s/Cgv9jhv52mth90snta/LvXHmhAUYEllpWTiRll/cDmkt4ZOSso4dpdLJgCyynuonhXqCYQyvkb4IX3SyXKmSUW546A9brLn0pluAHSbqjlpbGt3yLYh/fjkDssZv9EZCVFzyA3rL7198fWkE53b2ew+ek9nr2LxosAnqTJXrIpjAp2yqflPTzYysms6EkaxCxuy+A3/29K7ioin5sMAEJJZFgLwaSccM9dT7sqsl27ASC9FdSzqyyPTMMNRNUCc1uTQoAVBOJ4Dl8v0wbF/LiDac+JMTUkQWqQSJNYAHKxU7rjGR4JidGj0qpDVmXoGVYOudnpbEKU9ZmiKUnj/ktW0enrN9h0nh2sh+Cu6qT160camzWVEIPZEQe9C5V6dTFNuDeFdz/g4c0y5sEb45gQbuhHaiejICCfirYYPii1WJpbrhcmtIPoVAw4OuQJ3C5rmzKTEL0uVbccH1jKu35qQtbn07R+plgWhKygWsUUcqNJA84mJnFt/1QWUGd6sTp0ukCQSI+bChjKRU0YM1zNejxTTGxGl7Mu+EcV9cEMnzIlQW9pETTx5IobGqokcTRmBkCDJfUX8cmMymYg8E20ctG5OOmc8RBmCq119eyIEr6+IoyyE4WTVNRKkmu+HPsPgDEXZUJ2YrrSHmfoYuBquqCWXT0YQ5dcGYiSjl2Y609+KuflwBD+8vRms6USZm2+phcF1VdVjxKvHXFpejlb+/oW1TmshtpGMpbnZlIIh+hdcbGBA+tlXr38T1WjmQb9E2OJXed/79dtsL4CNbqCjlLZiX3mO0hPoz7lznino5Jkq1+YImOdTRsAW+/keDEcyqgAV2v5QTPl6AYEx/zdBY0HNQFDP1J1zQni+XYXIbE1Gg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d99495-d27d-4e28-ae3a-08dbc4df50bc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 13:39:21.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZi83nPR7qZoyYhQsXS/J+7EMtIvO+Vjiaa7OgeHfrf8ns37hW/3HlbLRz1GS6KsZTiFqRxbUYlFujnRp9mwJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4982

On Wed, Oct 04, 2023 at 02:03:43PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 04/10/2023 13:53, Roger Pau Monné wrote:
> > On Wed, Oct 04, 2023 at 11:55:05AM +0100, Julien Grall wrote:
> > > Hi Roger,
> > > 
> > > On 04/10/2023 09:13, Roger Pau Monné wrote:
> > > > On Tue, Oct 03, 2023 at 12:18:35PM -0700, Elliott Mitchell wrote:
> > > > > On Tue, Oct 03, 2023 at 10:26:28AM +0200, Roger Pau Monné wrote:
> > > > > > On Thu, Sep 28, 2023 at 07:49:18PM -0700, Elliott Mitchell wrote:
> > > > > > > I'm trying to get FreeBSD/ARM operational on Xen/ARM.  Current issue is
> > > > > > > the changes with the handling of the shared information page appear to
> > > > > > > have broken things for me.
> > > > > > > 
> > > > > > > With a pre-4.17 build of Xen/ARM things worked fine.  Yet with a build
> > > > > > > of the 4.17 release, mapping the shared information page doesn't work.
> > > > > > 
> > > > > > This is due to 71320946d5edf AFAICT.
> > > > > 
> > > > > Yes.  While the -EBUSY line may be the one triggering, I'm unsure why.
> > > > > This seems a fairly reasonable change, so I had no intention of asking
> > > > > for a revert (which likely would have been rejected).  There is also a
> > > > > real possibility the -EBUSY comes from elsewhere.  Could also be
> > > > > 71320946d5edf caused a bug elsewhere to be exposed.
> > > > 
> > > > A good way to know would be to attempt to revert 71320946d5edf and see
> > > > if that fixes your issue.
> > > > 
> > > > Alternatively you can try (or similar):
> > > > 
> > > > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > > > index 6ccffeaea57d..105ef3faecfd 100644
> > > > --- a/xen/arch/arm/mm.c
> > > > +++ b/xen/arch/arm/mm.c
> > > > @@ -1424,6 +1424,8 @@ int xenmem_add_to_physmap_one(
> > > >                    page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
> > > >            }
> > > >            else
> > > > +        {
> > > > +            printk("%u already mapped\n", space);
> > > >                /*
> > > >                 * Mandate the caller to first unmap the page before mapping it
> > > >                 * again. This is to prevent Xen creating an unwanted hole in
> > > > @@ -1432,6 +1434,7 @@ int xenmem_add_to_physmap_one(
> > > >                 * to unmap it afterwards.
> > > >                 */
> > > >                rc = -EBUSY;
> > > > +        }
> > > >            p2m_write_unlock(p2m);
> > > >        }
> > > > 
> > > > > > > I'm using Tianocore as the first stage loader.  This continues to work
> > > > > > > fine.  The build is using tag "edk2-stable202211", commit fff6d81270.
> > > > > > > While Tianocore does map the shared information page, my reading of their
> > > > > > > source is that it properly unmaps the page and therefore shouldn't cause
> > > > > > > trouble.
> > > > > > > 
> > > > > > > Notes on the actual call is gpfn was 0x0000000000040072.  This is outside
> > > > > > > the recommended address range, but my understanding is this is supposed
> > > > > > > to be okay.
> > > > > > > 
> > > > > > > The return code is -16, which is EBUSY.
> > > > > > > 
> > > > > > > Ideas?
> > > > > > 
> > > > > > I think the issue is that you are mapping the shared info page over a
> > > > > > guest RAM page, and in order to do that you would fist need to create
> > > > > > a hole and then map the shared info page.  IOW: the issue is not with
> > > > > > edk2 not having unmapped the page, but with FreeBSD trying to map the
> > > > > > shared_info over a RAM page instead of a hole in the p2m.  x86
> > > > > > behavior is different here, and does allow mapping the shared_info
> > > > > > page over a RAM gfn (by first removing the backing RAM page on the
> > > > > > gfn).
> > > > > 
> > > > > An interesting thought.  I thought I'd tried this, but since I didn't see
> > > > > such in my experiments list.  What I had tried was removing all the pages
> > > > > in the suggested mapping range.  Yet this failed.
> > > > 
> > > > Yeah, I went too fast and didn't read the code correctly, it is not
> > > > checking that the provided gfn is already populated, but whether the
> > > > mfn intended to be mapped is already mapped at a different location.
> > > > 
> > > > > Since this seemed reasonable, I've now tried and found it fails.  The
> > > > > XENMEM_remove_from_physmap call returns 0.
> > > > 
> > > > XENMEM_remove_from_physmap returning 0 is fine, but it seems to me
> > > > like edk2 hasn't unmapped the shared_info page.  The OS has no idea
> > > > at which position the shared_info page is currently mapped, and hence
> > > > can't do anything to attempt to unmap it in order to cover up for
> > > > buggy firmware.
> > > > 
> > > > edk2 should be the entity to issue the XENMEM_remove_from_physmap
> > > > against the gfn where it has the shared_info page mapped.  Likely
> > > > needs to be done as part of ExitBootServices() method.
> > > > 
> > > > FWIW, 71320946d5edf is an ABI change, and as desirable as such
> > > > behavior might be, a new hypercall should have introduced that had the
> > > > behavior that the change intended to retrofit into
> > > > XENMEM_add_to_physmap.
> > > I can see how you think this is an ABI change but the previous behavior was
> > > incorrect. Before this patch, on Arm, we would allow the shared page to be
> > > mapped twice. As we don't know where the firmware had mapped it this could
> > > result to random corruption.
> > > 
> > > Now, we could surely decide to remove the page as x86 did. But this could
> > > leave a hole in the RAM. As the OS would not know where the hole is, this
> > > could lead to page fault randomly during runtime.
> > 
> > I would say it's the job of the firmware to notify the OS where the
> > hole is, by modifying the memory map handled to the OS.  Or else
> > mapping the shared_info page in an unpopulated p2m hole.
> 
> I agree but I am not convinced that they are all doing it. At least U-boot
> didn't do it before we fixed it.
> 
> > 
> > When using UEFI there's RAM that will always be in-use by the
> > firmware, as runtime services cannot be shut down, and hence the
> > firmware must already have a way to remove/reserve such region(s) on
> > the memory map.
> 
> Can either you or Elliott confirm if EDK2 reserve the region?

I will defer to Elliott to check for arm.  I would be quite surprised
if it doesn't on x86, or else we would get a myriad of bug reports
about guests randomly crashing when using edk2.

> > 
> > > Neither of the two behaviors help the users. In fact, I think they only make
> > > the experience worse because you don't know when the issue will happen.
> > > 
> > > AFAICT, there is no way for an HVM guestto know which GFN was inuse. So in
> > > all the cases, I can't think of a way for the OS to workaround properly
> > > buggy firmware. Therefore, returning -EBUSY is the safest we can do for our
> > > users and I don't view it as a ABI change (someone rely on the previous
> > > behavior is bound to failure).
> > 
> > I fully agree the current behavior might not be the best one, but I do
> > consider this part of the ABI, specially as booting guests using edk2
> > has now stopped working after this change.
> 
> Right. If we remove the check, you may be able to boot a guest. But are we
> sure that such guest would run safely?

If the guest wants the hypervisor to enforce such behavior, let it
use the new hypercall to explicitly request the shared_info page to
not be mapped anywhere else.

But if you don't trust the bootloader, how do you know it hasn't poked
holes elsewhere in the RAM regions?

Even if the shared_info page has been unmapped, can you be sure the
bootloader has put a RAM page back in that gfn?

I understand this ABI change is done to avoid bugs, but at the cost of
diverging from x86, and breaking existing firmwares which might not be
buggy.

> Also, it is not really argument, but this is not the only broken part in
> EDK2 for Xen Arm guests. The other one I know is EDS makes assumption how
> some Device-Tree nodes and this will break on newer Xen.
> 
> So overall, it feels to me that EDK2 is not entirely ready to be used in
> production for Xen on Arm guests.

I really have no insight on this.  What are the supported way of booting
guests on Arm?  (SUPPORT.md doesn't seem to list any firmware for Arm
guests AFAICT).

Thanks, Roger.


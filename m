Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71B16F6603
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 09:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529590.824137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTdb-0003qf-Dc; Thu, 04 May 2023 07:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529590.824137; Thu, 04 May 2023 07:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTdb-0003nm-9N; Thu, 04 May 2023 07:44:27 +0000
Received: by outflank-mailman (input) for mailman id 529590;
 Thu, 04 May 2023 07:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x2gh=AZ=citrix.com=prvs=481e65374=roger.pau@srs-se1.protection.inumbo.net>)
 id 1puTdZ-0003TK-AN
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 07:44:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b29185c-ea4f-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 09:44:22 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 03:44:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5409.namprd03.prod.outlook.com (2603:10b6:208:290::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 07:44:16 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 07:44:16 +0000
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
X-Inumbo-ID: 7b29185c-ea4f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683186261;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yk8GEGwtFNhf6MLWbdraXhm9Rq7CHNlbs51CGLhvgeg=;
  b=RnCjVuHzs1eEZUsfYKTomu6mR25nwfQwCbxxz7vx3pYcQFQSZOZ9F2xL
   8flAkcaTrkG02JMpZ69kFrD0mZfDtyHse9NPqu/aw5sJyFRVTsijPguJC
   mnp22D7dNR5sTMfeKSS8iNP43hxvk2LDw4yH5GIhseBAZ2nnzM9p45YIq
   I=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 108226374
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PLdoCqKsjLrZUAwhFE+RVZQlxSXFcZb7ZxGr2PjKsXjdYENS0jAOn
 zAeUDuEbKnZMWakco8kPoXjp08O6JCBztQ2T1RlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wRiPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5bCEBUy
 eNfIQtQSRuvru2T4Y+CEs1F05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv01rWVw3ikBOr+EpWAqMdskgK0x1c4BR8dS3++rtu8mFWhDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5ytLyYT1qN+7HSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIaqivXlFDe2x
 CqFxAA0iq8Pl8cN2+O+9ErenjO3jpHTS0g+4QC/dnyi6gR1dYu0fbui4FLQ7etDBIuBR1zHt
 38B8/Vy98gLBJCJ0SaLEOMEGejw4+7faWONx1lyA5Mm6jKhvWa5epxd6y1/I0EvNdsYfTjuY
 wnYvgY5CIJvAUZGpJRfO+qZY/nGB4C7fTg5fpg4tuZzX6U=
IronPort-HdrOrdr: A9a23:rYIDbaABe6xfAGPlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:bGbPUmP7RazVWO5DdCBG7nILXckeL1rW4F7fBm6FMD5NYejA
X-Talos-MUID: 9a23:qFainQgxt3to+LSNhFRPHMMpDJlR5bbxL0E2upgEsNegMCNSPiWGk2Hi
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="108226374"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPPOv+E/oG41XGUAawPerIwgks5lQUiVoVJjupgDW4R4nGlEVv7Hb1QCut/Ab4zSquRMnS5VgamV6e0aBr/Ku9Ywq4KZeR3rsCMpT3ek/lkaeCh4BzphM1ULrHPpGpx3FTEv63GQi6m8IlAUa9zxDODnrLqsk5zFnQFs35j0Wo/FsvpMKB4iYe+rv3z0fmsYs7HvnmVBMzm4eMI+GFwC2ItuUyPcybOpmAhQem5VidnqzaAGZvO5O3ikQxBnMTVQStYYRTU0YslNtWUjRFGe4VYo4TByVpuB53v6eQ+2I3dUE0s69FcjwQ/J+3MX5wZOKAKbFd+Lgqn6+oK0Plv+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTFv2L769fnTJo8Ke6VVXviRQQALqA65dGzZvVdiga8=;
 b=JwVWUjXfUX5TZ6bZwbKLIZLyN9UEh2hAozXChpszJFkVGBXDp0qazv+o4QAY+SpB+e9DjZenoWLVNx9yxYhyG4CRh65O74X1ceXE+y+/SKb795+2ZWmdsAKvIDTDx9PI44lsrRYjaqtTQ5fRJ+N0jPoqSiAsf+wAj1YFHJyYM7PWRZBwq2RWM5fqbHwTtSRo238nWoaphKRYmamWQV3Sk7ViHzSucqkj2GczPOFjBfwUAT6wsXb7f02vsc2pfSP4M7vx+NoVRt8477qu1kJqhIQhk7LqMG9IAP6D1zO2KJgUjfMQf9syOMU2livccuZUOzcSoFHwrcZPxtl7FzcZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTFv2L769fnTJo8Ke6VVXviRQQALqA65dGzZvVdiga8=;
 b=ft3ZsGtXNJJVW0KWp/Deauzp7f7xt9QKH1jpBS1+TO7MmfTpMSK78ucXVlIGA6G0vRGqXkpGt6yPNqo6C9kMadEQmxcx61HR7qEAb8CjDEMxP7Q4llZTe6ZvvHl9c2FQyRJWsCmVMYrexyzviXjLLnNe8vpkW18UuCH5xSYK1ck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 4 May 2023 09:44:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
Message-ID: <ZFNiS8oxfozlxCz6@Air-de-Roger>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
X-ClientProxiedBy: LO4P123CA0513.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bfeee6-5f5a-4d75-b6b4-08db4c735cb9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qnNrM7Z3w/+QWoVJJyYzWCifwYA7cjHH3ffJD3Bu6Y/slg7kkymqN253mt+4Cb5m3FF1g9YQVIACFIIGhKEyBbcXDf31NzxS8pVRtn8CZW7+Cpf65ykl9tBiEs9pZkeR6gstV2+vlcneum2GwrpR2l16osEzdYPpbsIvSKfNl66NmBDZvThUmE6EeSsJjZ1qgcKSzmXz9hUomep0J420vxHH02Z2sPB0QfRYYx87KNPqlvj7zcJHzfkiFuo2sBrrUGWtvn9vY62fNP+f7e34Fu5HaoPCBl0GoogWH23zOHkNCFx6U3ugWlJNEvBH/NC+tpKvffRi/fIte5g/TzS9SL0/uolr5wv7U5LVHMhSGbiZ8ZdsLWAcg8403qe/9lfE3BFMHgOTRmpu26dbeRu/J3QOPpRt5z1DLQ5a1X8S/Bq53hGeWwPXcaCO7bfVpzhNZ6B8fEq18Ldz/2VIjDpoEyOw5NqzKCWwOC3LtglcmumiDoMP6JkHyPJIun/gaUj906PBSeEhTSZxWBVZ4UGB4E/HPRdrJOplta73QHzjVTKZH7VDpvCMl8mhIz3ilLQg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(54906003)(66556008)(316002)(66476007)(6486002)(6666004)(478600001)(6916009)(4326008)(66946007)(86362001)(85182001)(83380400001)(6506007)(6512007)(26005)(9686003)(8936002)(4744005)(8676002)(2906002)(5660300002)(41300700001)(82960400001)(33716001)(38100700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWN5cy80bkZHc2IzS1orekQ2WDMvTXg0Zm9hcEt2L2dmeXZtTnhacWhtVCtQ?=
 =?utf-8?B?eTVGTVZta1BCeHVSTkVHY3pCNjh1NEFtR1dUSDRVV04wcHg5MGJENnBhNWVw?=
 =?utf-8?B?eFJkY2ord3M3Rm44SmdhYVpYWDc3aVY2SEp1L3M0c3ZYYnd4dEgxWEJZdXhn?=
 =?utf-8?B?QUxHWHRhMy8wQUtPSmRpb0FaSWNjcmZNdW5FZGJpQlQwSytTNDBDeWRJa3FB?=
 =?utf-8?B?ZnFlbGtvR2xROTd3UVZ2UG5yWUNRRHF0SDdyMllNOHpWNlIxSVdkaDh2Szly?=
 =?utf-8?B?RE9pU085YnNnMjMvS1NRT0VjdUhscDE4WGtPQThRc1JoSEx0OEhaaFV5WXhE?=
 =?utf-8?B?c21HTkFrTExGYkN2ZVEvc1JSRkhFSGtaNUN0YzZZaVZOL0dVN3YwZkNGakdX?=
 =?utf-8?B?emcySTk3ZlpvN0JtRlVRaFNFc3JyY1JBVGFoNnBCQWExVldReEI0RVNwbFg0?=
 =?utf-8?B?NUNtRWdMNldiRGpRdDNRSmNIbUR6MFU4eURRQnYxcnFxYVQyMi81R3Fjekpm?=
 =?utf-8?B?UU53SGU3TTd1MzFBWm5hTUl5czhJc0xoR3R5b1hMQ0xJbG1MM2pxOXJaUWJP?=
 =?utf-8?B?TFVsK1BLWDVleWdWWFJtME1mTlFvR2p2QVNnbGJicTFmcDEvOHJhdmZvQVov?=
 =?utf-8?B?eTFTRW53K2VvdERtNWVmQjlrcllKMjVSRG5GKzV5QnpJVW94Rm1LTDExb2Fp?=
 =?utf-8?B?UjJvQlM4dHFDZlNXVS8rVHpFWi9kRm15SThtWklXanZRTm9VVUJEa2dsOTJU?=
 =?utf-8?B?QTIzVEZEdGEzN1JqWGJGSE1sR3hyVkMySkxEMDdYMnJFNmhvL1FKMXlmYU1K?=
 =?utf-8?B?dEFNaUo1ZjliRU9ENzZkSUtXejFvdjNjdWwrYUphNUZuRXE4djczQXBHZFI5?=
 =?utf-8?B?QmFOYzF4R1dlWG1qZ3ZxVnhYSDJqalZSckxXaHBLU01CTHBaeVJSK3ZvRnpw?=
 =?utf-8?B?VGlkM2orZjc1eW9kTDEzUC81ZzcxZGg1MklxTitJWkhaRU5COHBhWVQ3L09L?=
 =?utf-8?B?Kzc4U0NoZFdqVEh2aGcyVk02TTM3K3RKSElpWFRNdHpzT3NtZVl4L2QxL21X?=
 =?utf-8?B?Zk1MN2drZzRBT0lKR3dCS3RnSmNDVDFqNGEvVDJMNjFoQVd4UHZ2SDJsVUFt?=
 =?utf-8?B?U1ljZ3AvZkgvQVRkckNWTldtTGs5S2NuSmJLL2hmbzBtakhpNitpN3U0Q2Fo?=
 =?utf-8?B?UXFNUjdHMG8vN1NnTkhxd1o5dmJpZzJFaEoxakY1bW4zaDdUYkF0dUVmaXdZ?=
 =?utf-8?B?NnAvM3BiZ1dQNnQxMWhZZG9PNkIyRUNucm5rdEhMSVkzRHRsMUxYZUFycVhQ?=
 =?utf-8?B?QWVlMFI0dC9JN3RUeUxYM1lBcndJVVVDTXVZMCsySWxSRFZuSEQ2eTVVTFFR?=
 =?utf-8?B?cmhuQzUzSTNoZ3dYOW9GRktnaXovOXdTNFlscG1qeWFsTHV1dlNWK3VBU1B1?=
 =?utf-8?B?QzNVbVlrcDQwMnZZR0l3U2pDNm5GZDN3UllzQytEeUk5V0hrRS9ldjVQQ0Zy?=
 =?utf-8?B?aHpJOHp6RXQxajlkWmpTcTRKZzU0Y3NIb3J1VC8zdFBwejlQQUJ3b0VBcHdP?=
 =?utf-8?B?WjZZTDUzQ0lSMnQrUXZPKzNNRCs1NzE1YmpqZ1NyMlluY3VtcHRiTU9XV0dE?=
 =?utf-8?B?dCtLK1MyUVN6TGZ2dkxyTVBxVUExMnhXbFFXSkY3MjZTSS9kK2g5Qmo5Nm56?=
 =?utf-8?B?bEdMdVIyM1drUlMxcVVjeVZqeGtsM2U3Z29wU1k2VGNwWkQwNkI0eDNjT2hU?=
 =?utf-8?B?V0pXcWZ0V0QvdVNXejQ1dkdjMDk3Z3VZVThlMy95WCtKYVZvZHRDTUFnTXV3?=
 =?utf-8?B?Z1hINFFJS0VWRnc3MkZVck80UEJQSmdnZVhJcVlEYlRBMVk1WlBybmRpdmd0?=
 =?utf-8?B?azZzZ2EyUnVwM0FNRTJvN1FDMlRLVFpuQW5ZYzZMK0cvVWpsMnliSlZTeDJu?=
 =?utf-8?B?SHhqdFp6cEhNbzNzdFhyeEdab3FaazZqNEJiSEtUY2tlTEF6eEkveFNYZHBK?=
 =?utf-8?B?STlXRE9CcG9jZjhYNWNrMEpqOElvWnhXNWxSL050YkptK2VZTXkxRk1mOXFT?=
 =?utf-8?B?SmRPbUN0a3cvcSs3TkFIM1owUFk4dTQxNHNscnNFKytub1dTbHFxc3RFczVu?=
 =?utf-8?Q?nUYo6hgeaKsg2Lh8ImjunzEmg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QYzVcb+PCuuOzSnWSwZQ6lAohSVyy9jz25w3U4XllgoY2SfpZfxKgO98AGudEph8E78n1eOWKjyO1ixUpMFUfjxwEgtyn+cpdUW94mHvehusdniV2bISkqcNQf99FQI9DM1nZnIGzC5RJiOQmo1gi0o1Einb8redk7bX568YzrnXvbyNTPgAC0raWKuotr2NKiMDQR8KoOiJDFIaqg33AG7yaPAxxjZsKxyUge5fJ+oSPap+BMMLZpy5QpYbwwSSxuTTb3ks8d+X8Vy0Na0Z3Dk2OFs/egfYuUvFv4yWlQJ23/g3SUj9vrs1m9kM0+IfmXxoO1In42NQGL/a1BmZQLIq6BaauQTXa8/SgyJadviFsDaXrwi1AAMp/W1UIVGIlDveJA5CaRGXVqNsZx8N/jRmENJJI5cpYCbHoTsEmvHdnYPWuQhG4jGOXzc4dsEpTSw3juWj80nafQAd3Rd2yJetw5HLILlL7d8bdguzA+1LjgT7SWLibPGMFK1nKxdTwZeyuqUw7dKS6dFDnULYwqBnmnTwsOD0wlGS0FEUr34RwlxBq1AjuEGwjuMyw3q04eV02FcY/HorCJoq8rxgB/WMFiLmV16sZ2gvq8iKwMjVSq0ETaNhbf8Tuo1emygBkKcp2MLpEHX6YP8oxFJB83W4zsga+YQB3CEDxegE7Qxak3CoOqUfqyp7/bDQITf4yOWWZy/k/EWU6xs+UA/7N55fU1utcCHxszyFxFQkH8axIKFXOFQIse4kwCB2nDkTPZe1C3+8rHIMvDw3Aeq8D2xeaypjfINx8VRXUf5G5qnpkntP/H5pkcHdApyqwdM9WZQ+jfTNlPLCg1+8OSeufNBdej+dizTFut//TzTFopX3R0T1tFzN/XkKSw6EiCrH16LVgOLyjw6G4U35gaeJ7A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bfeee6-5f5a-4d75-b6b4-08db4c735cb9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 07:44:16.4996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DokWulNcHQJeYrd5TU+CXtW8Dly+OMKxfIQvHt1/QRu/zA7H4uxXqEu9ZeiUmYmInnwRrYPHFOxmSPb5TZhK9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5409

On Wed, May 03, 2023 at 05:33:05PM +0200, Jan Beulich wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -438,12 +438,14 @@ struct domain
>  
>      struct grant_table *grant_table;
>  
> +#ifdef CONFIG_HAS_PIRQ
>      /*
>       * Interrupt to event-channel mappings and other per-guest-pirq data.
>       * Protected by the domain's event-channel spinlock.
>       */
>      struct radix_tree_root pirq_tree;
>      unsigned int     nr_pirqs;
> +#endif

Won't it be cleaner to just move this into arch_domain and avoid a
bunch of the ifdefary? As the initialization of the fields would be
moved to arch_domain_create() also.

Maybe we would want to introduce some kind of arch-specific event
channel handler so that the bind PIRQ hypercall could be handled
there?

Thanks, Roger.


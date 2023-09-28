Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2807B17DE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 11:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609413.948504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlngT-0004G5-Kw; Thu, 28 Sep 2023 09:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609413.948504; Thu, 28 Sep 2023 09:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlngT-0004Cz-I7; Thu, 28 Sep 2023 09:51:49 +0000
Received: by outflank-mailman (input) for mailman id 609413;
 Thu, 28 Sep 2023 09:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlngS-0004CX-Cs
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 09:51:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1f71438-5de4-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 11:51:46 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 05:51:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:51:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 09:51:37 +0000
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
X-Inumbo-ID: a1f71438-5de4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695894705;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=diqiNbN/U74hz6qmzCOmta/uMm1SCczfZunTxnGuQJ4=;
  b=AmzWvOspc+4dafMsN8ohfcVqYVJF6/ofGbDW3NdWTIfgp19lbW7vVfIN
   GblGG+pptVOuB6Gk9clM5xjSImqUDAh92OPW6LSsBkYoCU6ynzFz0x/L+
   ftimV629/yj19rHGgygF4gHv1R6TMg8+zzzkkL1xXe5qfUgdN61HPQYLt
   s=;
X-CSE-ConnectionGUID: 9ybBK0uDSCK7r2BdxgFx2g==
X-CSE-MsgGUID: fOiQ0CEQTaeeKnrfD211yg==
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 123306411
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:wmLO66k2zdifef4JOLIxa1Lo5gwFJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXjqBOayDN2X0f9skbIq/pElSvMKExtNgGQBv/yxkFyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqga5g+GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 a0JIhouNg2vvMmVn6jhYOV8ieozdsa+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03iee2WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmgA9pMSOThnhJsqFO0x1VLIzAvaVK2rNq/kECSAYsGO
 kNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLopw3jx/JZsZuFuiylNKdMTv92
 SyQpS4ywbAal9cW1r6T9ErCxTmro/DhUQod9gjRGGW/4WtRf5KoaYWu7h7A8f9KIYKdT1+Al
 HEBl46V6+VmMH2WvCmEQeFIELT34f+AaWfYmQQ2QMJn8Cmx8Xm+e4wW+Ct5OEpiLscDf3nuf
 VPXvgRSopRUORNGcJNKXm54MOxypYCIKDgvfqq8ggZmCnSpSDK6wQ==
IronPort-HdrOrdr: A9a23:1JL9pa++UfaVAmV6kZZuk+G/dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdkTN9VLXJOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6Q60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdl11bSjXujxVfzq83wQzw3T+JHmIJiaxPcr24tpst13q
 5n13+Q88M/N2KKoA3No/zzEz16nEu9pnQv1cYVknxkSIMbLJtct5YW8k95GIoJWAj69IckOu
 9zC9y03ocfTXqqK1Ti+kV/yt2lWXo+Wj+AX0g5o8SQlwNbmXhopnFosPA3rzMlztYQWpNE7+
 PLPuBDj7dVVPIbaqp7GaMoXda3Inale2OMDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJjs3IocU6GM7zB4HRyyGGPfIyBZ0Wu9ikHjKIJ/4EUBYCbfhFrcWpe0/dJ+J4kc4nms/
 XaAuMiPxasFxqoJW9z5XyPZ3BjEwhhbCQrgKdLZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-Talos-CUID: 9a23:zY3Cxm06qmtxv+Nu2qMH5rxfS9EvWF6F0VvrCGznEzxDRK2aZ0/K9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AbbShXA2qv+IKSS5pMro0AWrdpTUj7YOvMRgmvKw?=
 =?us-ascii?q?6ssSJFipqNRvH1W2mTdpy?=
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="123306411"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXLIdlEa7gpJ8MMIxEt79gMajmHnSieEYjEI0MvONZw3c1Ji8J7u08XxOcKKNTGvLU2wsOqnFpzaZOqAlm+FsmNF85jCJILj0WBZTtO48TtoOLIsmko9Vw+XQhS+ElybZzaNmlp+0KegGSSmvI33H1ft+6sYrhnoFjYznIyP8jWcPnAFlHZyPQpZcBaYL+kYWQ1hEyYktnjBEXoPwIRKjbjHJSm5aSTFFbYgtinLyTp+vVNYoeFcKUWWKfPUYEicGVotKUyzc/vr3yL6Ozbrr19aRQ7DKbUstsrH1Tg6FVT/OVpvLqcYIhCYFkxuvs1A7eBbwx8UUB1QeRCw9O/9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xK/DPYfyu/u3AiC3c2Zk2DNuHZXYJYgJAg+DkbExsn8=;
 b=cBBQ+SpQQk1PUS4ZOTKrDBnxCRBWF4zyS+sZyqedCnD0uD4QkG2kpaQkGyrA3necfPB8Px3J44Il6xkSogXacNF5Jk1b9+aAYP28KrKfPDtQLgTQelP8f236OI4UGkFr4ULc81fryYtA7D3MppZOTwgRaktyYbz8l7myuJFYVqijxZtyRgrtiXbySNUkpt3cOYlut4ZJ+xaRKtC7geG/vd9blh00mnpdeEncW/xhtlgSbY1GidIqc2ulWzuOmK0/1Iq2Gqvv/1Dk6jFjh9sNUg/RjS6L52k3dQerSKYfg5TPDzlVAAELwV6WpTcxScACHUds3+94QLcCo8IH/Kkkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xK/DPYfyu/u3AiC3c2Zk2DNuHZXYJYgJAg+DkbExsn8=;
 b=ANaZw1zl7Nb16byWBvxElLfhUxQXsctEZnBvuEX3P1P/SGSIgjd3rdlt3Oaiwhq1FGmSC9mi/4/usCpvFbZZOQZkHqEzJM6ZFnheHVGO8P36/0F+0osOuuieWbsrkuNNfBN+2EMCCQUAUFP22I4X+lsPS5p0yOoAUk/wZnOLAjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 11:51:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	george.dunlap@citrix.com, julien@xen.org, bertrand.marquis@arm.com,
	wl@xen.org, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] SUPPORT: downgrade Physical CPU Hotplug to
 Experimental
Message-ID: <ZRVMo6Uf7occc0Zs@MacBookPdeRoger>
References: <20230927232004.1981595-1-sstabellini@kernel.org>
 <ZRU6A2wDSVEEHGbK@MacBookPdeRoger>
 <e1cc81b4-d990-b995-a24a-ba80c1e970ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1cc81b4-d990-b995-a24a-ba80c1e970ba@suse.com>
X-ClientProxiedBy: LO3P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5372:EE_
X-MS-Office365-Filtering-Correlation-Id: da9483fd-61f5-4347-b5b7-08dbc008818c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ua8pwfuM+xy6d4OdLDU2fnR0sLjJOYcufN0Yq6lKNyU7GSEKhZOJAB85mw4HUVi8+xmDRIK/Hg0FSRzXuu6wOnZ2TJUo5zbWsY3K5ANmzTN86z9qYrHQ+zn3lrjwxXYuh85Gt9d1IyC361hxV6jcXkIx6orNVl0Ad3HRLMHYBdlD5hQUrqY7+OGmnFZr429D9bYHDpfWSTwIXbjFkOJTnkoUmJnA9o2PCJvLdurHBZPNpWb39cFR0lKK2X75esCADEkj4TRVBgQvNzMKkxUX/QAvktqIYbJPGAGN++iNNOVZvxvynZoa9i7RBDzyUZUD4fvtDvEuLRf6VnUZuBzmPvwQPCgzt817HRLlpb9oYPAFBkMLdrtB9OXEaJ63BuXLay0KXF41jTZR0ZXndnpjvT/Hu2a+tPVVp4yhY1bl/o9kQaGkdKxtSRItN09MfPv1dEqSqYQMkWHODkSUac1cz28xWEPzZmzeO3iOegE5bQ2nNadIBjwzn7Yo5YKbES66aKpjxo12OiX4/1/1rXHvApAr4EAXuKPXyrffEB4BenAgXxSy0x5h1+dMdkXyRUZF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(33716001)(82960400001)(38100700002)(85182001)(86362001)(66946007)(53546011)(6512007)(2906002)(5660300002)(9686003)(66556008)(41300700001)(316002)(54906003)(478600001)(6666004)(6486002)(6506007)(6916009)(66476007)(8676002)(4744005)(4326008)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0o5ZW9TK3hiSFR5M285cUhCSjFSRWltRDh3eFRtN1FHcUZ5R2dqRDhFelpk?=
 =?utf-8?B?U0lpcnFWcnlmU29IRmo5LzhiOHo3cEsrZ0pGS1JtWlNrREVnMnZaL1JDcVNp?=
 =?utf-8?B?TzIxWTczNVVueHc0b2VkS3hMcW12dlFQbUhkd09wa0syM2VEQU13UnVyQlFq?=
 =?utf-8?B?YWtwUWhlR2hkTWJaUU9pNFNoVUgrbldMRXZmbUpXQmdxeHFVM0N1aDVMQmJy?=
 =?utf-8?B?YkdvQkFiTGM0enZyTVdZaUJxNTVKS29XME5Ra0k1YXIzdTMyQkdod2orWU56?=
 =?utf-8?B?NHRzWmxvLzlxWE5SdTdITzNkdGVMejBBTDgxcVB3clo0VUtseUphYmk3Y00v?=
 =?utf-8?B?d2kySkh2ck5VSmlscjFtd25MYkJuZzFLcmZORS8xZ1hRZkVEanpCTUozNnJU?=
 =?utf-8?B?Nm4vK3k5aFk0VXFNWTl4a0RMY3E5TkVaWUZJNkhOTVRMandJdHAxVVViWW1Z?=
 =?utf-8?B?a2MwWjRrbXQyLy81Uk1ERk1hMmJnZG5ieGVLNW5mUDFROHJBdlo0ZmNhdlJt?=
 =?utf-8?B?R0V1RHpSa2dVV29rWVBqWmMyRWpSVlRKQkhVMnpBcGRCcXBWRmszeHVqVkFk?=
 =?utf-8?B?V2NRVW1vTFl6dzRmeXk2aWtIandlYTR0VHFBa2RQanZ5WmVCT0hFa1owZmxl?=
 =?utf-8?B?SDFiVUJTd2dlOHlDRTRURStJN2VidE9UYUFjTTE3ajNxYmxRRFMxeDZiZnd3?=
 =?utf-8?B?Q0tEV1poTnV1N2FWNHhVdHM3cWxiYUt5dVRndUtCUFJzdU1GWlJpeXJBSlFC?=
 =?utf-8?B?QUpYYzY1OTFTbWZNOGFhMVBxc08vR0lwOEdNYjdRRmtsSXBacnkvM1BpZnk0?=
 =?utf-8?B?ZW9pM2QrekFnMEc5bDBha0V2ZGFPQXpBTjFnVS81cHdOSDJnWnV5bEUxSUlR?=
 =?utf-8?B?WGkydVp2aGEvSi80eStGT3ZSUVpBUXFkNWY4QkxaRmxWSHJ5UWZITk1GT3Jv?=
 =?utf-8?B?RWQvTVIxYklvc3FDVkUyWVp3R0dVZi9UZEZJK1VDcFZDUXZaQVVmMjllN2s5?=
 =?utf-8?B?azNwUVhXNFlPeWFNT1dicHRkOW5Pd1RrSThVeXR3TlhYNXFCb3NwdHFERXZG?=
 =?utf-8?B?Um5JYldGYXF4RDJ2aGxOcW9lSjFhZ0prdFlMQlJ3S2IwV1hvcFN6Ujh5RXFT?=
 =?utf-8?B?TGxDZkh4TEZDbGZ5QlBGVGl0bEJvUGVCT0U4Q2pWdVQvd3hXOG80aHpFcVVt?=
 =?utf-8?B?U0ZheHBGS253UzhZb21MM3E0biswSTZJTm4rajVTNUpZRXpoQlNsSmpITFZX?=
 =?utf-8?B?OFpJVlBuNGZjc1NuSmM1Vm5FT1lvcFIvQ0ozbHByQlVneWZkUEFrd2tXS29W?=
 =?utf-8?B?WmFpS1R3V2dld2wxTmhLZnpjQVBVOHl0MzNDRkFHVWU5RUFEWlRzTFp1dFQy?=
 =?utf-8?B?YlRsWUV3RG9nWXU1NVdkcWVpeXVQb1JuUUt6R0dMWWVsaFdmUkUzY1BKa3Zx?=
 =?utf-8?B?dkhZdlZNUEhuaVBMMUdPaW5BMHVzUmVoMUxJRDdEVEpVdUl5UEt6YjFWWG4v?=
 =?utf-8?B?bHFPL3drVGRjUVNXOVhSbnZqQWpEQy9GWVZRcUZVZGVuQWptdE10ekdpa0JO?=
 =?utf-8?B?V1NxeTZEYndLTVBxNnZZQXVQQ0hSaEw4eXlYMHE0VG8zdS9USndDZC8wbHdW?=
 =?utf-8?B?OUVReEpXb1R3NDBjekc0SXlaL1hpbWM2ZnRndjBJZnFuOWE4MXNuaTI0UTNE?=
 =?utf-8?B?YjV5dnFnVDMyOUdxQmZydEtQVzRNRGFyRFY3SGRxZnFrM1ZOTjF0dEl4bDg5?=
 =?utf-8?B?dWFZWHhjWjN5MGRXUmJEN3hUQ05qV0RrNzZiRVp0S3pDVmRsU095TzMyZ29u?=
 =?utf-8?B?RFk1cERYOU5ZcmZPbE9XMHBVMHV1aW15UTQvMHcyL29PdEtQZGZZcmpVZzB0?=
 =?utf-8?B?SHZ6b3ZxK1RWRHRnT0lrdk5IWkV6UUlDc256YnNJRFZuaDBXYjNMOG5jbVVv?=
 =?utf-8?B?YVhYNlVQS0tvVmpNT0FXM1hnZXIrelF3cVlYbkN4ODRmbkhBRWFHOXRnbnhx?=
 =?utf-8?B?QW1Ya3MzaWprOXlFS3hROVlnM2Y1TXpMYnR6TWhjNDFMcERWdUpoUDZiUldU?=
 =?utf-8?B?ckFVUnY0cTRiR2tFYzhKVldtTDdidUtCc0hWNWFDczJFaFpKS3AwcVhlVEtQ?=
 =?utf-8?B?N0tWRXdkK0NxMG5yM0NwNnUvNU1QTEJpSnJ2WnA5VHNOaWQ1VklYNjZyLzQ5?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RukahipFIFi4Wr7uzfer1Ixy0Q/uYQTtjAHzHIXYPl2upy6sJgcFa+P9Pzd8qx4ptEmB3m4P+u8Ewg5X34l+gB8AqHPaAIWEbuzW89m1rDW9zlxQXr7Z81Tjb+AUgeQFnoTu2YY3PMbxBniEr7i6+2KDDfrGGamPawmHIojBNf6b0rpPOa9GfGDPDAg2Yo318+Col6PedrhJ0CxNPVpA/QgWLwy6WbmfdN1aKkfZ2ofU49zUvMZHiKGNNg5EdxxnV+/QgqFQMwJVz5sEHydNwPS0iH2OYyy0+lsKx7jXdZLvGMrMgzSXJTGoUxRySf6YQ/8TXfymf7SKdY4dSyn45gxjng1U5Bbh3R9KTs6Jfj+QD9dOw4nkv/WgEPKl+K5Hwr/lm5u6I7oeVLNYzqy2A5WS1KREJt5MPE9iQ4bwleLu1PdBFZ3GIjkHLGmrzltYXB6F5rwcqoPZ0kmlT19RtUjlT3rHaAzNAZnu1hbWJPJKuWudAO8pTc5tCewf8G07cPBII01JDmw8NRz2nyfSaVc9Xj8Fwuz1x2y+T3jkK+WsvRUijtY/902vWJJmKlBcwaAtaWRgWL/iYcKEr0C2PP9baoXd/f20lXerjM6Ft2QH6J+COL9zAz5/PARhW5WwZ3EHSvrgL5MNZp8nNgE896Mb9qETb4cKs0+z8bnbc4lzvONvcUPv0SPyhzz4Qmg5XBd8kjtymqK+4uAd0mkKHfOEt5iX8GugUEG+lgvh6RPBEscoJ/OPSrb/RQreOfFTsnx57GYrnXoDBXf3NIGmDAkvHYK7FBdkymlSVnuk8o2o5Aw3rdsUlHRoyjRRItFzPY37j5VLg2J2nfN8RKXcy+nlM7Nmd+Po4KS+H9cZUzSzQvdBytmw6xe1K1ODE9FHoZjx6ekO7/AxCN/CHTA3AA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9483fd-61f5-4347-b5b7-08dbc008818c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:51:36.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPGi4XaDQCqfm9GjSUyGBElPf5Hu5viGcYenEQq40hoR6N/6Qx0ZtO5yeheriSmit7fMPYEyabMuDU2nw43Dew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5372

On Thu, Sep 28, 2023 at 11:32:22AM +0200, Jan Beulich wrote:
> On 28.09.2023 10:32, Roger Pau Monné wrote:
> > On Wed, Sep 27, 2023 at 04:20:04PM -0700, Stefano Stabellini wrote:
> >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> >>
> >> The feature is not commonly used, and we don't have hardware to test it,
> >> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
> >> members. We could use QEMU to test it, but even that it is known not to
> >> work.
> > 
> > I think this last sentence is ambiguous.  QEMU ACPI CPU hotplug
> > implementation does work AFAIK, it's Xen implementation of ACPI
> > hotplug that explodes (or so I've been told).  I would drop or reword
> > the "but even that it is known not to work." part of the sentence.
> 
> Maybe simply add "... on our end"?

WFM.

Thanks, Roger.


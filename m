Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE095B9EB0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 17:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407545.650085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYqjJ-00067j-Sl; Thu, 15 Sep 2022 15:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407545.650085; Thu, 15 Sep 2022 15:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYqjJ-00064X-Pi; Thu, 15 Sep 2022 15:24:41 +0000
Received: by outflank-mailman (input) for mailman id 407545;
 Thu, 15 Sep 2022 15:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCqY=ZS=citrix.com=prvs=250640b55=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oYqjI-00064R-K7
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 15:24:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 820671d7-350a-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 17:24:38 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Sep 2022 11:24:29 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 15:24:27 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 15:24:27 +0000
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
X-Inumbo-ID: 820671d7-350a-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663255478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VABl6vMd1dJIgFwShDoQmWZp65IJUwBHc8cGrqnEnEs=;
  b=FAFQWZvUPObbwunsZAGWTR8Wa5Z+hMLjfJKdFnCU9j1+PX4YkVGRPmR0
   FEftWKvz8eIXI8aaor9+jSazQevGZ/AYBGYgxvAevILxsXQBrMgtqVnat
   SphtjQ4j2jxfgbzykhZJGQPOXkTSTEDYWjAWCDJ9HSUiLH7VTsxKYZLWg
   4=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 80281675
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tYv99KinD9twsW+oA1f2t7u+X161aREKZh0ujC45NGQN5FlHY01je
 htvDDyDOP3YamL3f4oiYNi/8EkAvJCGz9M1G1E4qHg9HiIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KWr5WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eH4Nbo9pUA3906
 vkCKzsPRAyfl+a3+efuIgVsrpxLwMjDGqo64ygl4RSHSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9xTM+/pfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPkWDVqyzz24cjmwujY7A3OLOE58d4o3LP+0ZDCCYoZ12k9KzRZkmWHog3x
 1Yv0jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL84hmbLngJSCZbb94rv9NwQiYlv
 mJlhPvsDD1r9bGQF3SU8+7NqSvoYHZFa2gfeSUDUA0JpcH5p50+hQ7OSdAlF7OpitryGnf7x
 DXiQDUCuoj/RPUjj82TlW0rSRr2znQVZmbZPjnqY18=
IronPort-HdrOrdr: A9a23:ErsGJKAEkxUo9OnlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.93,318,1654574400"; 
   d="scan'208";a="80281675"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdAij5FccnW0NwrVFzq4+ctdxtajAI9jyDw5+kjSb7vb5k5oHrQnJZTvjDxYqdGX7yVU9ENbUCKVQQC00DYzJQA1reFbvhJXkgxPXXTbb6InOitdVnO2OZDg/O4JHMvqnGU5gFKfYzi/cN1omhoFtQ493WWcvnh55qGBDuuH7VaLYykri/RwI/o+GpIUxf5pchfLBrgg1EQV+Ifq4z29iPMjoongo32LHX6lbHrbr985twQAryYCopcHKwnINZ5LxZTRam1J5sV03axM8w6O/Z8yodksMeyCiI61nRIXYc6xCvPOXia9bEldGxfT9FD+DxfpYQ6ADT8gubwUi6vg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGU1akVy4OKD7SyL8avyZnajpBBC2I+oEl7N+VuF/hA=;
 b=AVfAcTjqRbWj2mCuQhcRlGkI8KCiP/cy0una3QveLncLqlphMGx3LcyVdsKJJkFPoJWjLqbBauziVRvcvuvt+lpNP52VMpoMyUmE56FxuX06ALYVBi7E7IFe0296TvPGAkvPP/aAeXDjq0JPysGk3WFywENaPArsn8dEsgJDENsXbtrkwlOm0DrZKTqQc2H9tyAAOflsPGuJwSd4fHCR7NzW9wXihg9YsV0hDIKby8AzhSMGennVWSJEw9zEkLR5E3ETaVBUxnnmbGgeipWlOMBOunlUQrvlqcAofIm5mBTpsF/WcIOgUI2TJs/4snEzFk46nObfq68nnwv+NWMtGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGU1akVy4OKD7SyL8avyZnajpBBC2I+oEl7N+VuF/hA=;
 b=cKoaNTI+p3uT+7QQgBd861r2eU47Qiyi95x7Vb76tlqxw00sXJzkMMsUjxZAlWIbTbZJmbyTZugem+OW2OG00igMI7FxbaOcUDn2R1YSl5VBdy63/AV0o+6Ch8lE60nmbfSU+LATZF2FUCtmjPZRcDOJKWkvn94yrIqamdxXvUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 15 Sep 2022 17:24:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Cc: anthony.perard@citrix.com
Subject: Sorting out osstest
Message-ID: <YyNDpi9vGiNE60v7@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: LO2P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::20)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|BN9PR03MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ef3ba6-5bc7-4753-e8cd-08da972e605d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BPWE22FljCsjjOllfsbwzXOtoqWSIGb3sYI9H27qNHAVf0nR5M2TLDHo4Yvd97LsjQ6BVEROWPcx67x3+8hOzaruyI2FhmrQNuwuBosNSCXrvFRv3UNcNcVNhgjIDiBvtyttI5h3a5EbXLilev0UrUacfyrHy6HWdE5QMBl/ps3c6p7mYa/J7a2vNcoOTsbz0aMVYrm+QNuvEnf+USeoy5i+uk2WH1N6m6G++D7xiWC/giJsMtlNZGJtc/QqWM8HWLU9Vdy0xVhfA5oiSyffe1vSiLaOowlmNiZbT9IohXYgQkEhioCnjGPezyPGp6PKmnFkLazalKmEb6Y0Eed4/xWQR7JX++zTBH+G9+DlMMj4XvYVACjq9dG8T5/VQ+9bs9K4l3kiqy9ojEohq7uAg0oI420HNY28YFyQHzBrIxgUVw7oCyc3uCNIAvcTwE4NZbA/U/mqO1RwbQJsobPjcPOyoaQSO8yZv+oDFyPlJvoju87JbPBk2Q3z7CQYs/g2bvTbp6ySjqaxqgtkMLQaJ/6f10ah5owPJY0Uyux31//5yDXecd0FMAqgf1za1UO7b7GtULoJupeC65CluKmpGR7m+eOPveFy1YBVa6FndqIXuDRXqlrfAcJs5wnwcEonfiUHXqtBdN7aEV84ZtBtWv5e0eIu6A4f0FSJvIPVqKngyKyOtrfQuomYXNQHGSID/3/vKkg3komzUAUuJ2xlrz86QS3P+rT82nkg87SHQjmeAPaGZ0qHaxQF4VIs7L1h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(6666004)(107886003)(41300700001)(9686003)(6512007)(26005)(966005)(6486002)(6506007)(186003)(83380400001)(85182001)(66946007)(7116003)(8936002)(8676002)(5660300002)(4326008)(38100700002)(66556008)(478600001)(66476007)(3480700007)(2906002)(6916009)(316002)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmlmL2xRK0RmRElSWkg2azJhdFl4MzNDdTAwL1ZLN3pYbU9CaVlCNWlGMzND?=
 =?utf-8?B?MG1SSnpVR1g4UUFzVWF5VjI1SzMraURMQUdyM1RJcTg2c3FmNXBtT1g5Tjcx?=
 =?utf-8?B?RFlteHhyWlJZNFZlUVJNMDhoREE5SlllT3NqUUIxQVlIMzNrOXFoVjZmdDNM?=
 =?utf-8?B?QTVUUEJ6NUYxenM0bFZkcVdVYWVsWWh0SDBOMWRjUXN2SFh5NEhWWGJnSTBk?=
 =?utf-8?B?cWs1ZTlRUUhhaXd3TUZqajN6U0RkeWlzUzY4TDkrMVpQTUpLSWJENmRXemJt?=
 =?utf-8?B?TURIMDY3UzNDcFhOTktzdlZTb0Z6ZUIrZFJ3V3AvaDFsbjBQWE5JRVFySGhy?=
 =?utf-8?B?Qk45K3d1VUhiR1NEVitaUTVGZzdBUGpWek94VGJqYlYra2hSZUs5S25CR2RX?=
 =?utf-8?B?ZVZ5TUQ0VDhMN2JGZ05zL2ZrNG01RVdMVlB4WlVOMVo1Vy9iQWJUM09VWmp1?=
 =?utf-8?B?MlJ6a3dldnFtUlBXTE53em05QjV0UHdSclhuVkZIYVNtdkZpT3NhbFV6WlVG?=
 =?utf-8?B?SFN4ekNYMzgzOW0xRmlZejZIbGx6L1lOaTJXMWUrT05SVThMalhjQjBDWTVZ?=
 =?utf-8?B?OEdQTEZ3bmx0MGEvenp5TmJnOFJaOVJ4N0pZR2ZiN1k1bzVEcDkwMTJ1KzJW?=
 =?utf-8?B?N3AreVd4WTNiRU9qdk5Gc2loc3JrMVN6UVZqbzB3RXJKT2Y4YUpuaWhjR3Vz?=
 =?utf-8?B?dFBqWER0MXF0ZDVTWkpoa3Vpa0xrQWtBNmJqNWU4SCtkbmpHTHI4UzZuRU8v?=
 =?utf-8?B?L3ViZ2ZSTENRQ1BrQ2tWdUhiUE80S1NScU8xNUlTWVV2V3g5SlNYSlMvMVEz?=
 =?utf-8?B?a3RIVHQrRExQYk56akZSbWNMbzJNdmhETWxwcHlWMC9maS8xQk5uWGlRNExx?=
 =?utf-8?B?dlhTdHFwWTl3RS95K0o3MmlBT1dPOExyNDN0R05nSEJmak00NzVMVWlqWFhh?=
 =?utf-8?B?UlBHdmFyN0tYS1A2SmpNcG9GeldJWEZLZnE4SWNHOHpPRDZOczlpV3dhcW01?=
 =?utf-8?B?ZVdDakJrR3pwbmFkNEF4cFZyTDVMdGRtZjNWYWV5b3JKZmlwQS9YVWE2Y3dF?=
 =?utf-8?B?Y01vMXg0K1Z2aVVXYUMxbitQWE5oM2lEQnZOVDBvYWVrTUI4aEdCNk16UThR?=
 =?utf-8?B?bGlKcWJpVWZpNG1JbTkrWUU5U0RsbnNKWXpyZDVMWHQxR3o2a2tZWGVMd3pT?=
 =?utf-8?B?d1hTWUJkWStManpWSUNLS3B0TzJWcFVHM3FXa1krZkplRWt2WlZpM25jRnVB?=
 =?utf-8?B?N3A4Vm5kU0FVYURyc1ZQZ0szQmpPSGhMOUtwOURUcDZLWVhhRjArNVV2NXVZ?=
 =?utf-8?B?U3BqUXdvUnJlM2RtWUZmUUpyMFFEZHZKdmQ3QUcwZUhBYkF2dG5sME92N0Ri?=
 =?utf-8?B?Vy9LUHNNV2pkUFN2bEk1Mi9ibWc5NmJDM3ZpQ1Y1YkV5ZGxVNnBKUkNwWWRH?=
 =?utf-8?B?bVJnTkJ6RWpMSytmbEVqUi9lWWc2b3R6VHowcEoxNWFTV2ozT1cyTFh6ck5h?=
 =?utf-8?B?VGI1cGhTNTMwOG1tc1JHZmE2bXQwVExnUkJ5OE4zeG1DZVFVRHMwSnJFK2ZP?=
 =?utf-8?B?SGVZb1J6cXBSTVFSdUkza1RRUzNPbDN1aENyNzRSNkpreFFOZnA1TldibUdF?=
 =?utf-8?B?OHdibEJhUmZaU2oxYklLdkpPeW5UMEZTNHJ2aW50dSt6TXR3K3FoMGhrSUZy?=
 =?utf-8?B?VWhXYStYTDdXd0E4TEthSmFZaHhsZzZmbFAveHg2VEJkWnVqZ25RcXYvZTRJ?=
 =?utf-8?B?SjFudzBhbFdjUG1NVjNEbFJXLzNEUTdtK0hhV1FIbkpUVmR0Vk83VW9Hc0tK?=
 =?utf-8?B?MmJKSWRuRUViK0x2THBxcHhRN2RDMUZkNnpJWnkvVnRiWHMyLzc3K2xaMjRT?=
 =?utf-8?B?aGd1NHFTanFRWlpnWTZXRjYwenRjdzRuNFRtZTREWGNvOXRoaDJNZzI3NjlF?=
 =?utf-8?B?NVFOY1pjOVRHektLc0xEdDRTZU1MRC8yYklzb3orMzRJR3l4cG9XMVFmSTNh?=
 =?utf-8?B?TDNxbCtTcy9LazBIZ2VGdFN4Q2s1bW5jQ0FsNDIvU1VFcCsva2RLUGtkTURG?=
 =?utf-8?B?SjZENGpOUHBLK3ZqdTA4QjRFZURxWFhyRXYyb2lqZkhoYTFoOTdZckpwZlU2?=
 =?utf-8?B?c0tjb0RWTGIxR1h1VWFMc2xiR1AvUUJ3U2tET29KYnNzRXhxY29QcU8vVWhj?=
 =?utf-8?B?UWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ef3ba6-5bc7-4753-e8cd-08da972e605d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 15:24:26.9746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3A2rL02UqgsY0fdb0Jz1U0x2JpkhO0FdT1Rhlc94OGTgiviQ/qj8ncCB/6kVXASf1CKWX4lWBp3Oiolr2OXIuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

Hello,

There was a bit of a mess with osstest, changes have been pushed
directly into xenbits osstest.git#master.  The same changes have also
been pushed to testing.git#pretest (but it seems that with different
hashes).  Prestest however is not passing because of libvirt build
issues.

osstest.git#master:

8510c7df (origin/master, origin/HEAD) ts-libvirt-build: Rework to build with meson
f9d084ab TestSupport: Add support for installing from backport repo
b21b6e80 (testing/pretest) ts-xen-build-prep: Install newer NASM version, to build OVMF
2cffc6ec (testing/production, testing/master, refs/patches/fix_efi/debian-hvm-cd-update) osstest: update Debian Buster install CD media to 10.12
dc762d67 osstest: install irqbalance

testing.git#pretest:

12c254e (HEAD -> pretest) ts-libvirt-build: Rework to build with meson
c2c2f5a TestSupport: Add support for installing from backport repo
b21b6e8 (production, master) ts-xen-build-prep: Install newer NASM version, to build OVMF
2cffc6e osstest: update Debian Buster install CD media to 10.12
dc762d6 osstest: install irqbalance

My plan would be to pick osstest.git#master, add my libvirt fix on
top of it:

https://lore.kernel.org/xen-devel/20220913100328.27771-1-roger.pau@citrix.com/

And then force push the result into testing.git#pretest in order to
overwrite the current pretest branch and have it based on
osstest.git#master.

I would then expect the pretest flight to succeed and do a fast
forward push into xenbits osstest.git#master.

Let me know if that sounds like a suitable plan.

Thanks, Roger.


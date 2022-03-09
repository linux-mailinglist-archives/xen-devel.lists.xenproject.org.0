Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39724D3063
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 14:48:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287852.488104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRwf2-0007D9-J5; Wed, 09 Mar 2022 13:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287852.488104; Wed, 09 Mar 2022 13:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRwf2-0007B8-FU; Wed, 09 Mar 2022 13:47:28 +0000
Received: by outflank-mailman (input) for mailman id 287852;
 Wed, 09 Mar 2022 13:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRwf0-0007B2-VD
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 13:47:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71da9914-9faf-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 14:47:23 +0100 (CET)
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
X-Inumbo-ID: 71da9914-9faf-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646833643;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xP3SB47gaxpdsgpRPf3DVu8gE1mhj/p8VR8pA+3r6/4=;
  b=LGQJlEKwdOg7ezRNRHgrj4/d1ssjm+SL6reln68hNFQCtxZQWfPmvoTA
   /1XUeVtlWLDkfBg8V/AhC431R21GGliuHWTdsbK5sDmiP2K+a+aJBrBFT
   muZNW8WD/KmPn1F8Jvu9iK5GM8Ww9CwLPZ461+jBpEV+NQoxKd+dPJ46b
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65747535
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Oawd/6gfDuk6VyVtuYYUfuZQX1611RAKZh0ujC45NGQN5FlHY01je
 htvXTvSb/6CNzOgcooiaI23/E0F78DWzdE2Hlc9+Ho9H38b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvc4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQcqHJPJodYYaT9BHzAlfvFr1obtHEHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDO
 JZGNGEyBPjGSyFmJXM8Bcw8pb6Pr3P8IxdjkQOfr6VitgA/yyQuieOwYbI5YOeie8JRmUqJo
 3PcyE7wCBoaKd+3xCKM9zSngeqntTjgRIsYGbm89/hrqF6e3GoeDFsRT1TTifO0kFKkUtRTb
 Ukd4DMzrLMa/VauCNL6WnWQo3OavxhaR9tZFcU77h2Azuzf5APxLmoZSHhHYd8vts4zTBQr0
 EOEm5XiAjkHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnTNxuDaq0hd3dAizrz
 naBqy1Wr6oXpd4G0eO851+vqzCxopnESCYl6wORWXiqhit7a5SifJeA8kXA4LBLK4Pxc7Wal
 CFawY7EtrlIVMzT0nzWKAkQIF23z/aGEgPZuGxqJb84+yX2uCKOU7l63QgrcS+FLf04UTPuZ
 UbSvyZY65lSIGamYMdLXm6hNyg55fO+TIq4D5g4evILO8EsL1HfoEmCcGbNhziFraQ6rU0o1
 X53m+6IBG1SN6loxSHeqww1ge5ynXBWKY8+qPnGI/WbPVi2OSb9pVQtagLmggUFAEWs+lu9H
 zF3bZfi9vmneLeiChQ7CKZKRbzwEVA1BIrtt+tcffOZLwxtFQkJUqGNn+x/J9Y1w/gJyI8kG
 01RvGcCmDITYlWddW23ho1LMuuzDf6TU1pgVcDTAbpY8yd6Otv+hEvuX5A2YaMm5IReIQ1cF
 JE4lzG7Kq0XEFzvom1FBbGk9dAKXEn71GqmYnv+CBBiLsEIeuA80oK9FucZ3HJVVXTfWApXi
 +DI6z43trJYHlU8VpmKMKzzp75z1FBE8N9Ps4LzCoA7UG3n8ZRwKjy3ifkyIsoWLg7EyCfc3
 AGTaSr0b8GUy2Pp2LElXZy5kro=
IronPort-HdrOrdr: A9a23:lzifUaut7jnNrsggQfp31MWx7skC74Mji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4t6+pnay/qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD39jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU411rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAx875xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwttrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGXgoBW+q3tYp0PJGbEfqBb0fblkQS+3UoJg3fw/fZv30vpr/kGOtx5D+
 etCNUeqFgBdL5TUUtHPpZzfSKGMB28ffvyChPhHb3GLtBPB5ufke++3F0KjNvaDKDgiqFC36
 j8bA==
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65747535"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpXyfCFNv+b5J1zCwYtrbTBJ0DZyUGw7t8y5Xb6w0X/+0cmEE/r9RArqt7SDnB+nxBABVnxm1hzVqwoZramGV+QEsJ4vWrD4TCBkbW+mJeABnqewiOMRU55utFcKntsxoHhblauZAK282XShKzCHR8eKB/+6pFqYShqwVeqUeotGw2xs4JLva7OO6YKwaarZW49CpxSa3uvgikVy6cPwB9omQ6McMDzP/78SNrJE2YPHoof1Tq20rLi0MYH+cEageaVJZgjvzdPHnkmz+gq1w9ZcfMeqUaD2IBI1GtL3zt9DJGB9px0u/SIAcW9c/T528G85p8R8qR/M66JzOMyO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnTbjgBXoif7SBkZOFFifYDL3Y/a2m5voGNF2Uq7qwk=;
 b=c7hxYvyKikk7nTXFGTt3xbxbHhWec4QIPIqMQRriLAX5xaY0syYbwjo7Xpblb2krPkOJfNQiPmRz0vI/juLjAap/T2ot8D19k1WK7D223zz2PHAX1rRaHAuBFBiYFpHkI/Bj51wXHA7h2QS0VIkdeyCQkgeEvDYri75IfS8ytI4bmc1aPpyZvKVKzmDbCQuPq+wQzxOnOjrvd1yIDKEUTZITUNX3e3Iju6pNArKGs8r10fzXwQeiYtrwBpnJQxC05bxKzKpf3MgK+hpapMAjfGHTHU+k1tHq3eJ0MMGiCOT85j/13tDFU76f/eMfTbs4OrAtBHvEde9JACsjgD5p5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnTbjgBXoif7SBkZOFFifYDL3Y/a2m5voGNF2Uq7qwk=;
 b=aLWZhWCLNqUrehugAGodMWNDlrKZiOZM83Gpkd8mgxJuvNnJml8ZcbCDu7S/RNMpB7G5pegbLPub3vreALUpcAglXrlZuQfTi8nEyAiF+h6f1LqpPVIfJmKi7D293+3ZT6vQMO1J5JxIrsi0dt40JkEraN3maCBa3cq+fX0qWf8=
Date: Wed, 9 Mar 2022 14:47:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <Yiiv35mWhEpprns4@Air-de-Roger>
References: <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
 <6c9400b8-7c76-34c8-f69e-3fad1eb53b8c@citrix.com>
 <101b0950-b7f2-119b-b654-574a71cec3bc@suse.com>
 <1bac0507-9420-f0b9-f846-f1c73bf9678d@citrix.com>
 <42fb3257-0c36-c156-c81b-f70dd5f247aa@suse.com>
 <9721222d-1c0d-ddaf-fbc6-801f5d9445f5@citrix.com>
 <12727658-68f4-1785-9b37-c948eb2cba71@suse.com>
 <9ed50d7a-23c7-2405-ff5e-15cc02b0c67f@citrix.com>
 <7fbc16f6-4175-06e8-742c-9aa8c7eb3e91@suse.com>
 <c548b7cb-dc83-b591-d82e-0c70490a38d2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c548b7cb-dc83-b591-d82e-0c70490a38d2@citrix.com>
X-ClientProxiedBy: LO4P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 681fed1b-0544-4cd5-e243-08da01d352f7
X-MS-TrafficTypeDiagnostic: BYAPR03MB3413:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR03MB34133A1BFD73DA1009E723308F0A9@BYAPR03MB3413.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5hAFKnSkWWoAuroCW/yGz+lfSfO2NY3GaHVc19L2uBAtb6PsPVL+5u0DpdR/aueUEfSsWCX0SlUTJclnSXLlD15cS/fwJRGGNmElAGwZdsqhhvJ1VHJaC4tAsMLWR9HAtKDmo8Ju7iTl095ZCD9JM7VjR79Ams/j8qVqk/CQMXmdBTt7qNbjo4rcVkr3ocApr3ArjJO/QCw/ALIC5h5+ugSHOCpiwMJpz5ZX6tWv0Tfrq9dTs5pVcxwHFy0cReRXPMD74VQ51f3pkmlMC7AlLfQJR4rxmra/jafWW0w5hIg0SnKThpWuvtwTdZjO1hqtMlgYzCH33AAP2cB25s3UR6fyKbhzkkmTTa0qwCHxsGd9K9MjvsQirL5JyAO2j+OodDudd6ALVn9iSgxydSW7vGnvaih4KFJI0fBBXMBjvt6GPcIsDxMqj7otK1UmmqOlHz3jU9e6n1hwnIKHp8vTDShfed/MR/W2CtR1vxuVm+LhN6MC5H8+kZVjwr8FL5Kh8yoNs2dpcTMmMMc2dD+uDhHyK1ASbZo5V36/ewzJzjwHxzJoX8Xz9vky1GOXfkEEWbjEs2B17VHLRdJiaGfbQmT8Tjtyy3EoRsFCnt+notyRgn5BpVbia+3Q2NzLL5GXzzEO1+O01xQNWRsgZpt7eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66946007)(4326008)(6862004)(8676002)(66476007)(66556008)(508600001)(2906002)(5660300002)(316002)(8936002)(85182001)(54906003)(7416002)(38100700002)(6636002)(6486002)(86362001)(186003)(33716001)(82960400001)(107886003)(53546011)(6506007)(6512007)(9686003)(6666004)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUJHbDh5cysrcWZkbzh1M2NRMTJlZENrdk1QWW5iRWt1KzBpTXlnSUZCNE5K?=
 =?utf-8?B?UW1Hb0wxeFdwZGRjdS83Z3RBRTQvcHAvZUNSaXA2S0wwdm1BOVJVam1aSmh4?=
 =?utf-8?B?Q1A0ZHMrRVRCV01CdlNXOTBtbUJWUzlBcHdwaDhGODArWVhpakpNY2RRcEdt?=
 =?utf-8?B?aStVR2hlYTNLaEVzVDNrcGlRb1NxdEl4NXMrYW1sTWt0b2E0eTRIeFhiajFo?=
 =?utf-8?B?TWZiZkRWVlh0TVZFdGVTZTRyN0hBSW9xeVQzVzdaV1Jsd1k2THpOYmJTOTRD?=
 =?utf-8?B?NWYydklCT0UxU0pZYWFMWXpSR0RtVWc3K2w0cGhPZk8yaFYwTjZuSDMxYmt6?=
 =?utf-8?B?MGloSStBUXg1YWVXV0FwWFMycVExWFQveENBNElMRklkYTd2NEZHN2VPcHha?=
 =?utf-8?B?TS93MFVzaVF1TWFMUjdINkF6dHdtMWJpVXpOWDI0S0JyQjhxRlU1UWM3MlQ0?=
 =?utf-8?B?Y0VRTTJ4cCtuRC82dHFiK3RnOUJqaWRHQUswUVFoanJmeUFwc0toQmJQUUpv?=
 =?utf-8?B?VTNUSk5YZVVqbUFGd0tsTER2dE9xNXE2TndKclNTUEdFUGprZnpMQTNuaDFU?=
 =?utf-8?B?RVpDQ2YvNmF4OTVJREs1Zkh4TG04NHNXcmVNWkVwUDYvR1VCai9nRGh0M1hk?=
 =?utf-8?B?K21zTHV3cnpDQzRIdlgrc0F3dXNCbS9KdmpuNmxKdCtBekVjR24zdHVEaUFt?=
 =?utf-8?B?U3FwSk9KamJ4clUya3E4VytKYUppZGVOdFNqLzhmZTlTQlVLV3hVcHNQZmVD?=
 =?utf-8?B?TkpUZmlVZXpFek84dytXZHgvYklEWlRrTzNjQnlCckF1TE5zRlhFeWkvWWt4?=
 =?utf-8?B?RDNYalhJTWlROXV3NHhyRzY0VWxPdnVGaiswL2NVWjFJK1pvWUtQdjhGcWJi?=
 =?utf-8?B?TDA0Zk1wV21VVlJVTDJiTXVCd3gyQWxNeEVFYy9MWGJFeVVQRzQrWTZuc2lM?=
 =?utf-8?B?alF1MVU1RG1JVzU1RHEveGVqMmVDeEpoR2ZOVERza2g5WVVBdTM0ZXA0aU1B?=
 =?utf-8?B?aFhtNWRsTStLTjdrUkFiYk5aSmtqRUNVYmVlQ3FmcTdYSDF3TjJIQmhVM1Qw?=
 =?utf-8?B?Z0xZSnNZSWJXS1JKZ2w5SUJFVWVBdURGR25kK2VWNCtvV2htODRnOGx4cmFW?=
 =?utf-8?B?VHdFRkN6VklvOGJLeW9qa2JadmFEUDJtbjMwVllCMUlLblZmdkJZWUpWKzFh?=
 =?utf-8?B?YUdyckZheW8ycHcvcnpPWm5QdFk2aWo4YWZkY2FCcC9ZV0FYY3hJVy8waUgr?=
 =?utf-8?B?RE54ZldTYjJHNy9OK0txNlRJeEM5K2FRM2MzQmVSZTM2ejg5L0hkZ2dud3pk?=
 =?utf-8?B?cFZ4b2c4N1MzNjJSUmpaVWxsakZBUkxMLzFtNWMvZ0ZuUlJuZCttYmlkY3BF?=
 =?utf-8?B?cnErOThTMmloajhVcFFBYTJqeHVxRStKYkF6L04yb2lCQzM3R1hQSTRoMmRB?=
 =?utf-8?B?Y1ZJN1pCenlCU0JiaUNOR0RuQll1cGhLL0wrYS9WSjAzVmZMV0JZYnZvSldW?=
 =?utf-8?B?VGZRR0VTVEV0Q1d2L0RtekExdUtjWFBYVTJ5RXVCNCtGY09Ld0JJYVNqSjFa?=
 =?utf-8?B?OE15YVlGSis4SzlEUjJHN2F4NnBTMGxBTmFYUzVmSmJGd3IyN0pvemVsYUFs?=
 =?utf-8?B?WTdNckd5WmVrQkxYa0ZkVnZCU0lzZHNZbUVRMFp4ckkyaVFzQmM4RVh0RG1W?=
 =?utf-8?B?QWxLRVJ6M3gvZGFBRlZlNEZRMjBOQUZRbUdSZlNYb0wyTlYxcEJtSk9UMmFy?=
 =?utf-8?B?b2drWU90cDNleFJFNng5Rkk3RUp4SGhPZTBFVjg3Z3VhWGpDdHdydndlYmtO?=
 =?utf-8?B?eHh3aWFySWpPSmpULytZMVorK0ROVTRkZFh3RkV2ZEFLUkRMbXdwUkRkVnlk?=
 =?utf-8?B?UWF6NjdGQnNaSXZqcGp3NzI0L3ZzM3FIcVJlVlhZSUVBNFgwMFVPbmRJMHJz?=
 =?utf-8?B?bFJtV0V5VTJxaXNibUZKZTBqTDY1bExsalh1aTdkWTF0QUQ1VUpLdFY5bGJW?=
 =?utf-8?B?eWNySGw0ODlmQnhOWUxRSXYvSVVRZEtQY0VtU3QyRWRpZ2hzUXppbWp0UFo4?=
 =?utf-8?B?cGI4dXNFc2Z3czhleHFsTEhyTmt5aXp3Z1k4bGcxQm9QM0VwTHRGeDEyNWF4?=
 =?utf-8?B?eTJwRDNyQTBsRDV2anphUVVoaDQrSktnZUFXaFByTEgrNFBmTzRFUHRmY2Ju?=
 =?utf-8?Q?ZfQVYJe84HzaSgqkK/RflQw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 681fed1b-0544-4cd5-e243-08da01d352f7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 13:47:17.0081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GybVlQaVkFbb3MZ0JKOK5aEfJk6s2fVESVCe0rYf8fBQREdJq+tAkZ2fCKzMlAgcWslApuZF40HuxxUY5hriVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3413
X-OriginatorOrg: citrix.com

On Tue, Feb 15, 2022 at 04:33:15PM +0000, Jane Malalane wrote:
> On 15/02/2022 15:21, Jan Beulich wrote:
> > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> > 
> > On 15.02.2022 16:10, Jane Malalane wrote:
> >> On 15/02/2022 10:19, Jan Beulich wrote:
> >>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> >>>
> >>> On 15.02.2022 11:14, Jane Malalane wrote:
> >>>> On 15/02/2022 07:09, Jan Beulich wrote:
> >>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> >>>>>
> >>>>> On 14.02.2022 18:09, Jane Malalane wrote:
> >>>>>> On 14/02/2022 13:18, Jan Beulich wrote:
> >>>>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> >>>>>>>
> >>>>>>> On 14.02.2022 14:11, Jane Malalane wrote:
> >>>>>>>> On 11/02/2022 11:46, Jan Beulich wrote:
> >>>>>>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> >>>>>>>>>
> >>>>>>>>> On 11.02.2022 12:29, Roger Pau Monné wrote:
> >>>>>>>>>> On Fri, Feb 11, 2022 at 10:06:48AM +0000, Jane Malalane wrote:
> >>>>>>>>>>> On 10/02/2022 10:03, Roger Pau Monné wrote:
> >>>>>>>>>>>> On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
> >>>>>>>>>>>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> >>>>>>>>>>>>> index 7ab15e07a0..4060aef1bd 100644
> >>>>>>>>>>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> >>>>>>>>>>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> >>>>>>>>>>>>> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
> >>>>>>>>>>>>>                    MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
> >>>>>>>>>>>>>            }
> >>>>>>>>>>>>>        
> >>>>>>>>>>>>> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> >>>>>>>>>>>>> +    if ( bsp )
> >>>>>>>>>>>>> +    {
> >>>>>>>>>>>>> +        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> >>>>>>>>>>>>> +        assisted_x2apic_available = (cpu_has_vmx_apic_reg_virt ||
> >>>>>>>>>>>>> +                                     cpu_has_vmx_virtual_intr_delivery) &&
> >>>>>>>>>>>>> +                                    cpu_has_vmx_virtualize_x2apic_mode;
> >>>>>>>>>>>>
> >>>>>>>>>>>> I've been think about this, and it seems kind of asymmetric that for
> >>>>>>>>>>>> xAPIC mode we report hw assisted support only with
> >>>>>>>>>>>> virtualize_apic_accesses available, while for x2APIC we require
> >>>>>>>>>>>> virtualize_x2apic_mode plus either apic_reg_virt or
> >>>>>>>>>>>> virtual_intr_delivery.
> >>>>>>>>>>>>
> >>>>>>>>>>>> I think we likely need to be more consistent here, and report hw
> >>>>>>>>>>>> assisted x2APIC support as long as virtualize_x2apic_mode is
> >>>>>>>>>>>> available.
> >>>>>>>>>>>>
> >>>>>>>>>>>> This will likely have some effect on patch 2 also, as you will have to
> >>>>>>>>>>>> adjust vmx_vlapic_msr_changed.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Thanks, Roger.
> >>>>>>>>>>>
> >>>>>>>>>>> Any other thoughts on this? As on one hand it is asymmetric but also
> >>>>>>>>>>> there isn't much assistance with only virtualize_x2apic_mode set as, in
> >>>>>>>>>>> this case, a VM exit will be avoided only when trying to access the TPR
> >>>>>>>>>>> register.
> >>>>>>>>>>
> >>>>>>>>>> I've been thinking about this, and reporting hardware assisted
> >>>>>>>>>> x{2}APIC virtualization with just
> >>>>>>>>>> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES or
> >>>>>>>>>> SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE doesn't seem very helpful. While
> >>>>>>>>>> those provide some assistance to the VMM in order to handle APIC
> >>>>>>>>>> accesses, it will still require a trap into the hypervisor to handle
> >>>>>>>>>> most of the accesses.
> >>>>>>>>>>
> >>>>>>>>>> So maybe we should only report hardware assisted support when the
> >>>>>>>>>> mentioned features are present together with
> >>>>>>>>>> SECONDARY_EXEC_APIC_REGISTER_VIRT?
> >>>>>>>>>
> >>>>>>>>> Not sure - "some assistance" seems still a little better than none at all.
> >>>>>>>>> Which route to go depends on what exactly we intend the bit to be used for.
> >>>>>>>>>
> >>>>>>>> True. I intended this bit to be specifically for enabling
> >>>>>>>> assisted_x{2}apic. So, would it be inconsistent to report hardware
> >>>>>>>> assistance with just VIRTUALIZE_APIC_ACCESSES or VIRTUALIZE_X2APIC_MODE
> >>>>>>>> but still claim that x{2}apic is virtualized if no MSR accesses are
> >>>>>>>> intercepted with XEN_HVM_CPUID_X2APIC_VIRT (in traps.c) so that, as you
> >>>>>>>> say, the guest gets at least "some assistance" instead of none but we
> >>>>>>>> still claim x{2}apic virtualization when it is actually complete? Maybe
> >>>>>>>> I could also add a comment alluding to this in the xl documentation.
> >>>>>>>
> >>>>>>> To rephrase my earlier point: Which kind of decisions are the consumer(s)
> >>>>>>> of us reporting hardware assistance going to take? In how far is there a
> >>>>>>> risk that "some assistance" is overall going to lead to a loss of
> >>>>>>> performance? I guess I'd need to see comment and actual code all in one
> >>>>>>> place ...
> >>>>>>>
> >>>>>> So, I was thinking of adding something along the lines of:
> >>>>>>
> >>>>>> +=item B<assisted_xapic=BOOLEAN> B<(x86 only)>
> >>>>>> +Enables or disables hardware assisted virtualization for xAPIC. This
> >>>>>> +allows accessing APIC registers without a VM-exit. Notice enabling
> >>>>>> +this does not guarantee full virtualization for xAPIC, as this can
> >>>>>> +only be achieved if hardware supports “APIC-register virtualization”
> >>>>>> +and “virtual-interrupt delivery”. The default is settable via
> >>>>>> +L<xl.conf(5)>.
> >>>>>
> >>>>> But isn't this contradictory? Doesn't lack of APIC-register virtualization
> >>>>> mean VM exits upon (most) accesses?
> >>>>
> >>>> Yes, it does mean. I guess the alternative wouuld be then to require
> >>>> APIC-register virtualization for enabling xAPIC. But also, although this
> >>>> doesn't provide much acceleration, even getting a VM exit is some
> >>>> assistance if compared to instead getting an EPT fault and having to
> >>>> decode the access.
> >>>
> >>> I agree here, albeit I'd like to mention that EPT faults are also VM
> >>> exits. All my earlier comment was about is that this piece of doc
> >>> wants to express reality, whichever way it is that things end up
> >>> being implemented.
> >>
> >> Oh yes. Right, I see how this info could be misleading.
> >>
> >> How about this?...
> > 
> > Getting close. The thing I can't judge is whether this level of technical
> > detail is suitable for this doc. Just one further remark:
> 
> Unsure too.
> 
> >> +=item B<assisted_xapic=BOOLEAN> B<(x86 only)>
> >> +
> >> +B<(x86 only)> Enables or disables hardware assisted virtualization for
> >> +xAPIC. With this option enabled, a memory-mapped APIC access will be
> >> +decoded by hardware and either issue a VM exit with an exit reason
> >> +instead of an EPT fault or altogether avoid a VM exit. Notice
> > 
> > As said before, EPT faults also are VM exits and also provide an exit
> > reason. Therefore maybe "... and either issue a VM exit with a more
> > specific exit reason than an EPT fault would provide, or altogether
> > avoid a VM exit" or "... and either issue a more specific VM exit than
> > just an EPT fault, or altogether avoid a VM exit"?
> 
> Yes, that's better.

I would avoid mentioning EPT, as that's an Intel specific technology.
Could we instead use 'p2m fault'?

Thanks, Roger.


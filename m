Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EBD4CA813
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 15:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282279.480949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyN-00017S-V9; Wed, 02 Mar 2022 14:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282279.480949; Wed, 02 Mar 2022 14:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyN-000122-P4; Wed, 02 Mar 2022 14:28:59 +0000
Received: by outflank-mailman (input) for mailman id 282279;
 Wed, 02 Mar 2022 14:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPPyM-0000Xm-3E
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 14:28:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1807c870-9a35-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 15:28:57 +0100 (CET)
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
X-Inumbo-ID: 1807c870-9a35-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646231337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+2Ei8EBR9EXf62Akrk8b2opcb3IwuX8/9v9H3NAEkMw=;
  b=WI7WAmhK6GtvoM5e5DvoTWKt2tcUAKshQh0CQQ2XX0Sz6bb+QRgZLUkd
   LyL3230EwEzCRClrTMszUUXuxrlqMIZN33j7kda91o1ycvA+TBoh7i5i+
   TeY2f/Mr4ivTZWyZjdUxJRcVrlHa7GVid6xlT0S31aYg16tFH8l5AcRwe
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65302964
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5zgw/asgTawbLPKrt6yY5HsbuufnVJZeMUV32f8akzHdYApBsoF/q
 tZmKW+OOP7ZajOgeNB+a4izo0IHuMOAzYRmSVBqqC01Hykb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV4
 4upyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8GBZ/3gsoFeSBSAiguL614x+bgMHKw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pFBM2sxMHwsZTVLZngMC5sxnNyxpX7/WmEJtAK/tYsotj27IAtZj+G2bYu9lsaxbcdImkeVo
 ErW8mK/BQsVXPSFzjWI6DS0j/LnliLnQpgTBPuz8fsCqFGUy2YeDDUfUFKppv//hkPWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6waL0KPYpRmYAmssSSRIY9gr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9AlQwXjUqVSE86cjq8JMzsC2WacdpH/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxasYdO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb+Jei8AxkkfS+F1/ronxezO
 ic/XisLufdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxLOhj61yBlyyPBlU
 Xt+TSpKJSxAYUiA5GDrL9rxLJdxnnxurY8tbcqTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4EX/ZmPy53CbWkCgGOqNZ7BQlTcRATWMCnw+QKJ7XrClc3Rwkc5wr5nOpJl3pNxP8OyI8lP
 xiVBydl9bYIrSafeFXSNys6M+uHsFQWhStTABHA9G2AghALSY2u8L0eZ90we7wm//Zk1vl6U
 78OfMDoPxiFYm2vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:niDfga5jbz13fQLliAPXwSqBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsiaKdgLNhQItKOTOJhILGFvAF0WKP+UyDJ8S6zJ8n6U
 4CSdkONDSTNykCsS+S2mDReLxBsbq6GeKT9J3jJh9WPH9XgspbnmBE42igYyhLrF4sP+tHKH
 PQ3LsOmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZVbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczIgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenEPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tpt+CVQpAZEyHsHceg22w
 31CNUZqFhwdL5lUUsEPpZ4fSKWMB26ffueChPaHbzYfJt3Tk4l7aSHpIkI2A==
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65302964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPV0nWT7i7y75krwemeZicgBtQF1mEe3PWNQglr/q/FJ1fsnJhtaJfsUvSah2mvRnfHHUIVxZQqznZ8zU3jTlPGWpCgb9vhuYhyDl8NMpDQuVdg6HiUJycoMh/jMPP0EnBm+FmSJ1iVyPpVrer7bp2CiHjr3iSQjs7c6OGrxg7UmxwlKmCnHcjGlR0v5gjbhe+eHrHpV74yST1y7wqgFr6Gph9n2KZb9mr3ePRT8ARXzVVVUqrQ+AvyEuXkhgwnHaAchSII0wplUgkeIwpDn/C+0FVkihwK81imopDHsgleCVm09DruV4dDJ9yWu4OU44AEBF7X3maJXnMcSsul13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVs0N4lrLYXtidMdZMljGcSKcwUkd/vbtt8k48wXfUA=;
 b=oKUI65qG/dP+o/mz5NhWujjQ9uJwLtAtyErfytgAC+TWjuW4KaD5ZYeCCfMFIhhREJNLEMSrQfawQ0WdxYbXFh+NnsOVtVubTyOmFvDwopX/H2LGqXPjCQSgyG3XmH9rzhrMAuIQgJVXRLw8g6xBE/nWefQkzklzwrIHvzfHn+ZvDVHJ8WUAQYoNCarlbJRG519VHt7+Aqa0sYVN8GuOEwiCcDfUEZIT4yqaMuht3VPfFs42tmS+d4kJLSPsRijdSc7sgVLu34stnnHSp6KIRQ2KIxzcbk6s3VrY82GXqeGbj8QjDRTq9RXfhxZyfUw/kDlclrscP6m2eJFcV8F+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVs0N4lrLYXtidMdZMljGcSKcwUkd/vbtt8k48wXfUA=;
 b=ij3Y8I/ggRgq8NQSGNeGQK1s9zrOK5FDDgD+rKr3OqYlR4ISSADi18H24SQzngr76kgd6W49RXX9JdASnBi+YH+OOz77MS5QL8gArS4fgFq5FeC1UdRXexTSpGYQ2YFx4imtcM7vgooKtSZ12rh7ASF+XplkdiPrxL6ty2daP9E=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <ross.lagerwall@citrix.com>, <konrad.wilk@oracle.com>, <doebel@amazon.de>,
	<julien@xen.org>, <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrrix.com>
Subject: [PATCH 2/4] livepatch: improve rune for fetching of Build ID
Date: Wed,  2 Mar 2022 15:27:09 +0100
Message-ID: <20220302142711.38953-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302142711.38953-1-roger.pau@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e0fd313-af34-4a09-514a-08d9fc58fa85
X-MS-TrafficTypeDiagnostic: BN6PR03MB3330:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB333009CE79B58F65FACD3EF08F039@BN6PR03MB3330.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHxr/jeYeXBVgkmZf2KqO+MKOrRLQaY2KLg7oSCQjiuRN2PLPcZyItshcg0OSn0C7ppDBfGSUWvkTAHChc4/byvM/8tZJOjdJeMUn/ObVJno0io2NnG2GZATJpLIlW/j7a06/hSvcY1EK50PcmsV5Ky23iJmws5iJKDdsMPGdNxgT5YMvXUeP5K1yq4gG210TCCdpjIdFSr7SD271AqbWQ5J03lwUCusydoiEDg82u5qQffXecu9WeG6olrQIov+66dLVR/pgTuQrBh1nfUdeIWyF6DI3MAmct0tBqgRWKLMrhrV24KRcBF8NrebbBYl/C6Ckh5P/9V2slEuBizuSSxPFsThncjD79GK6fmdkts+j5pjj2nsCQ8JfUuxkvj+N+EQuRAfJN8K+dqcfZrt1V1YyQqbUPGmMx0XceMCaRzcXX+jvctHJl/KvHjt9/mcbCg/aXXLp86q72/BUPsWKojhlQ1N127QReXskXbngiUAFM/7r5AviRxmTSUROUw71Y6rPN+P8rMZm5zgZ+P2kW64Wu3CDgth9n5Mb30E6C0Jz9txXajKC/y24yB0EoqbkZ7m/dYxKlZgUZSvEUtnF+eIVdKESofFLAUR4JHjO/Yf8OuRGXt9YYi6MH/kLlB/Z6kX7tgmhNlWuFnNqHRNoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6512007)(6666004)(38100700002)(66476007)(66556008)(86362001)(66946007)(508600001)(54906003)(316002)(6916009)(4744005)(82960400001)(5660300002)(6486002)(8936002)(8676002)(36756003)(2906002)(83380400001)(26005)(186003)(2616005)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VElsWkJDbmp1WHRZMlZES3h0WG5yd3RBb0VBb1h4OG5TZmpkck0yOVkydnNL?=
 =?utf-8?B?TG02K0ZvSEZ5QW9qNXpVbzg0U0dOUndZSGR3YlZSeElpOWR0WGhkcFhhcTlx?=
 =?utf-8?B?UXV5WllobFFPTk5nbytNTnJQV1NsZzUzZ2c4S1pnbUVOMTVSUWFzZVNPN2k5?=
 =?utf-8?B?NlZoMTVaeXA2SE5ZUmhkRldDWXZxVUJrSFkzQjVCUjJ0ZFJhSDM5dncrMFZW?=
 =?utf-8?B?NlVMemdMcFNmZXBNV0lTSzRJYVZKVmlqdXVKa3VuWWxoNUdTYzZuaDFCSmFs?=
 =?utf-8?B?SVIxMS9tSUpOUWw4R2pRa1lmenJJR0RJN3pHcjJKU1A1bDVkMnRtKzBuL3F5?=
 =?utf-8?B?VlhPa1ZDQWsvTTBpM3kwYXRzN09iOUNDemZMa1BOSkFWTnF3clkvZzEwUkZk?=
 =?utf-8?B?ZWQ1SEhQUEZFbG1nT2VBZGJYN3dGeW5TZlQydStnT3MvOU8wVDQ4WUEvMzVE?=
 =?utf-8?B?cTZjNlY1NExpeERmeWZrVVllRk1EYVBmaTZ6WTZsNFhMNVUxc1VYWWV6eTZN?=
 =?utf-8?B?YWcxbUtESENmWkxQeFVlTGJRcWlHVGV5bXN1bHl4Z0RlTTRQMzNNTVJyTjYx?=
 =?utf-8?B?VzZiTHVvNGVZaStRQnkvSkVWQStBVmlyVXdsY3VDSGpuaytYcFpkT3FzNkR2?=
 =?utf-8?B?YU1icHFCYTJPTzBOU3VwU0RJMG1Qb2RLK3JnaGhjNVNUS0ZYcDVxVE9CS1hu?=
 =?utf-8?B?MWloQUhMMTJYcFV0blFLdis5aFBNdkFEam82UmRsRDlsSlZ6R25yQTNTZk1l?=
 =?utf-8?B?d2FLa1Nzc281ZW1aOWM2cFF0aEI4UWY0TmVQdVR4U1F6UkdpNFFPRDhLV0p6?=
 =?utf-8?B?ckRkT0tsdnNXL3FBVGI2NTd0d3JTVnBhTXpFRlVUa29weTlRRHYybkh5TXk5?=
 =?utf-8?B?L3c2OUhPU2tERC9paE84UEFFZytYK3hQbklIbGp4YVJkeHFyVVNyTGhqWVEy?=
 =?utf-8?B?bGpMN3U2Rnc1NlBWRFFBaVdrOWZGK2tRcHNtM1lEWXNSbm9pdnI2TDJIdWhT?=
 =?utf-8?B?VTBlOVVNVWJubTFLNHBMOGhZR2NNcTlJTDMycFduWTRTSFg1bllmT21lZzU4?=
 =?utf-8?B?SzlZOUlNYnpKdjR1TGNtNlZFVGM3SHVTQm9kVUpTK3RxczQyZVZFa3hqV1pB?=
 =?utf-8?B?eVZBaGQ3ZkY4WkFNKzdxNGJMWjllY1lncmZoUUVnSVdqdmhZeWRhYS9HYWNK?=
 =?utf-8?B?elN5Y3JsZ0NITll0SFhHRXRHMWxhQ202QkE0MVZJdTFwZytDZWJtNjQ3OGdl?=
 =?utf-8?B?WmJaVURGVmFVYUFBekQvZndFTUE2ZTJwRVJhdlNRQWtubk9tZXdESWh0UGdD?=
 =?utf-8?B?REFweDVOQmszakRFL3ZaY21hbXpvaGRUUnVUMTg1WDBUZEszckZBVUhmdVA5?=
 =?utf-8?B?T2RFTFhzaERXR0ErODJsN3NtaGkzbzV0MnJFRXFlb3dmeGlGSStWSyswKzlY?=
 =?utf-8?B?a3IybWN1M1hyM2ZJemliTHBJNUJ2aEkrRmhKeGg5MDRSVHZkU3ZidlVXYkw5?=
 =?utf-8?B?N2NZUE9EdUNwK3pGTzNPdXJINzlveUc0SHJKa0JnL2JtZ0Y2L3JiaUJCNVps?=
 =?utf-8?B?citlWjAzRFlFRnFRanprTnRoRHhHdWltUHJzc010NWFvTnpLYmhuMVpabE9F?=
 =?utf-8?B?QW1zUUFNNFJsMmJYTTlqTy94dldLOFpUOTVFK0t6enVnUFdoRWhFaVpKeDlP?=
 =?utf-8?B?cE1HTDV3cjcraWV6T2Q1NUVSWGZ6TkR5V25VUUc2UzZtcSswVzZWMDJ6VTNi?=
 =?utf-8?B?cG0zSTRISWlpVlg0dVdZUDhUNW1UcURJaVlHTzA0K3BBZG5MeHJlTUVHUlhB?=
 =?utf-8?B?TXk5ODFUMThkOEE4VXYvTmsxbzBnUkw4TlRoRk5UM09BQ1g2cUNkVzRsSFRV?=
 =?utf-8?B?eDdYMjdVVmtDR2d3VEFMVlNXdW9vNGxMQzRhNXB6QVlLbU1UTlZLZ1E0TU5T?=
 =?utf-8?B?a0IzdVlEWGxGeC9TUTQ1UjNyQk42RTN0ZkM5MzNzT3E0RG9rZkJjTk5kRVlo?=
 =?utf-8?B?RURscUVqL3VNVE5ROERPQ2NqOU9tMnJsQUdSOG1NQjlJREdqNUdDcGF0bTVE?=
 =?utf-8?B?QjlMZW51NnpSVk5zSHNBUFFGbmVJMHZwTU03ZFVIeVhoUlUwNUtUTExIMFFs?=
 =?utf-8?B?NWxXNnZxVkQ5cTMvQUg1M1BMc1FYelhLcEZtTk9mbnZEdVBudmNIK1krNFRu?=
 =?utf-8?Q?oprTZ5Go66GW/lgWyfWWSo8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0fd313-af34-4a09-514a-08d9fc58fa85
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:28:54.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaSaXaRePQGkcG0cwoIQKEJyGsOB7kqo+W2a6RYpSzDq/xsBLtnRsQTeQsqaz/D2BKwGO6dTYj62YzPgWl4g7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3330
X-OriginatorOrg: citrix.com

The current one is broken with my version of readelf and returns
'NT_GNU_BUILD_ID'.

Signed-off-by: Roger Pau Monné <roger.pau@citrrix.com>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index b48a3df..948a7de 100644
--- a/README.md
+++ b/README.md
@@ -16,7 +16,7 @@ $ cp -r ~/src/xen ~/src/xenbuild
 $ cd ~/src/xen/xen
 $ make nconfig # Make sure to set CONFIG_LIVEPATCH=y
 $ make
-$ BUILDID=$(readelf -Wn xen-syms | awk '/Build ID:/ {print $3}')
+$ BUILDID=$(readelf -Wn xen-syms | sed -n -e 's/^.*Build ID: //p')
 ```
 
 Next, build a live patch, using a patch and the source, build ID, and
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963484CD090
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 09:58:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284071.483208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ3l9-0007Fs-6P; Fri, 04 Mar 2022 08:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284071.483208; Fri, 04 Mar 2022 08:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ3l9-0007Dx-2u; Fri, 04 Mar 2022 08:57:59 +0000
Received: by outflank-mailman (input) for mailman id 284071;
 Fri, 04 Mar 2022 08:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVQB=TP=citrix.com=prvs=055bc9087=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nQ3l7-0007Dr-5X
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 08:57:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d6972e3-9b99-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 09:57:55 +0100 (CET)
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
X-Inumbo-ID: 2d6972e3-9b99-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646384275;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Wvq+6bSblD3LIucltOo+P5wbM9LUdG1cgVQc1v+f8PQ=;
  b=eBhOegcXB4JFC3KZBbdhoyKGrMR7dQnFvCq9RtdDGIPpfdbCSjDxW0sc
   tmW31eGFWgE0JifY+q7uITimzEQDftixGjYKiCYLxoKp1jvzjuGhXDj15
   s9Lfd9zKyzL8uJ97dTceWcoVvs1D+AZWN2nT04w1tBfise7F26vSHYvMw
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65391214
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dashuK48PEpPmOE7kWebagxRtC7HchMFZxGqfqrLsTDasY5as4F+v
 mIbD2/UaPmDYWumL4x1Odjn8EwDvJ7Wn4VhTlc+rHw2Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPhX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSpZFwDIqiQld47CStyHg5XII1vwLv+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQK2PP
 pBANVKDajyefxxzFH1UU6g+s7u0g0iubT1Ro3Ga8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc8N9SMcm7V2A8IyO0SyUKUEZbhd5bOVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iJsdy+2trxmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8iehwyaJdfIWG1O
 yc/XD+9ArcJZhNGioctPuqM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlOniHqdNIdAtSRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:9BxdO6EPPZ2y+yQ3pLqFBpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcV2/hqAV7GZmjbUQSTXeRfBOfZslnd8mjFh5JgPM
 RbAtlD4b/LfCBHZK/BiWHSebtQo6jkzEnrv5ak854Ed3AVV0gK1XYBNu/0KDwQeOEQbqBJa6
 Z0q/A37waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosPD30E1wsa7VcKM0lN
 gsAp4Y5I2mcfVmH56VJN1xN/dfWVa9CC4lDgqpUCHa/ec8Sjbwl6I=
X-IronPort-AV: E=Sophos;i="5.90,154,1643691600"; 
   d="scan'208";a="65391214"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOLAB5pDmNIk8QL3JxcnE0uFq5xePPeBI9p6Rb8Yq+GFmZumOWwxiWyIeSCy/C/H2TkIvKCcE4KF8Ay5NjnS0BUZnU44zC9Kxe7ELW0pgTo4AEtvK93sEunCXo5L5SugVLlspX55AfTicuAcmYbHPsGD48bGIBwEHrUAWF8GdsYX8MlYYatkAb2OKjpq9O3vz2eejy/8r91kBQ8Il3VqWFBhJ5LXLLMD6U4pzt6QlAyUSRPIG+HU+T840lFylkIA/wlYVP/ZKTayHKpexr5IpG/OiSBy163vLQsnJvAJim2c45O/PB4SP8atBIoq8K8z3oF8yfYHQD1E7wDkM9R6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wvq+6bSblD3LIucltOo+P5wbM9LUdG1cgVQc1v+f8PQ=;
 b=Efp1eoHcLCLdsPtR3uuTftxl+h5lmN+DumepUN/WtWIxkKKcqFSzoJdAywqYIHUywj0F6FqytcfWXiddpFoRBaYoIiKbiMkLhP7bfJyYqB0+oNa6chYnqx3Ho33xUbrysERbLTshG6sJiWKrkGwU8Q+O5eEkviksj/z8yxGa/2R7JAIDd2uGDfNmX2IQ1MfAo//B3NUvMoAM2WPK28tf76b1kT0CJZHVZ/bTnFxfeVL88b1wcPAoCEE24SM5KeUu0ghC6FMeaE7MUW4r268u80g5X1H2kJZGDPy1jAmC02B9/SUNtbBT6kd/aybF2nRS+Y21Wszc7zrTUDxS9RI9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wvq+6bSblD3LIucltOo+P5wbM9LUdG1cgVQc1v+f8PQ=;
 b=gGZjGnBS0bxdQoII8OQSiqbq1+MtF6pDETWQ3TiV0dTkqHtk0cCeH9Lyw8eaj2hmNrWx+NCjB3nKWnei6AAiHN5hbKeyQ7rghF5I/xV2cUKjeEis+eFArChrteEZvVEaRbMiDPF2q8X2uFRuwcFQz5YuzPv4/eKqEuJW8BSVduw=
Date: Fri, 4 Mar 2022 09:57:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: also discard .fini_array in linker script
Message-ID: <YiHUgkdkp4NFW4Lz@Air-de-Roger>
References: <2a9061de-3d68-20f7-75b9-b1b9491342f8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a9061de-3d68-20f7-75b9-b1b9491342f8@suse.com>
X-ClientProxiedBy: PR3P191CA0049.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf9fc8f0-fc47-427e-3eb8-08d9fdbd0e65
X-MS-TrafficTypeDiagnostic: MWHPR03MB2512:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2512DD7D2D411E49B95DD4F58F059@MWHPR03MB2512.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z6vNNOaY6F+cwr7HzjmM/7p+O1D/mLhu3zlPx6ofu9gNHUWClnvtm744ng+0re6p7GZj50EG51sl1XDbPJNG1hXQ/gOme4y9ico7I4lopMRXxXSXAGaZTM0RGer7rlbjULrdzemKPQWVxLWTjHM1AxHxnZ5gXCqCUDmjLp+ZU7MpEqUV+iR7xnF1I/PZCJ9SscQaQuuq2bz3G0VXKuZjtb+Wv6UBU8lX9kWdj4wO7ToyRQ5kjfUA6I2K90RhjxmfDScGQZmYkHp9C4nOaBrf5eT9LoRJT0rsrJXJBok/oWbnk3gyC362p00yOK2gcqDTYkIA/lHGw/391YpRcbgMbw80lfjL8Ws5vRfIUhEapbhZwxg2c88L5bLVZHxud3DiQCgEFBMoBmikg+PgZRLKVP8egaEA4zeOnzq0Fwcy0vEXrVa1rjDou3JHDA9AbgDEDgWX1D7ZOJM7t68GPu+77ghr0wE+jbj4NlTzbgXjcIFdl1zcOI8SEDlXuC6+oro6r/WIk+t4jpsBvG8Cxv0l9AYPpf4DgofPYCgCJFSKLu+RITh+9+zb/DbTUFhuF38WbLadEEaQRJW5CueXK1K1YWoqeSKf8OSMCJzIAvMBQPea3lEgTRBRzWHocMxpMuJkTlM2WdhyFXl7EBGVNhYGheOdqGbMbs2qEKObFqb6rvKBu0ImLpd6u421s0HlrQzAoYObdCdKKeAbA3GvTPRGiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(85182001)(5660300002)(6916009)(316002)(33716001)(508600001)(54906003)(66946007)(6486002)(66476007)(66556008)(26005)(186003)(8676002)(4326008)(86362001)(6512007)(6506007)(38100700002)(2906002)(6666004)(4744005)(8936002)(9686003)(82960400001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWI3UzM2ZXFUQ2xxZFQ2TjdVTXV4MnBDQmdxeFRXMHFqSjNhUkE5ZlZUaDA4?=
 =?utf-8?B?OG11YlVlcmVMZ1ovVmxwTkg2RjFDd2dXWGpldG5Ka09WYXlZeHFzSkhYa2s3?=
 =?utf-8?B?bEZVbDBUdUVqN01Xc25OS255MXZIQm5rVlJ1K3BiWk42YU1ueFhBT2RDNFFB?=
 =?utf-8?B?WkdaOFlzdTRCb1V4OW4ydExqU0kya1NGWjlQZnhwT3plNEd5bFFrbzZ0MUxL?=
 =?utf-8?B?ZW16NDhUdXMxcEV4UW5zYWRoNnB0a3dGRnpaQ0Z5bkVERWxtUHdYTFAzYzUw?=
 =?utf-8?B?MHJDUXR5VFNpb2M4WnFTUUxXN2diNTJCeDM1bDBFbVE4a2ZKMzc4Y0dZcFky?=
 =?utf-8?B?anZULzFZVjdac1pGdlpJeURHZm45c1Q5UG5BKzFhMDZGc1BHUkt3Q3g2aDF5?=
 =?utf-8?B?UmhxRm5Qb1NPTmxMeVJ1YnJMcXV1YVdkc1R5OEdkVUtEWW9vL3pnVURFb1Zh?=
 =?utf-8?B?QlhZTjhLTEFLM3VqTnVFSEpYZG1MeWJGRTJ4Nmw5R3NrelJHQnhESDN6LzM5?=
 =?utf-8?B?OFVrbERKUU1STHRXUmFPRUZKWFpvV3ZPanlHbEJFam9QcVUrREYyVHo5NFNN?=
 =?utf-8?B?UUJ6QUlLeDJaRkErd0VQUEwyUHRrbUY2aEFlWmpWdnlFa0ZTL21BaTI2ZCtq?=
 =?utf-8?B?eFEza3JhbHI0YisyQ1R1UlMzelo4dlgrUjk5VjIxL0piSzA1M3NtRG9zQ0gr?=
 =?utf-8?B?V0pHZVVpa254TFI0N1pid1lHZzR2b2NEV01SbzM0VldWQnBXTU4yYTUwZ0ls?=
 =?utf-8?B?YnpSL1NsS1FQcDk4S1FOUm93UWI3VjZEVGxBazNZTnJwWkM2YitlM3ZuS0R5?=
 =?utf-8?B?Ti9jYVhTUjBhcnhBY0dTZ3dqZ29QdkY3dEFpOUl4Tk1tL29sWjR2MUdocS85?=
 =?utf-8?B?bHNRUWN6TWlDY1VRN2FBT1VLc3ZoeGpmRFFRQmJQa0lqTlJDY1JzdGRkZWRo?=
 =?utf-8?B?MEZzb1pyd1NKWndTdGkyVGQzUklOMTFOdzk3Z0VmL1d5UUk3aUlWdGFnTng5?=
 =?utf-8?B?SFF5M0tDekZQZE9qSTZxRG5LSndyRU1IODZGdkJsemoxaklITXpZZS9nbUFp?=
 =?utf-8?B?VENpL04yV0Z0S2FuZW1XOU15eDNHSGwvdVlZRmNsWi8zMXhDZUJYZ3hwcW5Z?=
 =?utf-8?B?OWdLLytIYTA3NUJMUWlQQm9jWG1lZDFla0VKTXB1TjRxSC8wK1Q4NUh4eGMr?=
 =?utf-8?B?RnVtTDFtdWZFVHpCM0hqMFBhdHdLNXd4c0wzSUtWbDNnVXFlRlh6QnJYZlVM?=
 =?utf-8?B?cTE4WGNmR1IwaXVSbDB4ZXVabmpKWUFrVGR6UXRycnJUTlRYdzJrNjFsMkp3?=
 =?utf-8?B?cWFLQkNxQzZsbHFhckVJVFVCRVRiQ3haMDR6Zm4vQzlleXM4eTlVdE9WcmdL?=
 =?utf-8?B?YzB3UkJUWmNrT21HN3ZucFpQUEhrb0tUaXVyQU5MclI3bHhnWU1mYzRsQW9R?=
 =?utf-8?B?dVRtWkJkdjVNNkFpdzdBbWlzalZsdkJveFRsZlZXN2JLQjBNNlVselNJVS9l?=
 =?utf-8?B?QVJsK0taYjJXd1IzMk5mcXM2bWhhMGVZeitmUlEydGFaSXBXS2NaeG9uQ05T?=
 =?utf-8?B?UDlVVVptYTI5VTB5NGtXc2ovYUFCNkxpODFGb3k2elNISlhnazMxOS9RZ09W?=
 =?utf-8?B?Mkd4Q0xrQmFCRDRLbk4rb0ZhSFBaUGE4eVFtUURFdFo2OVA1bmlTcHBNcnkw?=
 =?utf-8?B?dGVXZmF2czdNZHZZNWxqMTh1OWswYUhkR1c1MnhnU25rVmlWR1U4VGZaUjRk?=
 =?utf-8?B?Q3p2MzI4c1cwQ0NNUVRwNHpuanN5Zng1dmZ6L2Z2NTJaMnJWWFZBV1ZFUGhu?=
 =?utf-8?B?d0paZkRBYS9nWVpWbGg0amdPL1Fwc1dlNisrbWFXU25OMThFdnB1U01sQnc5?=
 =?utf-8?B?V05MTm1lWTRJL2tmVDFHRTU5NTN1SGpOWEdnWldOS3FLb1Rmc3crekxDQUIy?=
 =?utf-8?B?WUxvajBKcE9Zb0pXdHV1Rk1QeUJZaWhwMUJwc3QwZzFYSkd6WGp4bVhCeWZR?=
 =?utf-8?B?TTJGd0NiOStWQnd2M2VBaVRncDEyT1BTejZZR3dqb2dLRTYwL2NmUzArSVc4?=
 =?utf-8?B?UTlsS1JYU1ArZmZzeHI2eGE5MkluZnZINHhWV2dQUjBscjF0UkNKMHZVYXJT?=
 =?utf-8?B?Z0l5eHoyd2FLNDAzQjhGTFZwNlY5UjJFNU5BN25KZmRmWitOOXRJUzVoMUhU?=
 =?utf-8?Q?p+DqdZNY5WazJzjzQSgoxOw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9fc8f0-fc47-427e-3eb8-08d9fdbd0e65
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 08:57:48.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zziUqg5frrfIcZWnqXKw5ccivX54ln8g7bXSnIgx0cELJMZwuGaeHnwrI1P999ddmhqhVCpp6a+u2vBk7ST+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2512
X-OriginatorOrg: citrix.com

On Fri, Mar 04, 2022 at 08:49:39AM +0100, Jan Beulich wrote:
> This simply parallels .dtors. Both section types can reference
> .text.exit, which requires them to be discarded together with that one.
> Compilers, depending on their findings during the configure phase, may
> elect to use either model. While .{init,fini}_array look to be
> preferred, cross compilers apparently have this guessed, likely
> resulting in a fallback to .{c,d}tors. Hence we need to support both
> sets.

Do we also need to consider discarding .fini? Or that's guaranteed to
not be used by the compiler?

Thanks, Roger.


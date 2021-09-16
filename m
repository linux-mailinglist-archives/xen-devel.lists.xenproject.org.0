Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8F440DADC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 15:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188468.337629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQrDV-0006rB-SZ; Thu, 16 Sep 2021 13:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188468.337629; Thu, 16 Sep 2021 13:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQrDV-0006p8-PI; Thu, 16 Sep 2021 13:14:17 +0000
Received: by outflank-mailman (input) for mailman id 188468;
 Thu, 16 Sep 2021 13:14:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6X0d=OG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQrDT-0006p2-Se
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 13:14:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16a9b1af-94d8-4b65-b3f9-db6ebdd2991c;
 Thu, 16 Sep 2021 13:14:14 +0000 (UTC)
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
X-Inumbo-ID: 16a9b1af-94d8-4b65-b3f9-db6ebdd2991c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631798054;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SOPXitM913DIQoRdH+dva/QNVVqNRaWpprWx7cSzCUg=;
  b=ibG9doECk3/TuY57HYUgh07XkjWJvirMslny+D4+yh/H3nEOb8dFsYyV
   IHNDa0t+vuIGYLfmWhmITD5Od8+WbcbDwvRcoV5Ab6HEW8DLdCAdhM8f6
   DeacB+8HQT5ok3QWeic1dfvBGcc+OyPH2HvwsYmFwnvhzQ6YHQDLtpUUk
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oW5rQi6Uoj8yvAyG/Z05o7vFxqbxhBDcciWdfMmU5vVLKy7CUM5To9io+pGAoCFHY7BDnF6LWS
 8jnjpZrDbXMrwvcgqu1OaBLsRbncO8aYwyjF61xwoqMHG9+9koKGIx1Ni/Cu3Ccy+7LyZtmIlK
 AJped7FAIK2zEuHnbmxiZrzdrMvD+n2oYhygZWY1UNzwxyBeNb8QTLjRJi0ldOcAdqutIErWgK
 K/vS0awPdwdLo1YrChnuoi3MDW2KtCd46JyPdROvQ4NutU2Da9CKtFJsiJQDJQjTc5RdTw5V1Q
 M6/h/NmaUjsa3i8zmkaPvvpN
X-SBRS: 5.1
X-MesageID: 52876676
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wlqu0aC7Ce/7BhVW/7/kw5YqxClBgxIJ4kV8jS/XYbTApD53gmFWm
 GcWXD3TOf2PZmL2fN0kYYm3oU1X7MSGz4RmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w0Ew7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/2naVoMt0j
 +d0tt+gFQIMZIzgtPQhTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHv+auoEGg2lYasZmLMjee
 c9ITwRTKyvLPU0UP0YeMo40tbL97pX4W2IB8w/EzUYt2EDI1xB42rXpNNvTe/SJSN9Tk0Leo
 XjJl0zmBjkKOdrZziCKmlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRokyjX9NSL
 WQE9yxoqrI9nGSqVdD8XBy+5XKBvwIGSvJBGus25RHL0Le8ywSTC3UATzVBQMc7r8JwTjsvv
 neIgNHBFTFpqKeSS3+W6vGTtzzaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OP/2kuLuHHbC+
 jPJvHQ7ou8yoeIb67ruqDgrnAmQSoj1oh8dv1uMBz/0sVwnPeZJdKTztgOKtq8owJKxCwDb5
 SlawZD2APUmUMnV/BFhVtnhC11ACxytCzTanVcnNJ0o7T3FF5WLLN0IvW0WyKuENK85ld7Vj
 K374lg5CHx7ZiLCgUpLj2SZUJxCIU/IT4+NaxwsRoASCqWdjSfelM2UWaJ144wLuBN0+U3YE
 czAGftA8F5AUfg3pNZIb75FjNfHORzSNUuMHMumnnxLIJK1ZWKPSKdtDbd9Rrlit8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnmBhYDmQag3CaeQehIA1g6AI7SsV9EhStTFQQnPEqy2mhlZoCq7awFcIAwc6Vh/+tmpcOYh
 dFbIJvo7i1nRmuV9jIDQ4P6qYA+Jh2niRjXZ3iuYSQlfo4mTAvMo4e2cgzq/SgILyy2qcph/
 OHwilKFGcIOF1Z4EcLbSPOz1Fft73ITr/1/AhnTKd5JdUSyrIUzc37tjuU6Kt0nIAnYwmfIz
 B6fBBoV/LGfo4I8/NTTq7qDqoOlT7l3EkZARjGJ5reqLyjKuGGkxNYYAuqPeDncUkLy+bmjO
 roJn62tbqVfkQ8T4YRmErttwaYv3PfVpudXnlZ+AXHGT1W3Ebc8cHOI6tZC6/9WzbhDtAroB
 k/WootGOa+EMd/OGUIKIFZ3dfyK0PwZl2WA7fkxJ0mmtiZ78KDeDBdXNhiIzidcMKF0IMUux
 uJ44Jwa7Am2ixwLNNeaj38LqzTQfyJYC6h35IsHBILLixYwzgAQaJPRPSb6/ZWTZogeKUItO
 DKV2PLPirk0KpAuqJbv+awhBdZguKk=
IronPort-HdrOrdr: A9a23:diBGiKD8UebtnerlHeg3sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dCsai6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsMmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZTbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczOgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxeokPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesXMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO11GkeKp
 gsMCjg3ocVTbvDBEqp+1WHgebcEUjbJy32AnTr4aeuonxrdHMQ9Tpv+CVQpAZGyHqRI6M0kt
 gsCZ4Y542mePVmGp6VNN1xMfdfNVa9My4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.85,298,1624334400"; 
   d="scan'208";a="52876676"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moSY1Dr4eGwyAHCgh6vfaRsX/x0mBD5S2K4HD4U0esPZotWhNopalpb1IKGMx09HSqClDBoZGVyNBU/U5FX16tpEQlhBDHDn7iJLbEt7xhX78HpaH7ajnrFMzvkwYCybLoc72HjoJ1bBT9Yp7kDawThvvKlVg8vpwXD+KVAuIrtHPCOdu+detXtU8Zuk0h2A7inZKgE6aJBjrHbFhwNnkgRmaEKnx3vmY3TyTdqKx7kzLtfnyebQgtSX53N8232hhb4yHOs1ZYPk+RuKEZz80ih6u4mdLKXyLici5kYtiQp4uNUZA8Xec9aUKk4o4+GbbJKD9fsGXbvAlYMZFBiNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zKZBz67gWrmfGh5fqXsQOaiN41yOf90IY5B3x2Hnsos=;
 b=LBkRAmcSeOFphr324EuqoDhPlMN4ReZAGm4nu8PW5Etpm0PPITDyAKzKQo0y9SqBK/WpFFdn3BEQ4zlzwuW7itwwzWBKZmtVbP27r7OhaEeHDzviWlPPpGjNGNbFgE4r9y83cxL72O6S0mxRuyJxQb6NRVmWnvjtl0JcGLfnjbqTU4D8a2I5USS0XdXiiHYOKZG1I/mgNS9fb6spjImF4j4oei3Yv5Rx7JVxrBTaAMlPcJlXgGXIjV5bIbVbnWJQOEEIoCdPjV8ZX9xI7TmLfaiLyEcXGBk2J4mNSIo6KgQDuhlrZEMO1egcalqA3OMuKRRoM31RdlSHIQAuxu9dOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKZBz67gWrmfGh5fqXsQOaiN41yOf90IY5B3x2Hnsos=;
 b=bn3iOYfRBS5ZEtSxoircAruWTFKtE+ln96ySgF8gRkYEiHodxZU2lKumaQA/1+XynsBcJaeTp8dBj953/b/t9G/soVCmCZGvUOgLJNwGIU3shB6MXY+ma6dr/O7ek3rP7faaqhiqB20sZCDlJjDSM+J3tAXQaVHKZf/ofuLQIj0=
Date: Thu, 16 Sep 2021 15:08:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
Message-ID: <YUNBswZ3rAFeDa6I@MacBook-Air-de-Roger.local>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
X-ClientProxiedBy: LO2P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fecc8be-3fcb-42ff-86c1-08d97913071b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB528930F7E169D914C690718C8FDC9@DM6PR03MB5289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dMQyYjNy+uY3SEU6kiZQpmWCjJLn2diAVX19/pv/sSwmL9EI6Mk3iN6kulKBvA6tFKmaTrxBikiGz+xX47IQ2gGODYnEZmG1iB7s3HykPgTfjF2k0tclJuUDNBSvSNIzraaZc1JhMpbES1Ili46dmg5zsRcF/i9fgiA3sAyjeae0+0MSqwuXvHctPtYgbAiJBYodr1I0PLT+x4PtNogJwn/cRqyD8YhDiZpZ2vRY6wI9PIeCIaPCexzB6nXe3O6XF9I0TsBXgb0Pju/Ooo9gSeiwp7+nCpG2wjD8W4gfQI2aY3I+Mt1I4siOeXZ36/1axaKX/m5HFpQblssz4+5o/ZbRXFamvRzNA/PnAbbLaPgU9Vuh/lFSWeOVuLAneUCahV/ylIi0V5GI4M1R0SEOlZ3d7HtilswS23tkQ4IA97yL45Xq6Jb69p9qba/9Cmbga/XlIF0ZaQy2CEn7xO/AZa52t0wtI+qxAzPCE6ZJAxZkmm2KVg+WLe64iu6lyC4+86kU6R3ZQR0Ii35FjcM4MCJu1juMZJIPejMIlbah2YodjbK62HERUDywEbZxbBfHb5H3xP42E7LTpdtibJPFHWj8aMwOvVwVwFknGBxZIoEKZzHPlff5p1loLGD5pD3yWCOaLnN07Q5fcRE427Jq0ASW5XM06nYFNrYKMaq9SGNcWUHU+fu6EfkPaRjDB06Z7riOQbhDgswsPQBWzyivcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(6496006)(66476007)(66556008)(85182001)(38100700002)(53546011)(54906003)(4326008)(6486002)(66946007)(2906002)(83380400001)(316002)(8936002)(956004)(86362001)(26005)(5660300002)(9686003)(6666004)(8676002)(186003)(6916009)(478600001)(23180200003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmlJMDZZZ0lJMkZYV0FxaitCZjV1dVF4N29JUVpXNzFiaHJnSC82WXdKVTIr?=
 =?utf-8?B?NU11UHE0RTNZMFlyOWFkNGVFaXRvYmF1aFIvNVhDQnRqaDMyN01MUE9YbTJi?=
 =?utf-8?B?SGVhL2ZXSk9NaXlRaFRSSTE5MjloK2ZFcG9ROEhIbHkzcWtiWXA4L0V0Qmh0?=
 =?utf-8?B?SEUvb0pNandLR1MzeFhiQmdsMnVZaHB0ekdxMXRTUWFaUjdNRysrRlhUY010?=
 =?utf-8?B?K3VORS9JZUVBUmFCTnViYWdpaE9GRHpSdjJJanZXajUzekV6YjI3RDQxeEJM?=
 =?utf-8?B?QVgrTTAwRVllQTNZdWkzendzeWdRNWRtUTV6MFZrZ245MEloelByQXk0enM2?=
 =?utf-8?B?ek41QmRVNHF1Z1A5Z2FxRmdSbnJqU01JSEJDT3E5NURxUnVvbjhGWk82K3gv?=
 =?utf-8?B?d0x3cjZKMXNjS21vOVRFM09lWXdsSml0TS9pSi9SSTlEY2ZCSTR1UTV6N3RL?=
 =?utf-8?B?UjZIcHNPQmxYQjlWRU1LbjRwYXJzYmVBK21TNGUvbXBCcVlpRWw5L2loMVRV?=
 =?utf-8?B?V3hxYXlMbjRsemQyaGdLT21iV2hvbTZMR01oZVdMbm8wM2lmbVZkVWNEM0Z0?=
 =?utf-8?B?NHNkZDZ1VzlScUdWQ3dtT0R3L0h1MUluMUxqOUhTenlDdU15a3JDZzdZam9l?=
 =?utf-8?B?ZU4vSnEvUEtsVjZJVmZBd3RCdXc0eG9ITDFtQVBBcm5aeEE2WFRXencvNjlE?=
 =?utf-8?B?cEM5MGpyWmJkaDl0VDVKT2JkQlZ6dlprZ3BHS3pvV0t4R0w2M1k2QzI4R3pS?=
 =?utf-8?B?OWpNZzUzQ3FPV1dUamRCVjBFZ3gyMUI4aW9CWkx0TzkvSlpnemh5YlRSL3Vr?=
 =?utf-8?B?WSswbDNhRitiUm95b3pOY3U1eEZQZEthNVB4V2FCa0dWcDBRWEVVejM4QnBp?=
 =?utf-8?B?UGNtK0llMlR5QytERC9hdE4ydHlBRS9kUGZnSVVqTlhQRitOUURLb1UrK1Vz?=
 =?utf-8?B?UERhSUw5dkVaRCtUU2NvcnNpSzZKRlRYZlh4bER4bWdYYmVSRWNSM3ZPblgr?=
 =?utf-8?B?MzRESzY2WkxUY2hjYzhFYmdIQjFvS1VxazZCR1RmQXNQYVpmcXk0c0ErUVpo?=
 =?utf-8?B?V3dMelZUSXlYOC8rNGplQmV3U09mSHBmZEtMUHhoRGQxS3VyRUpKaUdOWjQz?=
 =?utf-8?B?UnNDSHVoc29YODJqbTNVTWJ4QzVqYkpCR0dTSVp2UTVZalMvZHM1SEQrWWFQ?=
 =?utf-8?B?cU9YK1VQblRvNU5pVEQyQkFvZ2hwaXhYenJNNlVqNTZMZDFRSERUcTRGbzcx?=
 =?utf-8?B?NmNWV3NQUGxoYlRrU21Bc1Z4S1R0Z3hSVWlqWHRDU2UwR1dQUjhpQnpwdk9E?=
 =?utf-8?B?K3dReWlOUmdMbkVwWEJnTjVZYU5yN0Q4MTllMjI3NUJReElaRDkycSt4SkdB?=
 =?utf-8?B?NWFReVdNempCOVIzSFRmdDRWSFlkaEI0TkV5Mkluek1LZUpOYzJCWlg5MS84?=
 =?utf-8?B?TW5ROTR1YldoMmY5aE1nUEQwOTh3VENQMFFGWDhoZkJvK3Z1WWVLRUlvaU1R?=
 =?utf-8?B?bnFmaW03YktLTmsrYmZYamlZQ0Y1ZDU2a0RRanRWYUp1dTRlbThOdCsyZktM?=
 =?utf-8?B?WTErS2lxcW82T1hxc2crdnBoWVQ1N1JzTURTTW83R0N5d2lValJqaDAyNDR6?=
 =?utf-8?B?NWlhcUxWdHVGZnlVTVFUSUhlNXM2TkgzaFNTenFOR1BFYWU3TUpBeXJuZ1BR?=
 =?utf-8?B?Zmh4eDViL2NYT2NIUVFHWXh1LzhMWUhibXhua0ZUU2ttMWZ1Y1hPdEhyOU1z?=
 =?utf-8?Q?wKPOPV9u5xPNefxJ1ITg4ehACtyxL5DS6JyKL6w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fecc8be-3fcb-42ff-86c1-08d97913071b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:08:08.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gJSgvcInAPwws0oYCJ+al1VIw5sz5OlLGaCh4m8Ny61bl6GfagTBhgdshexZP/VSbq8Ewvjyk53QOTqlSXvpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
X-OriginatorOrg: citrix.com

On Thu, Sep 16, 2021 at 02:30:39PM +0200, Jan Beulich wrote:
> On 16.09.2021 13:10, Dmitry Isaikin wrote:
> > From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> > 
> > This significantly speeds up concurrent destruction of multiple domains on x86.
> 
> This effectively is a simplistic revert of 228ab9992ffb ("domctl:
> improve locking during domain destruction"). There it was found to
> actually improve things; now you're claiming the opposite. It'll
> take more justification, clearly identifying that you actually
> revert an earlier change, and an explanation why then you don't
> revert that change altogether. You will want to specifically also
> consider the cleaning up of huge VMs, where use of the (global)
> domctl lock may hamper progress of other (parallel) operations on
> the system.
> 
> > I identify the place taking the most time:
> > 
> >     do_domctl(case XEN_DOMCTL_destroydomain)
> >       -> domain_kill()
> >            -> domain_relinquish_resources()
> >                 -> relinquish_memory(d, &d->page_list, PGT_l4_page_table)
> > 
> > My reference setup: Intel(R) Xeon(R) CPU E5-2680 v4 @ 2.40GHz, Xen 4.14.
> > 
> > I use this command for test:
> > 
> >     for i in $(seq 1 5) ; do xl destroy test-vm-${i} & done
> > 
> > Without holding the lock all calls of `relinquish_memory(d, &d->page_list, PGT_l4_page_table)`
> > took on my setup (for HVM with 2GB of memory) about 3 seconds for each destroying domain.
> > 
> > With holding the lock it took only 100 ms.
> 
> I'm further afraid I can't make the connection. Do you have an
> explanation for why there would be such a massive difference?
> What would prevent progress of relinquish_memory() with the
> domctl lock not held?

I would recommend to Dmitry to use lock profiling with and without
this change applied and try to spot which lock is causing the
contention as a starting point. That should be fairly easy and could
share some light.

Regards, Roger.


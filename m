Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C968349B73D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 16:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260463.449982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNRn-0006Iq-6p; Tue, 25 Jan 2022 15:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260463.449982; Tue, 25 Jan 2022 15:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNRn-0006GX-3Q; Tue, 25 Jan 2022 15:09:27 +0000
Received: by outflank-mailman (input) for mailman id 260463;
 Tue, 25 Jan 2022 15:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBbi=SJ=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCNRl-0006AJ-BI
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 15:09:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6deabc5-7df0-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 16:09:24 +0100 (CET)
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
X-Inumbo-ID: c6deabc5-7df0-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643123363;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rXkpg/efS3u7jS+FboBJ5a3L2TeD3KyE42YGTqWio/g=;
  b=UPIq7oDxii8AzyuzUijA3qXJkEi1p+3rk7rpVNWeFo8/itZJGQt1rAAg
   1IX3IUMmhYkN3eGe+X9ZlIguvcY9YwjdvkcQiMVZZV0vEXiO4170rhgTg
   VfNq3vryv2GQJKxB0rjhLm76TE3KD3v2cVcRres4MCBiKaO5HBCBrQzK4
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OketCAnb/M8m/DkDeJ0fcALSx6dZzNPivxr7uPfYwUE4S2KSFckvi8+LuG3/yRFQXL1QkxXo2f
 ST/nYnZLhC2qSzVZMTNH/akK62i3Rm0pv3aG0hdbyavrFoMZp7dkGD11x+C1vsiPw5b/9KVgV0
 GS/Dhzh/hjCJvZbHvAbxEIZjKBfYLybD7ogvJVluv7LMTmNb73JHxqoIgcq5Kk1gfOuvo+t27D
 5xoOXq60mjyScx6N7S5rhv6wG6/dbAF9TsbOWgk0jSEyMH+MgRspA36qUpxEbEEsWdIS0IXxiN
 j3fVTLBpcA9nO8jmMrftxkqs
X-SBRS: 5.2
X-MesageID: 63126606
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kqGx1KD0iTh6uBVW/8Tkw5YqxClBgxIJ4kV8jS/XYbTApGhwgTUDy
 GpOWG2FP/nZZ2H1etgnb9+2/BlUup/dyoBmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940087wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/qTypv/9j0
 Mt0h5XuTyNyZ/DNobtBekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGh25q2J4WQ54yY
 eILRiBhKyjkZCZoFW1KA7cSwPWGtCjGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFyNnj4zScJOKt8ztgepkfOJ4j/GWkFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtrxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtgMsW4hehY4aq7onAMFh
 meJ5Wu9A7cIZBOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iNhiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:Rdvs2KkJ54AvBBsgn8/DrWF5Kz/pDfOIimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WGIVY3SEjUOy1HYUL2KirGSggEIeheOudK1sJ
 0PT0EQMqyIMbEXt7eY3OD8Kadb/DDlytHpuQ699QYUcegCUcgJhG0ZajpzUHcGPzWubaBJTq
 Z0jfA3wwZIDE5nCPhTcUN1ONQryee79q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NThj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDs1L9qqq
 iIn/4TBbU115rjRBDynfIr4Xi47N8a0Q6n9bZfuwq6nSW2fkNgNyMLv/MnTvKQ0TtfgDg76t
 MX44vRjesmMfuL9h6NluTgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVh4SxbpXWN
 WGNvusr8q+sGnqG0zxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0q9
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4gacaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhlltFEU33HNczW2AG4OSITevqb0oIi65fgKo
 WO0bptcoreEVc=
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="63126606"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+4Lyc+tnRu5+AYl0DXUax8QHkgpNyZxHvvXGywawx1QTagGLOn1GLkhuHrwpxIEygKnawyLguZHCaUFl5J/CyCdgMSGVvrj07nH5+k9yjfWyLnIqq/hWIIaL8A5T8ja8OxI7+9YN0Uoh+yAsRQ+ZdsP0T5+HihV/HaLmXXkbX2SEGRi9Fxq+640cHYeZ5cD4HOIlhqzWZkf6aV7q/y/thNyF+0eCxi/7MOBfpgB4cyDbWGTAFkLDhHC2RHm0CCVlBuvYOgpW5H+haeIRpKptsc1UnNrDdlJlSDu59nCTmVgaXt5HYhVLNynPOpsHvVa5iIDYAYGSguYMXixIW/Vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXkpg/efS3u7jS+FboBJ5a3L2TeD3KyE42YGTqWio/g=;
 b=XzNooVwxZnaYZ7x9wskyln4ZTiCzxoKlHGeu4FzcorOH0NI6QDR/kFEP/MFAUHdyVJ9C0c3axstZh5b30UAoEi7j6OENiEjoGb8gx+fUEfIuzkhOoVKbMlA0yJpyOV2tSri9TtWCafzq87CuNfdb3/5b0a8scZQVoU9pfrXSDeivZdTHjfuc5+Yj9dhkfjLeUDP9oZJSckysNYZ7L42Cb1aZl0Hvm5KwiC3lkXHEKPL4EBsrFLVFEqFvfcrtvXubHB3bLwObFQFfzPFllsuErLBjtINavZBR20z7PsDRFSRVL/e7CXoNcTAuRVAyg9INQ3MspiOw4BeHMKS+7mL7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXkpg/efS3u7jS+FboBJ5a3L2TeD3KyE42YGTqWio/g=;
 b=HHRIXvgZ7eEpFsJrIuFSbcXzL7ZDQbrPXJaM2iph2MXpuqayl5B9rN/lUjiFnXdoVelXCNVjsTG0xagUkwFmvmF05WB7OZiLOxrYnoTrU+oWGuBEN4i0FPUvlNsAXWaOfSOpbXGm6Pq+ENTMybez7QLH71+JX0WwRUXfEjDkipo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: recognize CLDEMOTE
Thread-Topic: [PATCH] x86emul: recognize CLDEMOTE
Thread-Index: AQHYEfcQ4DdLYcXoIUCxCIAZX3ErX6xz1xYA
Date: Tue, 25 Jan 2022 15:09:13 +0000
Message-ID: <2e949d41-00f8-5344-3989-7b0ca45ad6e0@citrix.com>
References: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
In-Reply-To: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dbe27c7-8bb5-4f23-8d5f-08d9e014a5c8
x-ms-traffictypediagnostic: DM6PR03MB4473:EE_
x-microsoft-antispam-prvs: <DM6PR03MB44731513FCF0CE901AFDB239BA5F9@DM6PR03MB4473.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C4ATX4XsXCEQ/kHsuN08QzheeTbSmflpjJy3tVCGZUdM/pCXVBaAoqJXM1N0cqkUpsEiowv7YFdL2ntaAApu2mzadbtp+UjrobFnQQRO7//qUkJEyAdIMYCrn1AASuGoaD86XuplY1OzdddxWIYjh87El/5DFDI0lbFDMvIoWoZDPS9sJ+cD4IluszozTX5v4sIw43R2074Zo1+71OsAA5cP4IjMC6hi8ctHZqOmn7s0N62W2iJx6b/EIlsHRy66gGNhfzmqOGpW95Sos/eN+yMvuxJMixGtCn1ffkd42zhmlM+5I5JY4jvux5kDupXNo+qLgitcW7pXD/pm+/5tYLNGgLK/JdeMlu25shxV1KzWincegvEA1XxGRPfR3kKHax/98+1R9dojb2osT7fom1ERbHYiLDIKkYOpj6NVFVnmCs5FyMqy27cuTPhjaL4DWtndC60l2CUm03jwPy74k0Ibz1So693WspyYsrsEdPwj8/mVpCG2ug20rxQvJMRqaKkJ4R2d+9f2p5fRqDGiySrmFRayU7bJKR7nxMXTm8updHXsbIBA0KxQXVgIB5sPW41w9wOBRKue/MyzYztvPeliiqxvQN2rxl0zpyib9vHreTKntIqaGELBindHceQflPE44ta2WU+oavlmBMjhltG2eXgXxEYwEtoZEWLnKXkHdaKXTF0lbBQEQSzfmuthYKavntYRtq2zCZa2q91+kYrLvt7Fhwm6X/O/nFNJZGLoztRGqWCYcAxf7WhZYUA/tHVwNAk1Or3DJuOhCqgqrQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(186003)(38100700002)(107886003)(26005)(82960400001)(91956017)(8676002)(66476007)(76116006)(4744005)(2906002)(66556008)(64756008)(66446008)(5660300002)(31686004)(8936002)(36756003)(4326008)(66946007)(508600001)(31696002)(54906003)(316002)(110136005)(86362001)(6506007)(6512007)(38070700005)(71200400001)(53546011)(122000001)(6486002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0hCa29iRUlZNGlnQmFrT2c2dEtTV1RJYTZFT1dyNll4KzYyTkIxdjBQMndS?=
 =?utf-8?B?QmRpUmhsaGVCcmwvTXhtbmh6UmVTK1Q4enNhZnVBeTYyWFl6SzRaZElZZmYw?=
 =?utf-8?B?UEQyOXBwMjRHek9XaGlTYUhjbExLMnpEWCs2SzR6QU1BbHlYVEgvODVxYlRn?=
 =?utf-8?B?QlZlNGtzbHFoT2x5ZVh3OHlwWWhzU3hUeER1S2pyd091b0hHK1BPZllGcExw?=
 =?utf-8?B?K1lKWWdjdEVNZlpFaThQYUVEUGQ4bzFHeVZhTzRzaXVXcUxlL2RUWHUzb0Zw?=
 =?utf-8?B?UVNBdENSeEZZbjN1TDd3a2Rma0ZpelJybTVYNnZ3OG5oTE1yVXdOU2FQQk9B?=
 =?utf-8?B?d1RrWm9SVHREN1cxMnR0MFgxK3ZwNjFsREpNZk96UThxTWpTazAyY0h1ZGU4?=
 =?utf-8?B?L1dtL0ViM2MxZ2NTYk1HNkNKdCtLbGxTMEVKdkpjaUs0bjBtTVFQWXh2U2ZF?=
 =?utf-8?B?OWptVFk1UGwvTkhFOWRNZGdLWWtYOWtmS0E5N0J3V0p3UVI1dnkzNmtlTFZU?=
 =?utf-8?B?SnM1T0YrSGpWaUFNUGVSdGdITVpMR1BrMlAyOGIrYVpWNDl0Q3p5ZmVRakxW?=
 =?utf-8?B?OW9NU2hGNlhYOERTQjlwdHNMRWIrUGc0UmJZNytOQlRobFhhellWaGRzcEhT?=
 =?utf-8?B?eXRMTnNnNk5WQi85WllPOTZFMnl2dFNvWTYwQnd6OFlXSTJ4TUJ0dGFWN20r?=
 =?utf-8?B?MjF5UzFMMjZxOS9uM1VLT0VMSkRnbHdBcVIvYVVwRGFGczByVllrMHZXV3hI?=
 =?utf-8?B?Smx6T0JnY0wrZGdrR0dXRG0zSERobG40Rjlyb2FHQmtac1dvaHhvdXdtcmhy?=
 =?utf-8?B?WlBrdGdNbUdDYk1McFBNR2hGbFgyaDFWQ1p3ZHRXZ1RIb0I4Z1NBdHBSVnpK?=
 =?utf-8?B?V3NzNExQMmR2bEZwamFMQmtoeDdZRHY3emxZK0NmWFladEJpeHROV08xN3po?=
 =?utf-8?B?UnB3dU94OEJJa080ZVVBTk1DTkx3Vi9tbUczQTdvVXg2eXdsNUV3Y1REMWpI?=
 =?utf-8?B?VDlKQXhzNzVUSkoySVF4clArUjhma3R3emFLdjJLQXk2eElPSm9HR2N1SWZN?=
 =?utf-8?B?MnRqNldZUEtleGU4ZEFoNjlsajNFSFlsRU9oaWpIQWJobCtmNW1uTXMvMXgy?=
 =?utf-8?B?OUNNTmFJSmdiLzlSWWdUMngvTmR0VTk3VHF6NVdyL2gyU0FyaFBnRkFzWXlH?=
 =?utf-8?B?OVI2WlVXcytuTWhoNUt6RzV3aHNzY0F4OHJSdUh5ODVRV09nOXdyeEcveGxn?=
 =?utf-8?B?akhBalRPUFBaNzdwcHJ6VW9JZHRud0JveEFWbmdCSFVtNHNJcENjTitsU0I3?=
 =?utf-8?B?NUZQWk9LYTJzUEhkdG1rTVh6OHdvVEhVLzJIUGh3S3JOQnhmMitXMEZZVWNz?=
 =?utf-8?B?bWoxVFNEaE8xK0E2L3lJbG5QU1NtaHM4cjkwYktXMTdTNHp4YjluenVIUDJh?=
 =?utf-8?B?ME8zTnZxZ3Y2czVjazdpOHcvVzJFZGhWL3VXMlE5aFNhd0pwOEpya01XTEdK?=
 =?utf-8?B?V3hZRzJLMUZLQkZSOTdSZHNlTXk0cmJBMFplTEZBb1NMOXZ3TFpmTUx6SDNC?=
 =?utf-8?B?RjV5T1ZwRVlNeEp2ZXNWSG4wSFZXMkVZUDRyeHpKMk8weDBlSTF5RGlwS0hT?=
 =?utf-8?B?ZDlyRUVqMTJRU1ZxUHNQUUR1T3J4Y2NnWUt5U21TRW9ydnYwTmwrVXFPaEFj?=
 =?utf-8?B?NjB3YURmajRLMDRscGZGSTNVKytMVkFVTVg3d0VSbzBLdWZoejlsWTVQLy91?=
 =?utf-8?B?ZDdxZEZxR1lwUU95ak1LRmdXdHUycTAxWnVrNmtZUTJicXlJSGo4VW9NN0hC?=
 =?utf-8?B?M01sblBZSGxFZCtBNDQ4N1NmS1FYT09VaU9NaGxKdmcxUUNTekZ2OTRhaFpV?=
 =?utf-8?B?Y3Z4U1FjMXovRnBZZjdOV0g2YlZ3bUdGRjJzM1ZGQnFuVDJpb2ZRWDEyZDkr?=
 =?utf-8?B?NiszcFNLT29XMTIrcFNjMXNsZ1ZES2VpVUxIUzFrM3l3SkVPaCtXYk1OQmtS?=
 =?utf-8?B?d3FySG9QanowL0xKc0FLTjNsT1ZhS0xheVNjVFowVTQrZ3Ewa2xrZGR2VUJW?=
 =?utf-8?B?VCtTN1NXNWd3dFc4dnBjN0wrWTY0eFJQajlSRkRmWDQrOFB4cFFjV09SRGxv?=
 =?utf-8?B?dTdBTHU5dWkrTHhrWEQ4emhLaE83WmlmN2ZDK2JOek1adlM2V21GMGJ2aGtG?=
 =?utf-8?Q?u8NHncLBCy6erRrUnSi2WYYxONQ+nN8NjGiNVPbvhVfe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03D59BEB068E654094048368A36026FA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbe27c7-8bb5-4f23-8d5f-08d9e014a5c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 15:09:13.3893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlHbWR9jNvaVWfeJv49uF3U6rhtfIvuZC77wdn1lNY67d4VV8MVJtw9VSdwQtziTOqcuhnKZMJBcJhizCkM2s9Rpe+//T17zxGEidVXOJto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4473
X-OriginatorOrg: citrix.com

T24gMjUvMDEvMjAyMiAxNDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdlIGNsYWltIHRvIHN1
cHBvcnQgdGhlIGluc24sIGJ1dCBzbyBmYXIgdGhlIGVtdWxhdG9yIGhhcyBiZWVuIGhhbmRsaW5n
DQo+IGl0IGFzIGEgTk9QLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQoNClRyZWF0aW5nIENMREVNT1RFIGFzIGEgTk9QIGlzIGdvaW5nIHRvIGJl
IG1vcmUgZWZmaWNpZW50IHRoYW4gYWN0dWFsbHkNCnNldHRpbmcgdXAgdGhlIG1hcHBpbmcgdG8g
ZXhlY3V0ZSBhIHJlYWwgQ0xERU1PVEUgaW5zdHJ1Y3Rpb24gb24gdGhlDQpsaW5lIGluIHF1ZXN0
aW9uLsKgIENMREVNT1RFIGlzIHZlcnkgc3BlY2lmaWNhbGx5IGFuIG9wdGltaXNhdGlvbiBmb3IN
CnNvZnR3YXJlIHByb2R1Y2VyL2NvbnN1bWVyIHBhaXJzLg0KDQpJZiB3ZSB3YW50IHRvIHRha2Ug
dGhpcyBwYXRjaCwgaXQgc2hvdWxkIEZpeFtlc106IGFkM2FiYzQ3ZGQyM2Mgd2hpY2gNCm1hZGUg
dGhlIGNsYWltIHRoYXQgQ0xERU1PVEUgbmVlZGVkIG5vIGZ1cnRoZXIgYWRkaXRpb25zLg0KDQpU
aGUgb25seSBpc3N1ZSBvbiB3aGV0aGVyIHdlIGNhbiB0cmVhdCBpdCBhcyBhIE5PUCBjb21wbGV0
ZWx5IGlzIHdoZXRoZXINCndlIGJlbGlldmUgdGhlIGV4Y2VwdGlvbiBsaXN0LsKgIEknbSBub3Qg
c3VyZSBJIGJlbGlldmUgdGhlIGFic2VuY2Ugb2YNCkFHVSBmYXVsdHMsIGJ1dCB0aGUgaW5zdHJ1
Y3Rpb24gaXMgdGFrZW4gZnJvbSBoaW50LW5vcCBzcGFjZSBzbw0KZ3VhcmFudGVlZCB0byBiZWhh
dmUgc2ltaWxhcmx5IHRvIGNsZmx1c2gvY2x3Yi4NCg0KfkFuZHJldw0K


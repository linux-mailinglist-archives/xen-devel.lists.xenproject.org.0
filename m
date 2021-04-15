Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B63609C5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 14:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111127.212472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1QI-0004gl-DN; Thu, 15 Apr 2021 12:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111127.212472; Thu, 15 Apr 2021 12:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1QI-0004gM-9z; Thu, 15 Apr 2021 12:48:42 +0000
Received: by outflank-mailman (input) for mailman id 111127;
 Thu, 15 Apr 2021 12:48:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tgI=JM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lX1QG-0004gF-Oq
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 12:48:40 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19b07e72-9be5-457e-b23f-57d01c48b1e1;
 Thu, 15 Apr 2021 12:48:39 +0000 (UTC)
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
X-Inumbo-ID: 19b07e72-9be5-457e-b23f-57d01c48b1e1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618490919;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ekwyJseyljH2XbpIJ3tMAlAffd8mbZvroe6B+XGiLvg=;
  b=KBpq0kJrIeSbVddrTiWWiGZVk4YtrEw5twmUkJZghk85CFQwHXLSH+Kk
   OGx32jb/m0TCH7Hs6cO+VCCdwl0Cl3qIH59ulexbPOaxV504u7m3mhnIB
   tZRnEqv45f5MRUTPjA+2kCqNC2y/BVooVUckP0SqXHLEkLkPy2cDCy0Re
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TkUbduWemakaSRtMxGs9BArr25Pf5Lu//IfnaiWoPZu8tF8QGVoOqg2hPr7guA6o2bEK0ELdBe
 MmxB7+hFGEA8vPTifsLlNtuo9EK3+Efuqn2nMAX414FyeXm3tysaiuuK01gZkGP2pMc/lgzvTz
 S+IRngrvq3KqRXppHKWFg3WZhq4JJfYXn0oOKyRjJDBeAyzYq1T3eRommhExrrlWelM9Nsfjut
 8FEo/AHAdK8YyYoIMYUuue3UblF32Fd5Vy8OXkBaWbK91bHeTNm+OJZ9jg65oF4BWzjym2d7WF
 odQ=
X-SBRS: 5.2
X-MesageID: 41669640
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kgFCqq+UTwLIdztgTqNuk+F1cL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2OmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVpUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbySw9BEYTj9J3PMe4X
 HI+jaJm5mLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESVti+Gf4JkMofy2wwdgObq01oylc
 mJnhFIBbUI11r0XkWY5STgwBPh1jFG0Q6Q9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvkneC/opyjz68PFUBtnjCOP0B4fuNUekmBFVs8mYKJRxLZvjH99KosKHy7x9ekcYY
 9TJfzbjcwmE2+yU2rUpS1GztCqQx0Ib2y7a3lHkMmU3z9KpWt+3ksVyecO901wha4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8f166EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIOz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQfHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9tDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCL1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Zm31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EdXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EQTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03dtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywRO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xy/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd9BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfA7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q+6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXFEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0DfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpL1S6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 tHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+eXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn7doXH5mQ/k1Vf5jl7llninqieiV2rY31uAEn+mZVZXT5aL36Sq9
 /KmNLojEjA3A==
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="41669640"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjLqw3sIthSMQrSHNCBv/bGJlyKrNnCo3oeTGTIEQpGN+Dwa3MvQc3ec+0cu0C6uexjpO2e+AwCN3BNCXqbzILu2WTT2dVIcnUHbIGsZB3ZPltRWwYXqbJvMlgqDN34kIYEltDOXVF4zJkKgCuC+/f6EFoxwP8P5LeyqipmMc7SVDAGwgAPTr+B/kOrF+OYmp4L+FBXtC8UAsOrO3/r1Xdv97WSmbeeE4IDYsyzhae+HiLpHuYPer4VQpbJuMMZwSdXTX8KCSIRGW3HE00APz8bqqF3gbFbv20Wi6zf+CGKQaSXXVw9R9K940z0vL/BzUK0Tx+xARDCRe4QpCb+3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVC9u1l/9s+vS6XdXeRhEWRzR2M/Rz7i3vJKa57ewTM=;
 b=hUbUIEbeeGCUdWiyK0kBQgQHDJPkvRWZxpRBNXXWIsWUbfL9Jz2SZ0HvBaKRTS+phi+OV5w7urBGNzeC434dGxmQJXovagzWk8k1mHn1qNlI0Ksd7ayNBeMO99McE8H1z7L0j5+zhEUVdVlb7D4flbN14IOypF+GLTY7vAimGCB8ABjAf0hmHYsxsU9M/UTiq3GGHo5sbDi2EkBhmtHxQ3wVkI/Z91WnJTs5SxF0+eC5RczisicnHrVov72EFiRlO9qkDiCATgEEFS+lEOYPpzoZA5T9kaz1uwzlXbMB1Enu9WhltWZXBCZEZb5o7PEJ80wsQtDib26MwNvuBPdURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVC9u1l/9s+vS6XdXeRhEWRzR2M/Rz7i3vJKa57ewTM=;
 b=ciZVZtrXWZwRXpRun9R98OQ25mVHHE2hLijbbNA81dSrqRLKSCvXghCG8hVIZQkFv+UmOiprqY4VI2d0n7S6/e7qGvlQaLSSg05f1qa3OqiLwJoyaClhYEuLFBaOZi1TsRDFRb9RTbfK8wFFV7/dxydCVSwYGaKgszGc0VTglyU=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <0f04f568-e55a-ef20-aa97-fbb199dfae37@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 11/17] x86/CPUID: adjust extended leaves out of range
 clearing
Message-ID: <b8960b03-4671-8653-2897-7d1b116e599b@citrix.com>
Date: Thu, 15 Apr 2021 13:48:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0f04f568-e55a-ef20-aa97-fbb199dfae37@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b509301-1ee0-4719-8ce1-08d9000cc479
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5534FFA69939BE7D07199792BA4D9@SJ0PR03MB5534.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tAnrvYaLE9sC5uxGbFhKWeuxlaT5wM3pjy/FVagY07BLp5RhEaKWrTmfXsV+MJQt9IWDFl4Gmv6NrJUoxsp0ZEadtv9Yb4I9bgx8PdCHg83UI62tJnwZAWdorZcoJW0hyIwdFjs5PgDuKuPRZfS3uCmGkym4RmWsWJKAOKyFw12NJkYoi0cHFVBE4vO08uH4/9PhDRaQ5mfhdO/TDmh3YA8Rteok20WRNQD2O79vy2vLpOZ3OJpxzCcxD4nOXh6lZNiPrZrj1YvEG2fsm/n1gkq82rvUKD+bekAc7LBPbnWBNu1r9j4LU/AqPgi3CyDLVxH7Y3dJKoIAu5K0grGPyZpN9Ltu+5y5Z2qklGV2icJtYgxd+p0xuTNklHMyE8FyWSCyS+Yzd4S7Ie9dskycy9HQbbYZKm2yCZEs/D9NCOzcdm32jYQofJPkHPlAZWoBYnrJyb3I+jORa93+4k8H0KQt3OFWnFh7MpycdCJkhZy03GeQQmh6SF2sQ+EHOhjtsoBJR7YBK49i+Ck+vviE26YkckIJcvVzpJlt7b70unBIOIvvsAfEkzwkE/xz7Zxo8dchgGrzEt8956N/3QS2mHwn2ytdxheE13pqRCG/gJkiSKqeFBJV5fAhe99jxX2sH3kZwOykw1GpljEHYsyDT4r0xDmFjTz3OipjbpHQwCQxuSqPd4qgruHwhs1r2196
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(86362001)(31686004)(2906002)(38100700002)(186003)(54906003)(16576012)(26005)(6666004)(110136005)(36756003)(2616005)(956004)(6486002)(316002)(8676002)(66476007)(66556008)(16526019)(53546011)(107886003)(8936002)(4326008)(31696002)(478600001)(5660300002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QlNBZDhIQzE2R1hkMS84ekxzcWhHUXRWSnF5QjExVisvSk4xMW5nK041b1JF?=
 =?utf-8?B?bG5xSUFLVUtlYjhHNHpwNFQ4cncxVFZnUzM1NzNyZyttTmJSb3gyQ0lGRUJU?=
 =?utf-8?B?c1VGWmxuUFVEMDN5ZUdEVUJlQ1FhV0xHTXNFbzM0SjdLdU5aU1Q3bjhURXli?=
 =?utf-8?B?NndybWNkZWx1VWdyLzdGTnhXSU1idEl1SUpLeVhMNnA4cHJUVWZKSTZjYXBq?=
 =?utf-8?B?RlQra3h2RDFkTnJNK1VsR2FKek5RMEZBZUdlQzEwd3V2UTZmN0dlbWxMeHNm?=
 =?utf-8?B?Zk82OU5qekxJTmpSdUR4US81a0ZtbGkwS0pMbDdTaC9nc0V1WkVzUTlSbW5J?=
 =?utf-8?B?NHdvNUtJWDdDczVUQytzQTY0Ri91VHVPMlRyTmIvcVh4Nm5Nb2VFVWh5ZEwr?=
 =?utf-8?B?NUJJZmpTYTdaSDlGUTRVQUk0YTA2WFdLejYwQ0E1ZXkwUmZ1UFdQQU5YTHZu?=
 =?utf-8?B?KzEySmtFck9vQzRNbUtyVjhENmZIVDdTcFlSVW9JN1VNaGdoQ0x2Zk1ocFpp?=
 =?utf-8?B?dkpIYStuNGxrTTdxNmc3Q3UxOEh2QUZEckRjVUxRMGhOejhocFZ5dWR6dGt2?=
 =?utf-8?B?S2JQN0JDMEREVjBJRkZmZHFTMUk4c2lXZTRKSFQ0eVNmeXJOL0xqNHBIN0FL?=
 =?utf-8?B?dDlMdnl1TDY3L1hPTlFwbzFQTDdkOEtxVURKUmNObEYrZ0FRekFmcU1sOWFD?=
 =?utf-8?B?VkViLyt6MkRoeU9BQzVqaEZBZnJoMmJYVHhzRTFOem4zODdtbFNyRDdJYTF2?=
 =?utf-8?B?ekNKam5PSXpHYWJHRDhMR1RBekQxWHhna3ZOKzRRdzF2WmpuN0pKY0RwM0J1?=
 =?utf-8?B?SGFhaFhTMEp0SHYxRlY3ZHk5emFXbDluMG10MEpnUFZ1UFFLa2RBam5yS2hw?=
 =?utf-8?B?NXIxamJCVFNZV093RFFLSDlQdzRPOUVrT1ZGVE9iMUs1dTlzT0VBOUZuRFVn?=
 =?utf-8?B?SHNUM05zMTB4YXZFb21KZXdJMlJHQWs5WWtyNk1QWHpGd0tRQjlvUndmU3Y2?=
 =?utf-8?B?SllmNmZwdEVrQlZGNW5jbjR6Ny8wd3lGZkIzUTFXQy9UOTFGckl6OFRkN3Nt?=
 =?utf-8?B?YWdSbFo3Um4zdngyd1c3YzAzU3loMFRtZUU0OHE4SE8wZFNFaTEwQ29NZ21P?=
 =?utf-8?B?QzUwZVRkZ0pTQ3dKTytQR2VJdlAwcUI3Z3QraHVBdy8vc0Z2cVZqNFBRcmNm?=
 =?utf-8?B?QzdMQ21SVWZmQnJTQnE0MFVuZkZaQy9DZjNpeUhWYW8vRHUwMGpjN1RxelNF?=
 =?utf-8?B?dU82NUlhL3JlcVJZUlpEQ3pVUVVBK2dBc05IWGpZS0lRUk1PTXFQZDZSYTJD?=
 =?utf-8?B?dXZoY0VPcG0xamg0OTdQNnl2MmQwVTlDd25lVDFYa0J1c0ZCbnh4akFtd3Rq?=
 =?utf-8?B?Q3VvM2VrTzU3MEo4dnVhSmxXcnBpbEVDc3lLOTMwZ0xNWEFXZVYrcG0xYTlF?=
 =?utf-8?B?YmVmNHI2a1RxWEtiWEVEaTFwWDdjSUVoWjNBZHczNml0MHhYZUFrVWtXbVZZ?=
 =?utf-8?B?UmE0d0FiOTZ0MmFSUzQwZThRQjloU2lvbWxiOEJkUWV6NldvdUIralpSWnJj?=
 =?utf-8?B?VGxQN3VFSkRrVVhWTDFwY08zVWQ4ODJyNklBcS9oNno5MElRamJnQjdPS0V4?=
 =?utf-8?B?Vk1rWXpxMnZyczE0YkdDQXlUOVl4SnVYVWVOMFFXYWRLcll5WU04dmEwU0hu?=
 =?utf-8?B?MWlwelNsZ3BZcURlVjlNNnpvRW5TV2RoY0liTSs1V2NmcFp5dEFTWmFUN3NV?=
 =?utf-8?Q?DT0FuYzCtIQ6p+kJ5TQh9+5eSxP/l4PNfMHd0ik?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b509301-1ee0-4719-8ce1-08d9000cc479
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 12:48:28.7782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leFX3v2cWAXVZQ1v7Q0wmjieqNWiYJ4GV2EcdhPUoXQZhubrznKG+xM8TGmM/yJOjz2nChO6Yg9nN2ReT+kizLBJzZ6Muw+cCp8XD5Db91s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5534
X-OriginatorOrg: citrix.com

On 23/11/2020 14:32, Jan Beulich wrote:
> A maximum extended leaf input value with the high half different from
> 0x8000 should not be considered valid - all leaves should be cleared in
> this case.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Integrate into series.
>
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -516,11 +516,22 @@ static void test_cpuid_out_of_range_clea
>              },
>          },
>          {
> +            .name =3D "no extd",
> +            .nr_markers =3D 0,
> +            .p =3D {
> +                /* Clears all markers. */
> +                .extd.max_leaf =3D 0,
> +
> +                .extd.vendor_ebx =3D 0xc2,
> +                .extd.raw_fms =3D 0xc2,
> +            },
> +        },
> +        {
>              .name =3D "extd",
>              .nr_markers =3D 1,
>              .p =3D {
>                  /* Retains marker in leaf 0.  Clears others. */
> -                .extd.max_leaf =3D 0,
> +                .extd.max_leaf =3D 0x80000000,
>                  .extd.vendor_ebx =3D 0xc2,
> =20
>                  .extd.raw_fms =3D 0xc2,
> --- a/xen/lib/x86/cpuid.c
> +++ b/xen/lib/x86/cpuid.c
> @@ -232,7 +232,9 @@ void x86_cpuid_policy_clear_out_of_range
>                      ARRAY_SIZE(p->xstate.raw) - 1);
>      }
> =20
> -    zero_leaves(p->extd.raw, (p->extd.max_leaf & 0xffff) + 1,
> +    zero_leaves(p->extd.raw,
> +                ((p->extd.max_leaf >> 16) =3D=3D 0x8000
> +                 ? (p->extd.max_leaf & 0xffff) + 1 : 0),
>                  ARRAY_SIZE(p->extd.raw) - 1);

Honestly, this is unnecessary complexity and overhead, and the logic is
already hard enough to follow.

There won't be extd.max_leaf with the high half !=3D 0x8000 in real
policies, because of how we fill them.=C2=A0 Nor ought there to be, given t=
he
intended meaning of this part of the union.

I think we simply forbid this case, rather than taking extra complexity
to cope with it.=C2=A0 Approximately all VMs will have 0x80000008 as a
minimum, and I don't think catering to pre-64bit Intel CPUs is worth our
effort either.

~Andrew



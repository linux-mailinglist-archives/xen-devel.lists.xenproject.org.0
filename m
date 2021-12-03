Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5064673A3
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 10:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237196.411374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt4UH-000248-9B; Fri, 03 Dec 2021 09:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237196.411374; Fri, 03 Dec 2021 09:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt4UH-00022K-60; Fri, 03 Dec 2021 09:04:13 +0000
Received: by outflank-mailman (input) for mailman id 237196;
 Fri, 03 Dec 2021 09:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRzA=QU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mt4UG-00022E-4j
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 09:04:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f991dd57-5417-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 10:04:10 +0100 (CET)
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
X-Inumbo-ID: f991dd57-5417-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638522250;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sokpsrmaO7ZRE31tarz6A6PGCSHdtg0H1RxpW3WijVw=;
  b=eW3NexdwsXjGV9Cod418b5MA5O1KI+28iJrPmnmYyolSoZWbRw3CzUgo
   6NLahsnL5qv2vGanzAVZSHk4ndq/M5b58rAhdb/Bf39XN9m3HRoSkY1yt
   oYew/q1jCblrSrHMo7zcu8PR2EfIjJvZXZY8Jz+okzEx6OZGACZqwIABS
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qqRnkPFvuRsHRAXyYFZ5dwLfOjRXbbYOympJQt9/7LfsKqbcEXZrrN+mF29qNeefkb+eunaf12
 GZbEQxAj/7T54dJnlfABdnMU+ko5gP+Mc6AMIwcAAZ/8qZQPhcZ+5n+CTcYrze6uO6tNSykMwV
 ujQXHl4lS02xVk7lGUlFdTholW7lWeI7OqMBh5+NskI1/5eMbokOeruB0HIpY2RACxTS1rMifz
 1mmFwfevU7rrR43wGtVuksDBudZb4vDocVyr1sagM7CBxQjuV+Hs8RdFO6Imn2vXooFrvmph4A
 DseDg9OZISf9nJZO0FslP9eK
X-SBRS: 5.1
X-MesageID: 59205949
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Kcmemqh91P3ruSlxgyuBWWYFX161uBcKZh0ujC45NGQN5FlHY01je
 htvCGDVPKyMajDzfYp/bYmxoBkFu57SyNFlHQQ+rnxnHigb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw24Dia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0XvJacag4mEZHulfkCAyRpTS9/YJBJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t15oWQKeCN
 qL1bxJFdwyQYC9uJ2wYGbwwpMbxmmP/KR9X/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0AdNaP84z5y6x6KfJ/FakNzYKT2N8Z4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9zABbvzt68owGOlor+p5
 yNsdy+2tr9mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ldBs2aplcJ2S4O
 ic/XD+9ArcIZxNGioctPOqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeeG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:uDkBw6NzwDH2uMBcTyX155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrVQseVvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4F6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1ojegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKve/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdZ11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtRqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW3HAbgcYa
 lT5fznlbVrmQvwVQGagoAv+q3hYp0LJGbGfqBY0fbllgS/nxhCvjwlLYIk7zM9HakGOup5Dt
 L/Q9BVfYF1P78rhJ1GdZU8qOuMeyXwqEH3QSqvyWqOLtBzB5uKke+x3IkI
X-IronPort-AV: E=Sophos;i="5.87,283,1631592000"; 
   d="scan'208";a="59205949"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9TdPtrTwL++mRb4i4Y7AYj+tFdw85fhLjcf0cA6CGXxCHMVhu7IPAnJSUMVf6jv0aqZ3DcFbPtLQxBz/3iJNgzPQznpabtqEt6E1sa10oIIYk9XWm/Y2yRKXKZFGsNXe6riRR04NIQV8Gumlq0xnVi/BFetOL8z9IMop6E+TbnCiUBSP68t01Y2JmxQISpDAkyjpVbKKuHjeASwFL/T3oJplNXRPa6kGJWbRWBA/YzGmkKX8+/IvhcCHWNSM8RWRRrgoN0v5I8V+s7XGIo5cOvgzFjJ+9yVLAy83Ug/0fp8dFSKTQ7iqtzDyjddfkS5yZnAOUL7M15wu+GcnR0iqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WI9aRrIp3kYZU1ve/fDRSPtNCQR2u1WhLMi3rVoaJtw=;
 b=gCnu5ahXcY2Ub8O3R8nop5Yl+pICi2PVKuR3DAshqy1A2tUmf6e3vk6TQdkHG7xhzo59fjEk0B5nlD5hzBVFP0f9QJ2ABMYEHOYv/a8u3MNaUyVsNCtL1+h/D7lMo48nJ6o+xelsCtxpAarqNnND8nM1sciCEqK2XB8JrGsJDeiLnt3mfMD/rpwZIZLxtOX4lFGN7DzmsONW/wypYeuVRGcXSnsfcMkhzNMQH9mq/wboksX4DVv09rQg8zTda/tv5j5pkUO1WXPBW9nRdOA2yYe6MFLvhFdbIFgDh445o4UAn4nc7llpPbl+ZlNBCQaMvwjzSzdmOtbnEM/dTYYU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WI9aRrIp3kYZU1ve/fDRSPtNCQR2u1WhLMi3rVoaJtw=;
 b=ukLVsQbigpT7/LiEqU+n8TXqAQGIQUC/+hbVubMP67wLmiv/3s6sd2sOCknrYPRS8JB16FiKDjClUwWbzA9WiKiQObqZ2fFuEsyzAdeBtdyHPlF6jXTXfCtT5+RjXfZ12ARpjZp/w46m+f5G08iykVUX53ZE5UeZYEqubOCzvHY=
Date: Fri, 3 Dec 2021 10:03:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 10/18] AMD/IOMMU: walk trees upon page fault
Message-ID: <YandfTCG9nkWoyrz@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <5d4a4cd8-ffb0-951a-c86d-98f659ab8d0b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d4a4cd8-ffb0-951a-c86d-98f659ab8d0b@suse.com>
X-ClientProxiedBy: MR1P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fff2895-6c2f-4f48-c01b-08d9b63bd94b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-Microsoft-Antispam-PRVS: <DM6PR03MB53405849773BC497B713A1008F6A9@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mcrE6OCNrd/BHomZYfFfsMaUfL/fv1IuPpfiaIGAKz4mlmjq9t8uWspjtQa181kcmOtmTJF5Lj0kNF1ZvtAKGH7mZ7t+LIJEePqVuK5XYCjpYStMnVIUX3m6HzzInReOPIbkWLccMhOUCi1MDrasfI4TZveWP+JQGTbYlf7cs4hlfmChfZe2ll9ERjtv1f2eY38JNjfeJCkgORYHMBYPoLgfuIDmSAT+w2B9wb5Kdb6xBFXgxJ2SRjJBM1AN62DFRJqLiCA4gts6R5sI5NVcc+4GS75rZxCWwM+zEiT9yoWusXVhjFej0aFRQxHvLjPn/6sRQXJ9vO5Z8pc8ua5sh2pTxc0PQVFHJnOwOdz7v9o2zgU8XQJXBmXZnzQKA49NRbZzIZcnUtPMmsLZ8q0Yv0/GUpMPektRXo6pvPXKwF4luUv0Uw/Lg3n/RJkQcoQC+xWxjZlKuXB9n3f+1lOl7OgY03JmAIejCzK/EU1ney4vtMDz+dobfJnFVRdwr3INtNFBgCVW3fT/4gfhPJffJhCkSUeCxN8TJfribbkJ7Z7TuxsfXORHGg50ziYxhwl4V8io7S5w17Wa6lsSI+TAVs8uaCoULYFLIagFXNbWBrc2X7EDfgfysglPICe/95QwqElFqKeelYkA/HfLS+rzVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66946007)(66476007)(66556008)(4326008)(2906002)(8676002)(6496006)(9686003)(33716001)(316002)(8936002)(956004)(82960400001)(83380400001)(6916009)(6666004)(26005)(6486002)(54906003)(186003)(38100700002)(86362001)(508600001)(5660300002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkI5bjVYN1RvV2gvbTQ2VUlwNnUrV3JqUTNjZmh2bGNtR3VUOHg1WlFPOTMz?=
 =?utf-8?B?NDV2Mi9hS2F2VEVDbnN2RzRuTWZDZEdtOUVJSUdURFA4OGlzMDJmd1pRSFVK?=
 =?utf-8?B?NUowZDNBcC9jT2VtWnZycWpYc2R3QTZIZnpmVHYvaTRTZXhxMFhrbk9ya295?=
 =?utf-8?B?S3I4VnBrbW5EcTZQcGVFZGdUZitVRmhtUVhETDJ0QnNNMzN2VW54Rk1lTmMr?=
 =?utf-8?B?ZWJZNUtUcWRVSjBOb1JxTk53bXh3T0pqZFBtUHdJa1Frazl1WlBLTit1Z0tP?=
 =?utf-8?B?c3RWUnJXankwSEpUNi9KVnFPYytUdnM0SEx1d1o4elF1MktFTVNVSHZLbHIz?=
 =?utf-8?B?dGFPSzVKelBjN2JGNjVkcHhjVFg5M1lvNHRtQ3NCK3BLR0UycmVNY2NpNDQw?=
 =?utf-8?B?Ym1ZUTJqRmZldElwSU03UndZcnZmQmZYTmVlTjdUZmpkTmNDVWxmcjIrbEZH?=
 =?utf-8?B?VnZrbm5iZkVQVnZqc0xsbGQxaGtMUHd5WWRkQWNZQklOMWQxZ2t6MWVhdjZw?=
 =?utf-8?B?OXh5R0hCOGpxZkpEZDVRaDU3cC9FV2lrNk1zWU92aHRHd2JEWmY2QldmdUpL?=
 =?utf-8?B?TjZ6Rmp6ZHRZTkIrb0MwS3VRcUhkdnZxYzBxbHhWaisxWjdJT2U0elljRFlQ?=
 =?utf-8?B?aGlxak0xekRsek13L2VQQ3pNckR6YWtzL3piQUlkTnJOTVhQZy9NTlN4cUFS?=
 =?utf-8?B?OG1zQ3FOU3VGdnZlSUlGR3FQRW1UREpxZXZoZ3dlVUZEdXBEMlk3RU1HSjBX?=
 =?utf-8?B?bHc5Uk9GNFAzMGtRYVE4Z2ZkUC9MRllqY1FCWEtmMFNPRTZ4RHBTTVlYclhF?=
 =?utf-8?B?R0hsQlJEMXRYa2t3cnVTSmk1azlQQTJxa2tHcUV4SHhnandodjdmdER0N1hC?=
 =?utf-8?B?dW52azROMFhQUlVMRnVkNzE5UXh2bWhFNVZuemtneXR5a1RDRnM2eXBnNDlD?=
 =?utf-8?B?UmJ2d3YweTVabjk2VHN6N28vNENJd0IwZ0RUdm9QM2tPZTNjUFE3TWcyL25N?=
 =?utf-8?B?R1NkUTh6c3ZVQWt6cDMrN2NPTE15UlJHaysyY0NVKzZlcDhMczIxdklYaUl3?=
 =?utf-8?B?RVVIejdTcjhzN2NqTmRrdmJ1aWF0a0N1cXBjODZBdW1nbHNuZVEwS0RTOVVu?=
 =?utf-8?B?cjgrZWQvcG5RL0pMampFMzZ2SmhrdDBLVWU0RzFES2VEZFhpK0kwcHBhZWpx?=
 =?utf-8?B?SGNRZVMxWm1Zc0J3OUg5OWM4c2lMRXdNYzBrakFDWVV6YUpFSlJNZ2VoSm0r?=
 =?utf-8?B?Q3l3TXR2ekppS3dpNmQ0bEYyWkQwSFhZTnE0QzRrQWdhNVFEb0k1ZTVSdUhX?=
 =?utf-8?B?SDBLOUhiWjQ5THoxUnBDNGRUMjZwVCt4elF2TlQ5R0xYRVNWMU0rdFduWUJO?=
 =?utf-8?B?Z3dGQXRVRFRQcVdkTGNoMlozcmtCVmF1ak1KRHp0RHBvNno0aHRrMkZ5UXQr?=
 =?utf-8?B?OVM0YzBjTjA2U0xaOXpEa3hoeEppU1ZsQWhMbTBVOG5FWUZZYmRUc2FLZ0pB?=
 =?utf-8?B?ejNhSlZaMWVjR1RTc053OG1NMjNtT1NmU1NyN0U0czB1T0QreUs5WW8xdlJE?=
 =?utf-8?B?b3ZLcWVOTDkrN0dSNHlqRDFnZXFhSFF3YzdzNFFTZGN3S2JDSTM1RGoyUHQ1?=
 =?utf-8?B?MDRkclk3S3B2MlE0RXFGVGc3eWl1RlhLMGNYKysxaDJ2dDRqT3BxUUFzMnl5?=
 =?utf-8?B?Z1pJb1lMTHNZR0VQVFRHSUNpMEN4bEs3R3J0bEJPTC9ReG01eGk1TitLVVp3?=
 =?utf-8?B?WjVJTkQ3S1orVS9LcVNYR0NUdkoxbytXaCs5NkJhSnh2SGNNUnZ3VWdiTVlK?=
 =?utf-8?B?dkp6T3RZdGd1YzhVejhYUExmVVdCYUdheVRjQ0I4ZjZsejdpbGF1NHpqWGJW?=
 =?utf-8?B?QzJZMHB0UnhSa0l0bEFPYXVwQTM0UDJ6TUJqeDdCanB6RmtIdGo1T1RRWHA2?=
 =?utf-8?B?ekpNdWpFZU42SU52STV2d29rSExIT0tDRElLcUM4cTh0VjlMdHQ3OWxKc2hR?=
 =?utf-8?B?NEpWZW9FY1RTZzlsWEsxKzFySUxFQ2Vxc1RHSU44UzBlZzZxS0IzR1h6UG5V?=
 =?utf-8?B?NGMzUjgzSktlRWJ0RXdsTWMzRmd6bjB4clFwRm9lb0ovNndkWGhqRTNqNDd5?=
 =?utf-8?B?R1g1QnEzcm9JN2lpdE9aVlk0dUp6N1VnMVlKUjByT1dsU3lYVGg4N1JndGll?=
 =?utf-8?Q?3K0vBoYM5Ds5kRD8uGHJ/LA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fff2895-6c2f-4f48-c01b-08d9b63bd94b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:04:01.6204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bnr2KHWD05lFM08+KrhlyryhbhTb9AVHXxpcOO1R/tdLvjEaOKDeFy0KMqFgQvDDzocVNn6GeUUqK+2hKRocdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:51:15AM +0200, Jan Beulich wrote:
> This is to aid diagnosing issues and largely matches VT-d's behavior.
> Since I'm adding permissions output here as well, take the opportunity
> and also add their displaying to amd_dump_page_table_level().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -243,6 +243,8 @@ int __must_check amd_iommu_flush_iotlb_p
>                                               unsigned long page_count,
>                                               unsigned int flush_flags);
>  int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
> +void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
> +                             dfn_t dfn);
>  
>  /* device table functions */
>  int get_dma_requestor_id(uint16_t seg, uint16_t bdf);
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -573,6 +573,9 @@ static void parse_event_log_entry(struct
>                 (flags & 0x002) ? " NX" : "",
>                 (flags & 0x001) ? " GN" : "");
>  
> +        if ( iommu_verbose )
> +            amd_iommu_print_entries(iommu, device_id, daddr_to_dfn(addr));
> +
>          for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
>              if ( get_dma_requestor_id(iommu->seg, bdf) == device_id )
>                  pci_check_disable_device(iommu->seg, PCI_BUS(bdf),
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -363,6 +363,50 @@ int amd_iommu_unmap_page(struct domain *
>      return 0;
>  }
>  
> +void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
> +                             dfn_t dfn)
> +{
> +    mfn_t pt_mfn;
> +    unsigned int level;
> +    const struct amd_iommu_dte *dt = iommu->dev_table.buffer;
> +
> +    if ( !dt[dev_id].tv )
> +    {
> +        printk("%pp: no root\n", &PCI_SBDF2(iommu->seg, dev_id));
> +        return;
> +    }
> +
> +    pt_mfn = _mfn(dt[dev_id].pt_root);
> +    level = dt[dev_id].paging_mode;
> +    printk("%pp root @ %"PRI_mfn" (%u levels) dfn=%"PRI_dfn"\n",
> +           &PCI_SBDF2(iommu->seg, dev_id), mfn_x(pt_mfn), level, dfn_x(dfn));
> +
> +    while ( level )
> +    {
> +        const union amd_iommu_pte *pt = map_domain_page(pt_mfn);
> +        unsigned int idx = pfn_to_pde_idx(dfn_x(dfn), level);
> +        union amd_iommu_pte pte = pt[idx];

Don't you need to take a lock here (mapping_lock maybe?) in order to
prevent changes to the IOMMU page tables while walking them?

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C364FD33
	for <lists+xen-devel@lfdr.de>; Sun, 18 Dec 2022 01:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465509.724313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6hOW-0001Cf-Fn; Sun, 18 Dec 2022 00:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465509.724313; Sun, 18 Dec 2022 00:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6hOW-00019g-CI; Sun, 18 Dec 2022 00:19:08 +0000
Received: by outflank-mailman (input) for mailman id 465509;
 Sun, 18 Dec 2022 00:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG0F=4Q=citrix.com=prvs=344dde14d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p6hOU-00019a-2t
 for xen-devel@lists.xenproject.org; Sun, 18 Dec 2022 00:19:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92ef7eec-7e69-11ed-91b6-6bf2151ebd3b;
 Sun, 18 Dec 2022 01:19:04 +0100 (CET)
Received: from mail-bn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Dec 2022 19:19:00 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6465.namprd03.prod.outlook.com (2603:10b6:806:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Sun, 18 Dec
 2022 00:18:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Sun, 18 Dec 2022
 00:18:54 +0000
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
X-Inumbo-ID: 92ef7eec-7e69-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671322744;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=q3KoCmyHmJm16wFivrxH3UeEFyGbDKcU5m1dbLJFFLw=;
  b=Kht23nNdj5o8n4mJNhfST3i4L7i0IxPUWZgUyaaT55KdxmsdS3xYvsM/
   sr7j4J2erE5oV29G20n7/RSe1c0zXP2I2fe1czNTErotPiI4rQ6XnlYw0
   Wsd7w5sSgOjtzosnoiVqdT57f8I4YJDRPJE82Bwp3JzycORUZ2FPPPbzo
   k=;
X-IronPort-RemoteIP: 104.47.51.49
X-IronPort-MID: 88917425
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:epHyd6mctnmQrH0KbAh04yvo5gy9J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCj2CPfffYTHwL4p2OoiwoEsPsZ/dmoc1SAJtqCoxQyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5QCGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eYbDj4MbkqNu8en+oOCR8togs0fc9a+aevzulk4pd3YJdAPZMiZBo/svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVU3jOmF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJCReTnqqQ36LGV7korJRIEaVSnndeG1ESzUcBTO
 mwV4AN7+MDe82TuFLERRSaQsHOClhgRXMVND/cz7keK1Kq8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty8bniJE+iFTIVNkLLUKuptj8GDW1y
 TbTqiE73+8XlZRTi/T9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcvlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:4m/3oKrAREaioe0XfJS7jmgaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.96,253,1665460800"; 
   d="scan'208";a="88917425"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktTEa2rBEAIQMrIfBGkJLrdmv7oIHRM9LxHWKZhAqeld7o86ZXyhPQnNUp4+YETyGRh4l6ZT1NzRrGa05aPtnXqhrVKdno8mFZ/DgjdbL4K1OIainYHxRn+2kCFRGXvwt7zFSh0mMqbw74QUXrQISB/Rq92gE8jz93TORp+4lEqOrN4G2JCGwOFebFwqBVnhN4bxd0ROPBItu5e+bXC46LG3ZA+I4CspsmzBlHLjuWBZECQV61Bh0+vcuyyBgS20MNWv4K/Z/e+6CemWA1c86HfBvW/xwdHo5IPcXgTSQHRynAkrzIFELdhPSyFnQ2dla/XvisGllGGkj4dektuhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3KoCmyHmJm16wFivrxH3UeEFyGbDKcU5m1dbLJFFLw=;
 b=GGLnSaa00RUsiDcynmcEyASLMGiw8/y0VPvpM9tZSNAxM8c0nuG94nYjQ7h2IRAWeH2TycRwsm6pgOgnEFopT4avExlej+qK9dXMBEhwfLQnD/qmm7R21AJ9EUEor/Ff/slq0mUftkKtO8Xpakkc0lrPMQaWPXZeE90pUKRljJDgA6EY1JjatNvClVUFm9NaVE0wSEmIbXGEYhp4sFwL/1LGvutTqpyVX/0UYEgr8Zzn1Yqq5ngRSoKiOFPd85ZCDJgnZWsozjsV2PzV6TxDExZlQtKi3sBY6qnMvl5Ptt0sObjRvWyb9I0H0vwjhuXv6f9aNzWJ3BTqrhWwRrvGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3KoCmyHmJm16wFivrxH3UeEFyGbDKcU5m1dbLJFFLw=;
 b=ealHW86aLGcVrxW2pMPAtMBVOqEFdhxJXCOW3v/z/aXY6JUuKrLNLxKoEkyjPZ+P74blKS98eaVZKu59ecnWq4BtUmpNAwZWRTRH4vgIeGd5vot0PQvP2yGaw1cUyVOrsnXzNG8CcYw9MZWxWv0f3st2w/ZcBpEv2VJFA31+DKg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Neowutran <xen@neowutran.ovh>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [Patch v1] Bug fix - Integer overflow when cpu frequency > u32
 max value.
Thread-Topic: [Patch v1] Bug fix - Integer overflow when cpu frequency > u32
 max value.
Thread-Index: AQHZEj8ndYrlW6+ypUatP8oqlCOlc65yyCEA
Date: Sun, 18 Dec 2022 00:18:54 +0000
Message-ID: <8a9fb9aa-59c9-f177-7712-21c8d64adc1e@citrix.com>
References:
 <c1535eba0bba6fc1b91f975f434af0929d9d7c96.1671298923.git.git@neowutran.ovh>
In-Reply-To:
 <c1535eba0bba6fc1b91f975f434af0929d9d7c96.1671298923.git.git@neowutran.ovh>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA1PR03MB6465:EE_
x-ms-office365-filtering-correlation-id: 9db460ad-5e84-4c89-7dc0-08dae08d72ba
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 G86i4jDM2WJNVopE+Bp2jonEZfaKgJ3I5NPgRbNDPoD8a4jvxoto/wzBJsdTgBBaOgmUvQ62k/0QEmIBFCCGcy3eaEmkHbnridOOrezvoK0M6CPiu7vVSS1F91uHxakE9YJtr2xjsP2SgU+CtZ87rnKERu1KDqThi6v3wgrEWFxVL3wtIJYfw9FqGKJKqtE+FBlhCOVZgoxn9cOxLZgxppJaBVGbraDPI7pJ73JCPd0EIvg6/zjSYEGi0elbaxKJtC7diBkOPUNthcGClsoeE2cxk9LKQrVFOs1p5pp4xaOIwlXHV5ejpRuPHkNkIQ+aYbRmNmaSW8Rq3EM8TwuwZr6q/eaiBq2bT+OlJLTDclwS3FKMQfa+kwpFQS8AgEAcJKBa28a5GdIvhvQK3YIJSk4/PGJfjjMmT9u9aXdH1Z0HSH+Cwyd7z98YtzTxaW5soaiY19araWslyQD+FI6w4vsPp+rzm8dE54REfovzk+4shSQ5UrXX4XukzyJ6fL8mZ4BFuJwJ2Yq1eEvKv/D9CGVm8QMq5GCe8arUz7b2i1K8lixyXbPU2sr1rce5J6fUbfzbYpB6DbaR+eW1+2MTYmQrYeY5WQSkmc8op4Q78KH4+GFlJywO6u7IX6bwlY9y1uo/NaCwdFBQS6Ap4bbYBSX32D8ORPclLNQT6GVbvAHVaZzWbui8lzO/khaxKY4bhwz8zVxSWp67yq0/od6X4D+b/XYIg9lAUrZFJtdhL8AUZqsbZS2JrSP/LRNS2dx+U2vuE/k2Rcm8ofw2EazXCQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199015)(83380400001)(66446008)(38070700005)(122000001)(31696002)(4744005)(8936002)(86362001)(82960400001)(8676002)(66946007)(66556008)(4326008)(38100700002)(2906002)(5660300002)(64756008)(66476007)(76116006)(41300700001)(6506007)(53546011)(186003)(6512007)(2616005)(26005)(110136005)(316002)(6486002)(478600001)(71200400001)(91956017)(54906003)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qlk1WkdiTVdSbTdlbFRWaEhyQkRyclNWaGtLNGR1VVpVaWRvOU9QZEg0bWtm?=
 =?utf-8?B?TGxONmNPblA0OU1xNWZaNWhKUUVjTVF2SVZIWHlySURiYkVhOTJKRGtWVWNs?=
 =?utf-8?B?aDAxeTRTVVoyQzdjcXJNZUxweElzQzdscUYyYkM2STJJRCtkZ3VtMmlPNVdY?=
 =?utf-8?B?RjlYUEpqYXpoTHFOMmo2bWhNK0trb3VWNCtXSlpidUorcERjc2JyWkw5cktP?=
 =?utf-8?B?RWEvL2R3Y0I0NUYzd0tTVXNiSFN1LzZZdXY4TjF1MmZrLzdhTWNBbVFvNStO?=
 =?utf-8?B?aUYxaWhGZ0x0bFJ1WEZZNmhLOFVCaFIyV2tPVFl2QmdQOGNzWnZrT2E5Tk5y?=
 =?utf-8?B?b0JrZU1RSFhzamFXQnh0all1U0VhcnZzay9tQmpTWjFEK0ZQNG1xeFI1VjNY?=
 =?utf-8?B?MTZ2MVdaemJ4QkRSTFlyNHk2d2NvVzJIR3FObGJGcWt4eFhQRjI5OHRLWjlo?=
 =?utf-8?B?c281SEdRNE9OanlFaHlZNWJjZVBGSzA1emRWVkFxdUpuRlFvYU5CTFFIV3Vm?=
 =?utf-8?B?TFlVVGVPS2ZiTEpmL054ZXBvOUVRUExRemNRTExxUzVtRmNFZVFVZk80cWRE?=
 =?utf-8?B?WVFHbTZGdExodVlpdXBYN1dYRDZWc29NYmtCdUM2b2N4MjQzM1RxNFVpUmpS?=
 =?utf-8?B?bUNQbVZIOFhXRm13Uk5xenFHOE1rZDczeVd5aHVJUEhRd1FDQUtOWlVhdTQw?=
 =?utf-8?B?SjBxM0pQeGhTMmc4b3N4RGpDWHVmcVRYZGtMMXN1RUNQZHFmU3RnNDNIaEMw?=
 =?utf-8?B?bXFIZkdsSXBPaXJPOGFhaVFTdXFJVmZYNlNiL3JUVmZnUDNWWnRNQWdFekdp?=
 =?utf-8?B?WDB3U3oraVQxZEIra2F1M2x5cHlaKzEyeUN1cjBxd3dBMUdvWm93WWltOWJp?=
 =?utf-8?B?akZFN1RJbnVIb2tkVHVlZzcxZCt6Ynh0Z3orWU1KTFF3Qm1EeThwWUJFZTRw?=
 =?utf-8?B?aFZicm53ZGpmYzBRSk1DOTBMaWRUOWxMc2xtNGRyM21DZmpXNUgrck9ZSUNV?=
 =?utf-8?B?S1FVcTFMTTBmdDZrcTFTeFFlK3RJUUZZSzZrZ01NN1dDZzFhcDZmT05TMFgv?=
 =?utf-8?B?MEZnclJlQ0VhYWRMSW5xcnU3R0NXN1Y4N04yR200VVMzL2lqbU1Cck5XVTVa?=
 =?utf-8?B?RHIyUkY5ek9OU1daNHROVUY5S3BPYVFqL0I4dTlScVczWEVLcGtwb3AraDdL?=
 =?utf-8?B?NUNORVpzT1RTYXozcVRqNncyVGpaSVdMWVk3ZjJhd204Q1RyeU0xUWgvckZW?=
 =?utf-8?B?azNsY00vMVVab3dYL2dMM2tWY3QvOEovbC9WMElqOUNYWHVwMTJjR1J6ZzRr?=
 =?utf-8?B?R2lKYXRDQ1U1ZDN5b29pWk9KWlZ1UW9GeGN1Si95bTNiZEh1Ylk0Zis2eDIx?=
 =?utf-8?B?OVNkbEFzYWRrN0xrTUZzdzVrbUxCK1VOY3JYZDgzY0dndEVxenNCdkxMQ0Iy?=
 =?utf-8?B?QnExYnN0NG4zS1lyU0J1RWxjcG9Bd1RXNGkxbVBRMnIyM24zSWMvdFVLUXZl?=
 =?utf-8?B?WXQ1Vy95ZzB0c2VKOHJSNnpwaUFwL2YvdjlFNXg4ZGxTb1hoN2hsaFN6Vmx1?=
 =?utf-8?B?NU5zYUNtVjNlYnJrNCtnb2xPR1RNTlBPVzhkTFpZWFZqMWQweCszN2kzdEhT?=
 =?utf-8?B?c1k2My9GeHdzbE9ObnIzMk83dFdyNHl0dGozSG5LRmhPWk43Nm5LWWlMMHcz?=
 =?utf-8?B?TkpJSmhvMmp3d0E2UGZ5MU4wRkV1YzMrYm1PVzVzYUloQnBWYkRVZjAzL21Y?=
 =?utf-8?B?Z0k1K0diN242cXZGWExmM21ENWh0d0Y0ZlQxQ05wODk5MGlFdVpGMkpLa0xR?=
 =?utf-8?B?bjU0TG1RZ3NVeGZ3WXJob01PVEl3U0xyL0R4My9XZ2RQdFlpelJERjJJMkdG?=
 =?utf-8?B?QTVoWFNzTnJpckZDN2xrcUlNRnZ2NXRxR1pSQjM4QkYvSnZlTGg4SmxrYUxZ?=
 =?utf-8?B?NWZvZlREYkp0bWpsR0oxM1FsQVNYVHNJN2J2RU9XSmxhS013R2hvS2VCNkZI?=
 =?utf-8?B?SGZwbXhqQk1NeGdtNGd1ejVZOW9BUXozUE9jMmNqWENkK2d1RDdNNzFTNllP?=
 =?utf-8?B?cmY5Q0N5L2FOZmY1a3J0alg3dW5qd2pRQmJNL21INW1kaExBNkt3RVhJZmNa?=
 =?utf-8?Q?XLWvcPanIBoj+F2Gy0e0IRzUt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6317DDFFB7AA641BBA416EA4C4AF327@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db460ad-5e84-4c89-7dc0-08dae08d72ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2022 00:18:54.6025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Bmc8OtdIeKUbPfi7C3keRmZ1Q9nk6dAT1kZsQT1IOpD9IVYCCEn/h3Q6SZob4jNr/Em84Idjeu+iYePfTQ1xdeRF9SXvj+hKYVK9S3lEOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6465

T24gMTcvMTIvMjAyMiA1OjQyIHBtLCBOZW93dXRyYW4gd3JvdGU6DQo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvdGltZS5jIGIveGVuL2FyY2gveDg2L3RpbWUuYw0KPiBpbmRleCBiMDFhY2Qz
OTBkLi43Yzc3ZWM4OTAyIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvdGltZS5jDQo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMNCj4gQEAgLTI1ODUsNyArMjU4NSw3IEBAIGludCB0c2Nf
c2V0X2luZm8oc3RydWN0IGRvbWFpbiAqZCwNCj4gICAgICBjYXNlIFRTQ19NT0RFX0FMV0FZU19F
TVVMQVRFOg0KPiAgICAgICAgICBkLT5hcmNoLnZ0c2Nfb2Zmc2V0ID0gZ2V0X3NfdGltZSgpIC0g
ZWxhcHNlZF9uc2VjOw0KPiAgICAgICAgICBkLT5hcmNoLnRzY19raHogPSBndHNjX2toeiA/OiBj
cHVfa2h6Ow0KPiAtICAgICAgICBzZXRfdGltZV9zY2FsZSgmZC0+YXJjaC52dHNjX3RvX25zLCBk
LT5hcmNoLnRzY19raHogKiAxMDAwKTsNCj4gKyAgICAgICAgc2V0X3RpbWVfc2NhbGUoJmQtPmFy
Y2gudnRzY190b19ucywgKHU2NClkLT5hcmNoLnRzY19raHogKiAxMDAwKTsNCg0KQWggLSBJIHNl
ZSB5b3UgdHJhY2tlZCBkb3duIHlvdXIgYnVnIGluIHRoZSBlbmQuwqAgT25lIG1pbm9yIHRoaW5n
LCB3ZQ0KcHJlZmVyIHRvIHVzZSAodWludDY0X3QpIHJhdGhlciB0aGFuICh1NjQpLg0KDQpBcyBF
bGxpb3Qgc2FpZCwgeW91IG5lZWQgdG8gc3VibWl0IGEgdjIgd2l0aCBhIFNpZ25lZC1vZmYtYnkg
Zm9yIHRoZSBEQ08NCmJlZm9yZSB0aGUgcGF0Y2ggY2FuIGJlIGFjY2VwdGVkLg0KDQpBIG1vcmUg
c3VjY2luY3QgY29tbWl0IG1lc3NhZ2Ugd291bGQgYWxzbyBiZSBncmVhdCAtIGl0IHdhbnRzIHRv
DQpkZXNjcmliZSB3aGF0IHRoZSBidWcgaXMsIGFuZCB3aGF0IHRoZSBmaXggaXMuwqAgRm9yIHRo
aXMsIHRoZSBrZXkgdGVybQ0KaXMgIm92ZXJmbG93IGJlZm9yZSB3aWRlbiIgKG9yIHZhcmlhdGlv
biB0aGVyZW9mKSB3aGljaCBpcyBhIGNvbW1vbg0KY2xhc3Mgb2YgYnVnIGluIEMuDQoNClRoYW5r
cywNCg0KfkFuZHJldw0K


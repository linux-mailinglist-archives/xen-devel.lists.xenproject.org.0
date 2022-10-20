Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA714605E60
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426578.675108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTJN-00060q-2f; Thu, 20 Oct 2022 11:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426578.675108; Thu, 20 Oct 2022 11:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTJM-0005yE-Uo; Thu, 20 Oct 2022 11:02:04 +0000
Received: by outflank-mailman (input) for mailman id 426578;
 Thu, 20 Oct 2022 11:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olTJL-0005y8-7F
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:02:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9deb8691-5066-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 13:02:00 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 07:01:47 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO3PR03MB6710.namprd03.prod.outlook.com (2603:10b6:303:179::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Thu, 20 Oct
 2022 11:01:45 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 11:01:44 +0000
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
X-Inumbo-ID: 9deb8691-5066-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666263720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KmCyTak+VODO0QMq72yeqEp7X7xp5qmgcjEkBN+xIjM=;
  b=NHwDlXndffwNnkPb9qSjJ0wSLS5vVrFsxo1eThFFuda6EhCqD/E8Qocb
   8vOMgPd+2GeL+wqY17n0ZDvy6pUN+UiMaMflHlSHy4j1J0d0pEHmvu5N7
   sfoqKh3A1vF44UUbw7Ya/sKbQ7BUMljsswDAvlMgFnu54sVuSYj8bGljM
   Q=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 82773652
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zHIY1q876vLgltsH4J1UDrUDl3+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GQWUG6EPqreYzHxctF3O4u0o05TvpfUnYJkSQZv+Cw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5ARmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sp1EWNyz
 LtfFAsIcyve2+iKwrmVT+Y506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toijz2bSRwHmTtIQ6NbCS+vM1hVOowH0YBgMNd2aGhtPksxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9+4FHhRqubyRDHibprGdqGrrPTBPdDFSIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCQJuLpzm07hl6Y0z4=
IronPort-HdrOrdr: A9a23:EXVSV66k7bfgYfk6QgPXwSGBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKkyXcV2/h2AV7GZmXbUQSTTL2KgbGSoAEIeBeOjNK1t5
 0QFJSWYeeYZTYasS+T2njCLz9K+qjizEnHv5a98587JjsaE52Ioj0JfzqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCeCmMeV+bOitXXnNa+CCR2cCIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwlv31nPV7b5RhNz9o+EzcPCku4wwEHHBmwyobINuV/mruy00mvim7BIQnN
 zFs34bTrROwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpOSfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvGbf2UIUh4LD3wXklXKvpREnBmc8a+a
 hVfYjhDc9tABmnhyuzhBgg/DSuNk5DbytuDHJy+/B96AIm40yR/3FoufD3oU1wiK7Va6M0lN
 gsYZ4Y5o1mf4sxUZ9XItsnbI+eNlHtKCi8Tl56Z26XYp06Bw==
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="82773652"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4yk2h6uwvlkhyexMjIH7jk1w3bOSAhj/A2upPdCKU+/8HR5hPpHzxGOQXFUZ+8F64rI+UM2KFwPbY5A/jJ8i/DEzNWd2NhN4BN+tvdyA6J4GckwkW/QZ0g++3PLqgAG5L6f5JESm+6svzAGeMNIc82fMiwWS5OGBrBkdff1+OwvosGx0IIYwljyPJi+YBDEySme3gXSv/Dw+qVJraSwVqvDtp8HHP0NZd3yXq8faGqi5mth3t7QguoMNl+thBYEJogeFFLwsWblymlk/UNitAY7/47ntGgELKsRE4fRNa5Uilv60a5azV/p2ZNfdHEq6fHFVu3UEWVIhu/VAfmnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abG0llaJ4lf+ZHf60Txqxj+V4pUUt/WOv1efd66UfDg=;
 b=VnAoF866FJGnOSP/B1nyYWm/+nnPewyVU6q/yEYln7JLqjV32YncXzFWaafbcUFCpnxdr72EqmYfRoehMTtqQdgahst7uEiDMVJcw08TgTRjFfbCtuhZS/CvE5WNnwJbYlGZXO2j0i45GWjCPGR12NWLGMFG1uMbqXIhDB++qPehgY9qAE/0fqybebdFDTIck5I4aZtbZwQZ32AoB2IRzW+xv7NM7tEPCSP7sq6zUh3kNpmu0Fku6F/qisK9KW9cqYlBhxx5s4+KnzdSwC+QdH78UHBGdB9kyCKpbZgXeltT75g1z9nwBYzc3RPSxatC2JPk3Bn2QGudalL+xtw5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abG0llaJ4lf+ZHf60Txqxj+V4pUUt/WOv1efd66UfDg=;
 b=PDNai1mLUC5K8RkErxiMjvgOZIROf1tyaVoViT5thiePvL3ByHsPiG/67pVgK+l9XqusRC7LQVW21R8nO10wBi5BoNuqkZj/zTg4u+PP9b6S7Br23c29ILrdGxsKh1CFy8zNJQGMcf5KasibN5RuVKZcW0v/x//ndw/SRnKSJqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Oct 2022 13:01:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Intended behavior/usage of SSBD setting
Message-ID: <Y1Eqk6D0dBDR4m4u@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: LO4P123CA0541.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO3PR03MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b47f8e4-8225-41db-d917-08dab28a79e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7HdoB+TbskL/ItciKf7Ir80FKYbH/+jRqc/S3hCl2bAy13ADmgSPKfyLwLnOGc+bLBfb2BssgQtW67mWLIKH7k5RYicoF0AE9BVbAmj9+4djHvsk7K7slzsnVgGS5+R3F3IHM3TTGyswM3hCTfeDALfl4W/+wWOMLI1SdrxNDj4Ng8vXVdquFfOEzQYOewQTp4NHCJOeqmoMSGklJ0K/8E5c6j3KnWg8fxK2s8xBZofS8AdXOfgdmquoj3FyPLmf2ll15JFVqiKQuJdEqAXAe7I252HxvxzJwFsYlGVlFqmsvG0E69bJJQeZK8Hx3dd9ia3MgaMK9SFk+5vtgjdCQUaSMw2qSaolU+5Ve9FP8nqv7UaPGgcgiS1ddQ3CMTLaAvNJRMnJhLI9pXRBSt290d5eZIZVk++L06a9q8e0HF4FHpa5ouk0pCkv49w2Mf4lLKEQTfhyqE0urZhxQKwPABheM78eBvgodWoI+yQrZAgql+3kdayR5TfKOCqEHdJo1T2JEJkRadunhpFCe539SeAQ2AHKRCB9+bknLBsF4wMHvpDZnGyPkDd973pFNWL9fDhpP3s9u4u2VuGl9ahP5EHX0VtV/PtpPU/T82TpjIwdIqwpGSy6KSqtDTZSKUfovD1qc52Lp4X/UsxA3ywSgB4EIGdV6DiEG8XOSbQe9Qns36fxGGPvxZJJrEVdGKG5go1OUUxEIa9Lr1zn5xCZlmuq6/rqmkp2nJy2+8STHUlXXsM20gZhXvRTGknMLyzU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199015)(85182001)(66899015)(66476007)(5660300002)(38100700002)(66946007)(86362001)(4326008)(41300700001)(66556008)(9686003)(6486002)(33716001)(6666004)(8676002)(83380400001)(186003)(26005)(82960400001)(54906003)(6512007)(478600001)(966005)(316002)(8936002)(6916009)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDRvUnlGb1lOQ2t0aGtjYXU4RkczTndvZGZzVzdqdTlIMnUraFhwRjlRbENu?=
 =?utf-8?B?YUU1QldvRTFmM0FIem9xTnJLazgwcWNTSXZ5S3RKb0dpcWdLclVzWWVSWm5R?=
 =?utf-8?B?aGZ0TStQUEZCem9qU3UxZnFVaXlybFNSdmlRY0VneGQ2OXU4SGQwaWRNM3Qv?=
 =?utf-8?B?UVBHdko0Mmo1TUs2SXQvVGpCQkYxL3UzVTFyS1Jlb1F1OGJtK3RNekZaU3Nx?=
 =?utf-8?B?aC9uUXFoWVJsSzVraFJCL3BRUlpzZXNaWFFDNDFSZUVxUTloU2lWdlhKeDQz?=
 =?utf-8?B?dFhvN0FTaEREUWFrbnpRMnpZdWdhK0ZJOVZGOVBvWDZFK3FNdEMxZTQ5aXZ5?=
 =?utf-8?B?TU1QS0JDZTFSNW83SXRLREhVZU1KekJJR2tsa29xbFFxZVY4U3ZXUTBLdEsw?=
 =?utf-8?B?V1ZHUXM2bW1zYTZRSUVZdzA0U0M2NjQxekZCR0JvNHMyWkM2TmVhY21TK2FB?=
 =?utf-8?B?N25FT1JFQjBFM3NROStCaERsMUloeXZGT3JOTVBydkZsbCtPb2pJMkFwZ2pN?=
 =?utf-8?B?NUplU3ZBR1ZlUmQrTjJ2SGpSWXhVUEl2dUFzVWJuYUE4VU9YdDUzREptcFJC?=
 =?utf-8?B?bW9YbzBmZzV2SUJmQzdUTTRXZmt5bDdvajJHWUp2QWxKMlV2T3FzZmI2TFp3?=
 =?utf-8?B?Sjk3aFdVaEgyakRmOUdQam0rTFFxM1dEQW5aSjRkbHVweElTZzNwMjVlOStS?=
 =?utf-8?B?Mk9pekIyb2Ntc2dCaGJaV2x3UURUcCtDYzFsS0NPQUxWd2RJSTVNVHpaaWRO?=
 =?utf-8?B?WXF2dGtNcmNyS0JJaEZlNmphUzVNaWVrTXVieEQrOEc0QWpnQnkxdC85aWJO?=
 =?utf-8?B?d0VYNWJlckxCaW9aNUpobjJHd3JJaktzSkhZY2N5WTlTS004cWdBTU1HdkRm?=
 =?utf-8?B?anpEdTNkOWNHKy9wOG1WcEZpdm5WMTdhNkcwM0JzZVhpQ01DbFN5U2xKTUQ1?=
 =?utf-8?B?WGtLS3lTbFFTSVljOUZMYm9VaGpVM2dsYlBrUTF1NVBzeGhSMlhtTFJocjhX?=
 =?utf-8?B?Sk4yT1dlWkVlMms4YzBGQXhrOCt2aUZKNUgwNmtTYnZGWEhBTmFxVnRrdFFK?=
 =?utf-8?B?QTIyazZiMlRVVDJkVnpBdHQzdWtZMDdjaUd1RHpVUG5iRWhTLy9XTCthRTRS?=
 =?utf-8?B?eEx4RWduRTRFSmFqcHl0dGNPRGhrSHZacjk2WUp2Y0ppdWNvQVlGVEZMQzFt?=
 =?utf-8?B?d3JXM0h4ZTk2YjNSNEVpUktLUWZaOGhjWWRwcmJQQlRoUnZTOEhFTGJVVkw0?=
 =?utf-8?B?a1RtbUZFOE15NjQ4WjlwMDh4NWVIeEYxeWhBY1UwcnErMWx0MXkxcDh4a1Rp?=
 =?utf-8?B?ajFodXlTVGxnYm55c1FmbGduSE9KbHFFSXVYc3g0ajNSOUkxdU4xbmJ6YkZB?=
 =?utf-8?B?bjB4SUtxb3ZXanJtYTJ1Q25zSm50L0RVaml2aE1nTGs2ZnhqTXVZMkhCeFZJ?=
 =?utf-8?B?b2sxSUtIR1Z0emtIZ2Uvc2RNMEhFUHA0cHlWUlpQZFAraGxabGNPQzUzRE5a?=
 =?utf-8?B?bXJMekIyMUJRcUZIRGdhYWZxbkJSQlc5WEI3U3YydElrWGxMM1crTjRMUU1F?=
 =?utf-8?B?ZEtUNVg5eHlreitpZUJQNGNvbmgyTEEvSmN4U0hHS3BKZ2R0VDR3ZGVkSnln?=
 =?utf-8?B?S1IxaXl6QWZjTXg4TVZvdHNxVWREcWRrWUYvbC9SRk1kUUJXNWwrZFpqd1JI?=
 =?utf-8?B?ODB2aUNUQlJOOFRhYngvajRrbGFPeTFXVXBEOWVmSnBqUS9FSXdFeFNGZEZk?=
 =?utf-8?B?THNPNHpuR3U1eGRCV2s5enV6WGNTVW5XSENiaXM2cDZ4RmRoaS9Cb1lSQVNv?=
 =?utf-8?B?Y01mN2tMQ1NkaWM4U3k3YnBBSktjVHVsTEJQSVFSWjRFVy95RnNwQmdlM0pn?=
 =?utf-8?B?TDIxb1JxSFY2VDR2NEFTcWZUUGVqVE5qOXY4QitvRVJoNDNHbXZWSkU4TlJ5?=
 =?utf-8?B?ZWtvRTE0U1JTTlYrcmkwcDEzRmR5TnpralJ5eFAwZVRNZnl3TFgzUmMrbmJk?=
 =?utf-8?B?VGkzK1dxV0RuZndQZHRxeXhnSVRybnh5UExKRWpGMDFNMWlnS1Zkc3VrVlMy?=
 =?utf-8?B?QUFZcEUvV2hkLytGQkNhR00yTXdYTzJEVFNLSU5XVUV2RTFLaldhdFNnS1NH?=
 =?utf-8?B?MS9MMWF3bnNsYVg2aUdiMDNVUWVLdlowanBNM2ZWVXZtOXl1VzBpODROTGVp?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b47f8e4-8225-41db-d917-08dab28a79e5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 11:01:44.8871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtnNCEvhYXVWrD8A0xkQUegBKPc0Hz+iuK7A/dfKz10LmebjraOrfrUlKGa2n0TQVbyh5n7AapHP6bN6Tkx1hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6710

Hello,

As part of some follow up improvements to my VIRT_SPEC_CTRL series we
have been discussing what the usage of SSBD should be for the
hypervisor itself.  There's currently a `spec-ctrl=ssbd` option [0],
that has an out of date description, as now SSBD is always offered to
guests on AMD hardware, either using SPEC_CTRL or VIRT_SPEC_CTRL.

It has been pointed out by Andrew that toggling SSBD on AMD using
VIRT_SPEC_CTRL or the non-architectural way (MSR_AMD64_LS_CFG) can
have a high impact on performance, and hence switching it on every
guest <-> hypervisor context switch is likely a very high
performance penalty.

It's been suggested that it could be more appropriate to run Xen with
the guest SSBD selection on those systems, however that clashes with
the current intent of the `spec-ctrl=ssbd` option.

I hope I have captured the expressed opinions correctly in the text
above.

I see two ways to solve this:

 * Keep the current logic for switching SSBD on guest <-> hypervisor
   context switch, but only use it if `spec-ctrl=ssbd` is set on the
   command line.

 * Remove the logic for switching SSBD on guest <-> hypervisor context
   switch, ignore setting of `spec-ctrl=ssbd` on those systems and run
   hypervisor code with the guest selection of SSBD.

Which has raised me the question of whether there's an use case
for always running hypervisor code with SSBD enabled, or that's no
longer relevant if we always offer guests a way for them to toggle the
setting when required.

I would like to settle on a way forward, so we can get this fixed
before 4.17.

Thanks, Roger.

[0] https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#spec-ctrl-x86


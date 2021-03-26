Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92DC34A5E1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 11:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101680.194600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPk66-00037u-JW; Fri, 26 Mar 2021 10:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101680.194600; Fri, 26 Mar 2021 10:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPk66-00037V-Fh; Fri, 26 Mar 2021 10:53:46 +0000
Received: by outflank-mailman (input) for mailman id 101680;
 Fri, 26 Mar 2021 10:53:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPk65-00037Q-4h
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 10:53:45 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26ee71e4-b124-491c-b293-9e6e1dfe8183;
 Fri, 26 Mar 2021 10:53:43 +0000 (UTC)
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
X-Inumbo-ID: 26ee71e4-b124-491c-b293-9e6e1dfe8183
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616756023;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aRqIjrcKlHKIaxRqet02qxVliAwPPtnrLbdQb7iZrsw=;
  b=LTj6dNCvB1yQkha2wBdZ8VOzxu3rwZW2/Dqonh71vsAugzVFMwVH6nSN
   5ybyt+MPnjfkH7qpcVQ405GOa8tPcCUi5tbwX9Bf53qErUfArPFFQJK3e
   yUoq58bKvg8+g+1hs9a3IospmUz2rkKsvYVgPzBhkSqF/CNlWAKLulMJv
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BPMC3QQWLI6C+luD8ogDkuzYm2uOn0YjE2alDh6A/QqYLKyyG7n+cPXF2JPedmJByDVsBKzX56
 cZi5VemoUqOaWLUzgzE8YfeaY2s2O3/QGaDaAcGX7nVp3oZFge314CSmfyBL2i+CAo62gLCvBN
 Q7SKZHs4w566LBS6VptAQg2UzBTK+m4QNLCMJdLXFh790zrT2vbDK2WMpHrl3DhBYpYvw1djUT
 8ECipVNK7LzzCQoHbwl+EZwVtfuOTrGlLf8NVIosLStnvtL9LMsuj38oHzG6pZglFLpyn2JImD
 wTc=
X-SBRS: 5.2
X-MesageID: 41648888
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:swwzOaOGpqkLm8BcT27w55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiDtRIACdD0FwWU1iDZ02CJ
 KT6qN81kSdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LW1JfRFR+E0hACFw5e2LtKyx
 m4ryXVxIWG98u6xBjVynPJ4/1t+efJ59NfCKW3+7MoAxr2jALAXvUZZ5Sju3QPrPir+BIWlr
 D30modFuBSz1+UQW2vuxvq3GDboUQTwlvv00WRj3emgeGRfkNDN+N7iYhUcgTU5iMb1bkWus
 87vBP6xu5qJCjNkyjn69/DWwsCrDvTnVMYnfMOlHsaaIMCadZq3P8i1XlIG5QNFj+S0vFDLM
 BSCqjnlZJrWG+BY2uclmdix8HEZAVIIj62BmIGusCTzgFMmmF4w0Yy1KUk7wc93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MFzxGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOuNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rciK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW87Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjqwu4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjwwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVj
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW00pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/TvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF363ACyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxWyhl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/ZpB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/koNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUD8qg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJwfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3uinHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczq8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Std+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rdkj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXCvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmRSae+jQuUIqk1xX/DFhmBrM4+GdkRbmNHADFxbYjJVQVSRUKV6Sg6
 3+gLOl6Eg=
X-IronPort-AV: E=Sophos;i="5.81,280,1610427600"; 
   d="scan'208";a="41648888"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUjeWDBpsU7ZnEtJvLj948g93KZVZeo+wYpWX5lY63ddr2cHJV7rGmB6QmKD/pQ1zRn+HQHGBQGkFu/WFE6w0vNminyX2FPsxk6yTq+URQO9RE5NJxxiWsWFbC3Px86XrJU0YVUh1LX80DnmEX1pRTeVL20a1NyX2yys4gIdIpotEyqUiPvNXrAspiUTlM0xAE16gTYvzCgkmO2OGhH5KVCyPu7F+nvncJTgt1t8q4A7C4fQo15E/HlpcsqMn94oeHJfOOsBrEvps4oKjNKKeUhi2zolizAt0iyCQPMOSWARf4qRAOZ6MihXxiasFlHIpKfpvb5P5b45XIzsCKGrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkC704RI6VF980EysnwaIyUcwhxPvWjxLhllc3NFAtM=;
 b=aWWSk4UZ6hj6xjc1HBYPQKRIHCuZw1BYLdwAHz0+8DMzYGJkaWkXdfgkSoXsI6s+05CYJegPHDmjFKv7KicvgQQjRtphp5UTn9W5Hbsn3/SuNpCJ+oCS5JrDyT2Wd1LZY+mg1w0JO0ruX5Ul2gIOaa9vIpY6PjbKbcOSnEOSqaUMAwQsNEtxZYR1K4xsELqmdUTatIeerSGrK4g2cHcTLXL2XZ75Jg2S1oXmp0eNqRic/urSG0yBv+gK8/k7nGdiWFwGpVDuD9NQnC2VyFIUXHxij+IEXQez18AejJozoOYlCgGBQaupx//kQJh6oqCQRu2AguRYll1BxQhat7hy9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkC704RI6VF980EysnwaIyUcwhxPvWjxLhllc3NFAtM=;
 b=seewK0U4mitMn4rj4o9mnFTw+sSpAd+9ngPxooSNI7Q4KcT7i7XBqLOrViP5RhfYe1gBieAWVj3UsYhH0ag0kMQyvkx+HGvegbQ8QctEPeVTXMVun8j8cGHv7g1JQlW7vcLJbZe70azNyTj6xgyhJV7m87jBslYhqnCM5JslXto=
Subject: Re: [PATCH 1/2] x86/hpet: Factor
 hpet_enable_legacy_replacement_mode() out of hpet_setup()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?=
	<frederic.pierret@qubes-os.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210325165224.10306-1-andrew.cooper3@citrix.com>
 <20210325165224.10306-2-andrew.cooper3@citrix.com>
 <3ef41d04-cff0-5828-8373-af5f42a4f857@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <db791e8b-0070-60d4-811a-80004caae1c3@citrix.com>
Date: Fri, 26 Mar 2021 10:53:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <3ef41d04-cff0-5828-8373-af5f42a4f857@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0222.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::11) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d8a13fd-e3ea-4883-0288-08d8f0456a1e
X-MS-TrafficTypeDiagnostic: BN6PR03MB3265:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB3265A7CCB14B1EAD3D80560BBA619@BN6PR03MB3265.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KN3leXUQFGGFxH9nkoJpQmPIazIyj4m7VVnZ+Un3n7kH9bIkEnjepLUQfsHLhm4IA3JSqmXEWEgzBBUdVe4clQD0fzlYIaNI8drUaEAG7RkztdoUXzD0Eb5q258yfkbhRuJ7ZhRxQmo4o2dndwDE7rXqsWtcDBISuyvwj0VIL7SRpFxTje5Y7ZfmQATN5iVKBIUY391A6O2pb7/FSLqv76XSGVI0kNgnZ9xJRxGzwDo/L4eZZ2MnlD3Pk9nwz78jVGPOn20PQ6bZBe9AJur/excLj3PRnHttt3aSd85bYVyoLvwA2uSD9qTH36xhJ7Mqyu0m7+20lsnTLKw9YUsvXPoNIkc9pPN0OKNF4xN4s1EYr4mhCckRIY0+ju2FmfZuD/ms/wEqoIJnfMQJsQOcbtyngKhrqycf6KLeLSIu8cFbF4k5w/MWIXTx6mUH9G3EXR45XSKYJS4TLU3IE3hvpRPCFgkg56fv/eCtmb8JEEXE2nuM2LNb4aoD14R8cyuvyqW+6Ym/7NWRDMApwZKgXrUVJAFqVqOqu+NupatXGMbezJNQEv8mU+5UQ0rlFIvFFmOtio+4Yfr5m9taQUBWgEGgTpc1EjPvGgVlIr+crHo35yp8f+rD6YKa6406xfCMWR7V69Iov5u9B+m6EgIA7j6LvAjqQWQYU/dc+TtUeU4dP7rego7QGrlW/d1lJFsqTyX+OyfwB1FT/fJb7pBn3JKvjqo5PFoXLYBERBwMS7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(53546011)(8676002)(956004)(186003)(4326008)(6666004)(31686004)(2616005)(16526019)(86362001)(26005)(36756003)(16576012)(83380400001)(316002)(6486002)(38100700001)(54906003)(66476007)(66556008)(66946007)(6916009)(478600001)(5660300002)(8936002)(2906002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dlBDSmJ2WElNZDZUYUtadUJiNFlYcG15bHlnQjI2SHR3azArSWZ1aUhaTVBa?=
 =?utf-8?B?MkRtOUdmYWsxRjZtN2FjaVJZS1J3VEFUZkpzSFBDVjg0YUdzZk5NNGNxQU1y?=
 =?utf-8?B?cEhMZERIOGk2YnE2Yzh4RUtHNlZGLy9DUDkzUHRPUEV3bnM0dUJJZ2tLK3R2?=
 =?utf-8?B?SmlRVktBaU15ODVSb1QxemRvMHlBVkRJT3ZFU2xlZkR1WmdHQXRCNlJCK2ly?=
 =?utf-8?B?VnZ4cWFVbWQ2V2lCMW5YOG9ZUG1SZnd6aHp0UUNtcENMWmlyZ1NQSU45SndP?=
 =?utf-8?B?ZGxqMi9wMy9QK0ZwN28zNFUzTURMcStFVi9FOEZNMllQYmh6TGdxaHVKbGNI?=
 =?utf-8?B?L013U3pENU1ROFlCY0V0QzRuVlNhb2FidnlRdkZFa2s2ZXNrb1R2ZzBvNXFL?=
 =?utf-8?B?aG1pMWdhT3ZjZmpmUnRQUStWdEpnWXN4WWNpdU1lZnlCb2FTNUo3UlZNNlFT?=
 =?utf-8?B?OFNlU3JuZzVBMkNTL0dhQVRDczk0UXg1Vk43cXNoMWlueGNweWFhSlBQV0lB?=
 =?utf-8?B?TTRIdnB1NGpUSXN4Wk1JZUJSQVRnOHJWTForTnJQZXh4RCtpVStCR2MvYmU5?=
 =?utf-8?B?TTBDK0ZRSFB3aDB6Znh2ZEpPSUMydUhQc2FWWjJ2ZnlvUU5Pd0FOQzFkQjVG?=
 =?utf-8?B?ZlFLRlk2MjR2d3M4UDZ6YWd4VjZFeVFJY0lUSnVjays3eURtSEVFZGpGS3Iw?=
 =?utf-8?B?bXJWZllEbUx0M1VnUWVHYi8xQTVyUXJwbm5OVmllSFI2RksvMk1DN3FMUVBw?=
 =?utf-8?B?Z3FWNUV5c3Rka1d3R1B4ZTdYZ1B1OWtwMjVGZkN6UEY4ZjRHd2lLTzBtM0tW?=
 =?utf-8?B?V1hDaE5Oc2xDeHpGK0lKcVkrdmhvUEUyMHZtcmFZQmRFNjZhcmxOZ1pJZU1N?=
 =?utf-8?B?bWtwR29tbDRqOGdCUE1YM3VlZ2hoUU01NjFOeW8wTHRTQkVFQng3enlScDlz?=
 =?utf-8?B?ZnluTW1lMGtpNUtpWVphWnJPVmxYc0dRWTR3NXhJaGd0YTUrYW84Y2I2anVB?=
 =?utf-8?B?ODFHMlh0TjhyZEtpRjNBMUdvcWluR3N5SjdPQ1Z0VzJkalFGS0VFVEFtK2VK?=
 =?utf-8?B?VTdUek9aMU9EVHNqalozamRwSFo5VFhJTWtBNG5rK1dJUHBWdFU1ZjJKc2hZ?=
 =?utf-8?B?MzNlbWtTS1Z0NnpHSGtYWU5UU242eHBzUkNJVk8rUzVHQXhRVEtISDBWQmR5?=
 =?utf-8?B?U3JQK2ZHVjl4WEdOUklrbkJsK0FxM3Z3TTNKYVJyUnVkdXpsUHE3SndSWlhn?=
 =?utf-8?B?VFdIcFhrQ0hSTitTbXZIcU94SkczMUVFYUovWUkxZnh6WFpNc0pNMHZhU0Ny?=
 =?utf-8?B?VjNBb2dHTFdWVmJ4bjV4V25ESEg4Z2JvVnJ6bTBISGlxV1ZZT3oyYXljSlo3?=
 =?utf-8?B?VGpMTWh5alJycU93V05qeU94dlMyUXhTMjloMThheG11U3FPR2Q5WjczYXk0?=
 =?utf-8?B?WkxDZVpvUERpaFVwOWEwTUxTK29MenRHUjRGUHlGQ085dTNoT2ZGYzU0RHFU?=
 =?utf-8?B?a0RSSDEwSm1XOGNlSU9LUlhRdGZTNWxwUG5YZFhrL0JUWHQwV2E3SXFDaU91?=
 =?utf-8?B?ZU5SeWVRNVNrZnNFdFByYTdreTFlMnlsZnFyaFRYSEZ1ZkVMYS84SDB6Mk9T?=
 =?utf-8?B?ejU2ODMvSUxndzJCWTBkbUg4QnRoemxyVkRVWFVkQUdwM1RYbzByS1JmWEJl?=
 =?utf-8?B?STVpVGEvRm52MWZiVWhkV3lHejVBK3dIVGFDbGQxTXVKaDUvOWVhcFpWRkxx?=
 =?utf-8?Q?LSyUT41TX/VgkgfvCaUWPIJCHZ6C8QD/NZq7Dh4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8a13fd-e3ea-4883-0288-08d8f0456a1e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 10:53:40.1073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rG53FXsxHSnumwywhPyW3n2u5bKigkX9HY8uRU0xqj5Q7rpp5Qc1xCpIwOddFpjbEu92ZQXN4YoXQpFIP2UGaTNDn9DpolL3TaEARhFoPts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3265
X-OriginatorOrg: citrix.com

On 26/03/2021 09:59, Jan Beulich wrote:
> On 25.03.2021 17:52, Andrew Cooper wrote:
>> ... in preparation to introduce a second caller.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Generally
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

> but I think there's one small code change needed plus I have two
> nits (and I expect that this change wouldn't be committed without
> patch 2, as making the function non-static isn't warranted
> otherwise):

Yeah - I intend these to go in together.

>
>> --- a/xen/arch/x86/hpet.c
>> +++ b/xen/arch/x86/hpet.c
>> @@ -754,11 +754,70 @@ int hpet_legacy_irq_tick(void)
>>  }
>>  
>>  static u32 *hpet_boot_cfg;
>> +static u64 __initdata hpet_rate;
> Use uint64_t as you move this here?

Ok.

>
>> +bool __init hpet_enable_legacy_replacement_mode(void)
>> +{
>> +    unsigned int id, cfg, c0_cfg, ticks, count;
>> +
>> +    if ( !hpet_rate ||
> I think you need to also honor opt_hpet here.

Can't (order of patches), and also no need.

When opt_hpet is introduced, hpet_rate can't become nonzero without
opt_hpet being set.

>
>> +         !((id = hpet_read32(HPET_ID)) & HPET_ID_LEGSUP) ||
> I don't think I see a need for the assignment and hence the local
> variable. Dropping it would make the code easier to read imo.

Ok.

~Andrew


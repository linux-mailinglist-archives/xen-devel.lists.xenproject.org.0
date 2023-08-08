Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889937739E6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 13:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579696.907789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKns-0003qu-QT; Tue, 08 Aug 2023 11:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579696.907789; Tue, 08 Aug 2023 11:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKns-0003nm-NH; Tue, 08 Aug 2023 11:23:08 +0000
Received: by outflank-mailman (input) for mailman id 579696;
 Tue, 08 Aug 2023 11:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCDA=DZ=citrix.com=prvs=577c1445c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTKnq-0003nd-I0
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 11:23:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef9221d1-35dd-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 13:23:03 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2023 07:22:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 11:22:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 11:22:56 +0000
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
X-Inumbo-ID: ef9221d1-35dd-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691493783;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r/iiAB3KxCPjuU9BKf58ZNB3v7HDrTyB/JucDDyIpZ8=;
  b=ZbytNufSk80t6+FpjKGxfT4VC6e5uSmbKBeqF0rCVwHAfb9Puxu/+RbX
   ktjMOiwxgeUBb+crLHYj9Y/EkmO9TX2vUwx5PTsUG+CkDbvv2NsBAgbdd
   SqOgJ4OqS8+RfGCNZ866KkYs/XMxkqzfKPkej3FLBTV01NmBedUHcwtVN
   Q=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 119271607
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XtZTz6rM9b524wHllfkfLOiaT+leBmJOZRIvgKrLsJaIsI4StFCzt
 garIBnUaPnYYzbyfo90a43k9xkBvJHQzNJhSQtv+yFmQSwV9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOzylNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABwMaBu4of2I/IiEb7dMnZsBdsDXIKpK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr68w3wTNnjN75Bs+Z1GFkN2Fm2GESssEc
 24p6xEPsbgN6xn+JjX6d1jiyJKehTYeUtxcCfwn6ymCz6PV50CSAW1sZjxLZcEitcQ2bSc3z
 VLPlNTsbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJSMa5/HzrYd1iQjAJv5hDaq0g9vdCTz2h
 TeQo0AWhboJitUQ/76m5l2BiDWpzrDMRxQw7x/aXUqk6B14f4+vY4G06Vnd4u1EJYzfRV6E1
 FAIg9Ob7fwOJZiVmTaRXf4WG7W0+/eCNiaaillqd7Eq9y6s4GKkZYBd+ndhYkxtO9wHUTDsa
 U7X/whW4fd7LHasKKN6fY+1I8Ar1rT7U8ToUOjOadhDaYQ3cxWIlByCfmaV1mHp1UIqzqc2P
 M7Ddd72VC5LT6N60DCxWuERl6cxwTwzzn/SQpa9yAm71b2ZZzieTrJt3EayU93VJZis+G39m
 +uz/ePTo/mDeIUSuhXqzLM=
IronPort-HdrOrdr: A9a23:bC9r26A3BYNRmo/lHeixsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ4OxoS5PwJk80kqQFnLX5XI3SJjUO3VHFEGgM1/qA/9SNIVyaygcZ79
 YaT0EcMqyPMbEZt6bHCWCDer5PoeVvsprY/ds2p00dMj2CAJsQizuRZDzrdHGeCDM2Z6bQQ/
 Gnl7Z6TnebCDwqhoPRPAh2Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6e071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6u9XaoxV/Y5eDpTjMzDMRMwapfbxvi8kIl+PVxyr
 hC0W61v4deSUqoplW22/H4EzVR0makq3srluAey1RZTIslcbdU6agS5llcHpssFD/zrKonDO
 5tJsfB4+s+SyLQU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2Et0ykMJrfZv6UsoxdYYcd1p9u
 7EOqNnmPVlVckNd59wA+8HXI+eFnHNaQikChPTHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8JfV70A8Hm5uwLzvn0ehT+Yd3R8LAa23Ag0YeMAIYDcBfzBmzGqvHQ4Mn2WabgKr
 GO0JE/OY6WEYKhI/cO4+TEYeggFZAvarxlhj8FYSP/nivqEPydigWJSoebGJPdVRAZZ0jYPl
 wvGBDOGeQo1DHfZpa/ummfZ0/Q
X-Talos-CUID: 9a23:9Si14mxTE9fZU5B1rG6kBgU4G8YuSVvC8kvqHGrmKX02auecdUO5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AJCXBDw0DQFESl54fL1QlzGoiKjUj0a6QOWQxgLo?=
 =?us-ascii?q?8qtDfbQ5NKgy8kCSIXdpy?=
X-IronPort-AV: E=Sophos;i="6.01,156,1684814400"; 
   d="scan'208";a="119271607"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjLNGFstjlmeInOCMJDTuXpVW0x+wP1zgJ77E501Gv3AEa7bx6Xlyfq0ovfoV2M+S2hP7kVGXhhSQ0ee1jXljntw7sg+yItzReNU0UX4iGMcVSpeL8a2fvsYqvrSh6mU0YrUoKUarLDXxcoZDfTd8AQB4NykW4p/lJ/9HDDF8wuxbHI+n1BQHFO+z1LTdqiXtCCfl+Nr1su7nKwpDT2SK9HmbNyd4Uggz32X82g8r/iZk0KjwCQpIZdKrifDqmqAzNo5viyVCJ1TMarfIceCreqcs75qITprcME8ybXaUWPew/xj3vL2qDMN/hjAmJPdei4BdQ4CM8YbxJickzPZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ri+ATDYnV0KthEWTlZPa/ReZoN6eTbSdoj9jjZdprA=;
 b=gdFupiA3O3OYZCXmEgX49+oe6wIlPb9BUjn/DjfSn3UWGat+2e2MCHGC7PNdaZIXOEhbRDbbuRUJfn0jp1a+Dz7G5nn3i542s3iP4si8WWQUvBECh087pJvq+9+MWfsFJLImVlRK+GozfAbT01kFmxRW/1XqkbUM6d7cx+79msPfLVy3NUmYHkl6a+wyOUmGdZ1CqXZ34X4hBFP5q86iFolSWXh8QnjpYNV4AvbmEO07IHPNRT0xXEHSLgpUCww0/mvN/lEyIRcTfdcjWEHM9aLii+2WRcpRv7Urrdde5p42YEVirmaJIcjo7MSre6g9Kq3LKnhRjqtUanaM5Ym/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ri+ATDYnV0KthEWTlZPa/ReZoN6eTbSdoj9jjZdprA=;
 b=Tq21p9sIAXwK46TmUNcurvd75LZCcxJhlDDQKsS4D6qrFQO9tqf7fumx/CYqwG925/Eqss+ZKfsDr/GyP3+W0Qey3oR1UXcskE0ADEWJWPz+80SHTOq5cr56k8dtSFHw/Wy6Or6XNlaO4YLk8e73uDfqbEYagLHroS8lwQH4720=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <72435ef3-821b-9feb-16f5-d3304776b44b@citrix.com>
Date: Tue, 8 Aug 2023 12:22:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] subdom: Fix -Werror=address failure in tmp_emulator
Content-Language: en-GB
To: Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
 <f066a57c-3dcf-12f3-26b2-5f61f8fcaffe@suse.com>
 <722dfba8-a768-55c1-29bb-2d8525282b4b@citrix.com>
 <464d71e4-9047-0461-afdc-8df8b8f569fb@suse.com>
 <CAKf6xpuU4EONPZnDR-H40DxxvWq3AWPX2_N32Zm65qbuTPuVsA@mail.gmail.com>
In-Reply-To: <CAKf6xpuU4EONPZnDR-H40DxxvWq3AWPX2_N32Zm65qbuTPuVsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e2169b-498b-4384-6a14-08db9801d099
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q8he3byNi8UuB+ZwmzGcIYkLUxtV0/i9N7+MZRWjbAxErcOTxmoGzTjSDXy7AIrEbl5ch76/JsHOl5N4ZmidQ0b7pMjPw7VxgzUvYnpdN6AW33S5h9670HxjJIDbAcTuVq4iqAVObTygI+AT/poaQLwBWa5iujhk0cSEqjScsyDJymSPDsovbc51MWPBQUY6iWcPg1ncoJaYkfPhoXgls3HZcE9XbaiZ3SeTTX6jZ378K5Y8bLJA/y2f8gCpeQqglZrhUW73XGN4PmkkTTmWtKV/NPCgDtc8RIlmPYSZWp/0VmldfkXw+7nu2J81uFmowMHLulP4ey6w4BMGLMHGbyANSmhGv5H6uOUiUjOlrnOih/QlYQ3RC8xfjkvmUULi75fSnIXqXrXqA2Bm5Fh0VhpOojXwmWglYWuztyub9f6XWEIuDvXrmDiPmqog0zg9kfnWU4APKv4dY0TeKzCG5ylHsTkfm6SrG1pbunw0dJ9Xb15PBcxggSwB8DHlR75hlgPa4aAZibA/zQ9oZJmzZUfEl8Lk7XLlIjnKVzZYezOlCxzm2M3gOh5TPlVvjTsMHGV0CzrqdIrvakR6DeFGJVIOOuZCIDwF9+8zYc6+iDHzCF2DB3b/Wpk1zms01smgFocfG1dnUpH9zNHpVn/a/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(1800799003)(451199021)(186006)(31686004)(316002)(83380400001)(2616005)(2906002)(82960400001)(36756003)(53546011)(8936002)(26005)(8676002)(38100700002)(5660300002)(6666004)(6486002)(7416002)(66556008)(41300700001)(66476007)(4326008)(66946007)(6506007)(478600001)(54906003)(110136005)(86362001)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWNYbFVRWnI3TU9VMDBxczZJdG9pcStwRXJCVGVRYXVyajVwNEVDcWZpUEFj?=
 =?utf-8?B?eHJmQ3NobmRJYjh1dm9GOGNPQVBhSjljNDFiVGxCUm9oV3MzOWFXdDR3VUhW?=
 =?utf-8?B?aVREYk5nT09tT1gvVVI3MW9Wbytla1hFaUpwaElIRzNDM3hOWm9zSk9HbDh4?=
 =?utf-8?B?azlvOUtqcjlZOVVCZGIxYUpZeVJ4ak1NU3B3cW40dmZZdVhkUVNTdzJOenZH?=
 =?utf-8?B?NHNmZlVPK2JmajkxaDZDUWtvYkdTSHlNaTlhdk0wYW8vT2JUZUp2VHpmTzIz?=
 =?utf-8?B?L0F3WVBHUDN6eUh2TEQxcnJCQ0VUK0FXWFBPTEhoSitiamlrS2hCVkxTUHE3?=
 =?utf-8?B?S0x3WHBnSW12OFJiL1NHbmdndSswRjJVOE1ndWhxcEszZWR4YzY4bkdESkpW?=
 =?utf-8?B?MWRNUHIrRGhIWlJXUm53Mzhabk5NazdDY1BZWlRkOUVPZDNrLzUvTFFmdkdj?=
 =?utf-8?B?dFVkMzAwWWI2NnpqTUhwbnF0T0t1dG9VT1RZOHIybU5kQW1IS1BHWkNQamVT?=
 =?utf-8?B?bW1HMm5pbzVIYXVISDgyb3oxZE91V2toZVcxZVJKQWJtdGFjUjNJRUF2cjNE?=
 =?utf-8?B?L1pwWnBWZWVCemhZNVdWdUdpY1dqVWhjL0NpK3hPZytoSHE4amQzL0RyWWx5?=
 =?utf-8?B?SUNJQmNXQW9JaDMvMmx2OG1NeEVaODQxZnZJQTQ4Qk03cWVabFV3MitBZG5a?=
 =?utf-8?B?ZUlMSHBBY0lwY2VCZFFkUTNrTHN4SzdiU21GWkpudkg5NDRnN3gvUG5uMzg2?=
 =?utf-8?B?RzFMdWNFZTlsR0xITERlaHBFcXNxalVZcU1hTFk4MHh1T1hyaS9lbXRaVGtE?=
 =?utf-8?B?eVN4N283N25rUm9VR0o2RmF0Y0RLdnRBTGQrdDZZS09uRDJWNk9XYWpWVU9R?=
 =?utf-8?B?MTg3NmJPeEVnU0VoMFFKVXBLMHp0bEk1TzZOcTViNzFINVF4bHpBajc1M1g1?=
 =?utf-8?B?OVVvVmVodUJnWTFkWXcxOU5qVGkrS2dZWGtlWk1oWldBSURxeWRDU2hTbzV1?=
 =?utf-8?B?S2NkTTNzWlRQdjB2RnFYTllDVDk0aEtZanhxUjQ0NEZKWVphT3c4bWxxRE9U?=
 =?utf-8?B?MFI0aEFmcDRDRjBFWkFpaDhGSERqZGJndE96emdOb1RlL0haZGxEd2lhUGVz?=
 =?utf-8?B?aDRHOUZDbitwU3RSTEc1ekFlek90eHIxRXBDbG5sNUp4anhmaVpRS2htQVJz?=
 =?utf-8?B?eTAwSE5YazFoMCtVVldXK2crR1NzWU9VYTJaRGRIYmdYbmloa0ZQZktBcTNv?=
 =?utf-8?B?akdkL01Ba0R0T2pZRkp1SHJuWG5PakJpT1Z3cUMyZ1haemYxVThHNlljcWlM?=
 =?utf-8?B?OUJaRENQcnA5UVdnTFpvaVlaMlNXYmlyTGw3Qlh4MU1XWFRJL1M1bnZEZ1px?=
 =?utf-8?B?T3hsYkplNVY1c3NkaUNtOG5aeTVPdm5Jc0NsbThCYWlMeFpPRjIzQ201WWFK?=
 =?utf-8?B?UlNuSGRsNmMyWXkwNFBXcnNRc1ZrRWs2NlZRTUx1T25OMGdNSTdKVW14Umdx?=
 =?utf-8?B?ZEFId1c1MS9yS0pERVNyMXdrem0yYTRQN2tYK0hKclczUnpnNmtJRUZIUDVz?=
 =?utf-8?B?amQ3S0c4NXp3UkZhMC9HNU5qK1J2ckFxYlZxbUFpNEp5cFZNcW9RWnpjTVdn?=
 =?utf-8?B?bVNTd2lsYjlWcnlVV2REOExZaTMrRFdEdHc4M3g4SThKejloeE9XUi9XNlox?=
 =?utf-8?B?WGlPWlV1SHpLZFVDZ0ExNHB4T3BZVy8wRzBiZXZCZjFGaUZVNE1HL1lYN01Z?=
 =?utf-8?B?aFBiRUNsWFVmRzNUdGRxNVBxZEQ4aTM2MEJTdk5KQWc0cWQwQzI3L2tBajhB?=
 =?utf-8?B?VGNyQlZNT1psa05DcVZHQXNSaFEvMGYyd09yRlZDTlNHODU3TElUUTNVdW10?=
 =?utf-8?B?dExoTkJCaDFWVFVxQ2lyOWZveVJlL2pVOXBnd0FHMjhNNHFCQjVwNG8xTldO?=
 =?utf-8?B?WEk1b055YncxV0NlaHR2ZmloYkxRVThicjlsRjF6eHVGRXFQRW4rSGVIcjRv?=
 =?utf-8?B?NnpVVmt0c0dxaHp0MzBhdkFxbVc0ZnpPSDBDdUdIME9qaTV0ZzU5MTdMblFD?=
 =?utf-8?B?RDVmdHZsWUkzODhkWHh6MHBVTFljdjZoVmpGbkcwUWxkbG5oK1Q3cThjbFdm?=
 =?utf-8?B?U1E4RVI5cEFjV2NyakgxZTU3am9YYmFZWDVuRVk2enhIcW1Wb0pxMHhXV3Nw?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?a21lZzFXZUVzNWgwbmdkbUZ1WUM4RjF2U3FtdjJ3R0Y5TDFsYWVqaDY5Z1hz?=
 =?utf-8?B?cG5wQm5jTnBFVzZXc0hPR0JvVmkyZ1FHQ3gwTTY2NVlRTlV0elRlUmFUdnMy?=
 =?utf-8?B?RktIZFNHTS9hQktFdHQ2Nm5oZjVETmp5UXZOeC9haXBWVjY0OS8wWFkyeFVo?=
 =?utf-8?B?L0lUcWt0TVM4Z0c1UVpkNERwcHVxcUxuNzdjZFc1RGg0WVJrSnI4aGxtUkkw?=
 =?utf-8?B?N0JnRnZvU0RBdy85UEdLZExvSVljRGl4Z1hpL25OcGtyZU44Rk14U1ZkTjA3?=
 =?utf-8?B?ZEdaMVpPc2U5SXMxcDBSZ0h0YTN6dWdkUVJEOGtWNStMN0NCVVBsZ3F3S1Rr?=
 =?utf-8?B?RDlkTFIxbWlvN2NOMGJxUU5MMDlmeXdNNjFYZDhkVUFqckQ0NWVtaTlBQmdQ?=
 =?utf-8?B?Um1YOVVUKy9KQ1AxYmV5TldlUlRRNXZzc2JUUWFYb0MzVVVqVXY0QWorZ0xT?=
 =?utf-8?B?UTVGVkl3azRZVGlxYjQ3NVJ6YkxyMXA0SkRyYjZ2bGhPU0VUTzZxZnB5OVZ5?=
 =?utf-8?B?VkhrZWV3cEJtYjNkaEc0UnR2Q0VzMVZ0TVdmYjFrT3pUZy8xTjdQM09UQVVL?=
 =?utf-8?B?Y1JJbU55WnZnWnE0UWtaN3k3TzRFMHk1OFpVQ2hsWnkxaHh2a0ppcWdLZllO?=
 =?utf-8?B?NmtRL0lBSGlnYTEvQ0pJSGlLUlk2VjQzQjgyTHdDM211VnZHUEQrUlV3NytM?=
 =?utf-8?B?Tm9oSkJqdFlSY2llYzNudzQ5b2s2SHFWbzhqL29IM25uWjhBb2VnQXh3cUd0?=
 =?utf-8?B?MVQrWHVqYzBwV25XSFJFeUp5TkJzTXBTNlJPc2JGbmRwK2tsdWtoMkhLYlZn?=
 =?utf-8?B?bkFxdGU5MDJBZ0NuY2NhWjdOZCtKZWZXeVFpQ3N4YUVTcE5peThHYm9NVTVv?=
 =?utf-8?B?Z0ZwMGpFa2RRMUZxcnlGMWhaVFlOcjM3c0dERFFGK1VMcnc1RndKREczNjBn?=
 =?utf-8?B?Qy9PTS9JL242N3F5dVYwQ1VFOFhtbjZZeW1mTnhpRm44MnNMem9NczE2ejNO?=
 =?utf-8?B?Y1FEbGJRbTlWdFp5S0xPcHFCR0FrSm9BcUhqZ3NNZXp5OUEyN1lybGxSTUZZ?=
 =?utf-8?B?dkNGYzFoc29ncVdRWFExcm1TQXhIU0htdlVsRVNpeE5MVUxCVkZ4SDhtM3ZS?=
 =?utf-8?B?ZFBnY0phVFh6Q00rQ3ZJeUN3L2hWRFlRTGtxWC9PaElvV0JaUkFQNk5kSGk2?=
 =?utf-8?B?cy9rcFF4RDhJd3dSUDRtSU9wTjk4cFVBLzgwbTBXVFB3MjNxSmRncnhZQ3Iy?=
 =?utf-8?B?OXd2S1RSMzFRclVDN1JqZ2c4QjJVaVNVc21qZnpjU1ZDRWM0OFA5azVzNnJi?=
 =?utf-8?Q?cGgOKGMcqFssBziHa1Q04QSXKjAWVe+JdD?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e2169b-498b-4384-6a14-08db9801d099
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 11:22:56.7869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6QxbzR+1s9CtqPzUkqzeVRRRv3bRQZKYmx+6OKnUb0uYQcicLRsGQriJzH5MXoYgf3tI/SXzjpMAPbbH0tTGmMJH5FAMconDhwRItiCGks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261

On 07/08/2023 7:56 pm, Jason Andryuk wrote:
> On Fri, Aug 4, 2023 at 7:36 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 04.08.2023 11:29, Andrew Cooper wrote:
>>> On 04/08/2023 8:23 am, Jan Beulich wrote:
>>>> On 03.08.2023 22:36, Andrew Cooper wrote:
>>>>> The opensuse-tumbleweed build jobs currently fail with:
>>>>>
>>>>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c: In function 'rsa_private':
>>>>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7: error: the comparison will always evaluate as 'true' for the address of 'p' will never be NULL [-Werror=address]
>>>>>      56 |   if (!key->p || !key->q || !key->u) {
>>>>>         |       ^
>>>>>   In file included from /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:
>>>>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12: note: 'p' declared here
>>>>>      28 |   tpm_bn_t p;
>>>>>         |            ^
>>>>>
>>>>> This is because all tpm_bn_t's are 1-element arrays (of either a GMP or
>>>>> OpenSSL BIGNUM flavour).  The author was probably meaning to do value checks,
>>>>> but that's not what the code does.
>>>> Looking at the code, I'm not sure about this. There could as well have been
>>>> the intention to allow pointers there, then permitting them to be left at
>>>> NULL. Who knows where that code came from originally.
> The logic looks to be that if p, q, or u are not present, then perform
> a regular modular exponentiation.  If they are available, then perform
> an optimized Chinese Remainder Theorem exponentiation.
>
> In that light, it's written as if pointers were expected.  However,
> the code history doesn't show pointers for p/q/u.  An RSA key can't
> have 0 for p/q/u, so value checks don't make sense.  Hmmm, I suppose a
> 0 value could make sense to indicate uninitialization.
>
> tpm_rsa_import_key() and tpm_rsa_generate_key() set p, q, & u.
> tpm_rsa_copy_key() copies those over.  So it should be okay to use
> this patch to just always use the CRT path.  It would be safer to
> check for 0 though, I suppose.

Ok, I'll adjust the commit message.

>>> Do you agree that the patch is no function change, or are you saying
>>> that you think I got some of my analysis wrong?
>> Oh, I'm sorry for the potentially ambiguous reply: I agree there's no functional
>> change. I'm merely not sure about your guessing of value checks being meant.
> Agreed - no functional change.
>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks.  I'll put it in like this to fix CI, then do ...

>
> Disabling vtpm is also reasonable given the reasons Andrew outlined.

... this separately.

~Andrew


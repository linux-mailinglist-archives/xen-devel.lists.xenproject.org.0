Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394234BA568
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 17:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274896.470524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjKY-0001dC-Qm; Thu, 17 Feb 2022 16:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274896.470524; Thu, 17 Feb 2022 16:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjKY-0001aS-NO; Thu, 17 Feb 2022 16:08:30 +0000
Received: by outflank-mailman (input) for mailman id 274896;
 Thu, 17 Feb 2022 16:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMIn=TA=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nKjKX-0001aM-PZ
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 16:08:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7387440-900b-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 17:08:28 +0100 (CET)
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
X-Inumbo-ID: d7387440-900b-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645114108;
  h=from:to:subject:date:message-id:mime-version;
  bh=RmBp639xehp6cT+ykyShG7v72VHO8G5flXGbV46chEs=;
  b=F/Ph9FfoBj4rjkqdBVedRyFN5dazHvu7ixxX3inNrBFM7AiSxX12VpPD
   Hqf/oSExRHIrNADx+W0YU+i0DcTy/8spzG7d8VsdbWStusq5iM7CTRABW
   1CHQAlyYD2Jp1Qnh/INShQQASe2lfCcNg2DTZiCH2Anhr/pqDj1qh4RAy
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I108lmZPzsbjd9zaIPWvS6hZS3WlFyKQbd5AwFYTo+khcnETuTAeLm4IsY/uNDaX8tX4WurdKn
 Pchee9tnWzsI4O972Zq1YtjgVbQqKNYTq7y5NubG3rJ5gGhhoIwiKTtBRDB3zRX4Cwl0NtHF3t
 WwpdpeAe3v9wAXPCSaskRjtMWxWVh8AJkowlC8MgDrsduAnz7x+Y25pI2WEor+SIYCmCIHI1hq
 JxFroFTAEM6uRG6s37fx2fgGDDgWxa4Nfwg7Y1LHyix4d8Lf/buFPM7kNK1fV+ROcNkLpCrEQy
 0YZrKN9CD7/rLLafEwpcUJAo
X-SBRS: 5.1
X-MesageID: 64343614
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NMC5/KlD+NMOScMfA8/ZK//o5gwqIURdPkR7XQ2eYbSJt16W5oA//
 9YtKSrfbaHbJie3LscnK96GQXl27ZaExodrTQVk+X02RnlA8MaaWY/Hfk2uMynCI5ydEExq5
 Z4UNdSecJloQHGHr0r1YrS+9nR2iP+CF7GsVOCYN0idKeMcpAIJ0HqPzMZl0t4AbaGFPj6wV
 fPOT+z3YQerhGQuPD5N4aiN9kM25qiu4GpCs1VkbKlG5A+FyyVEUJ5HKa+PdHapGYM88sxW5
 grgIBNV2kuDon/B3/v8yu6TnnXnxtc+BCDW4pZsc/HKbiNq+2pigs7XCNJGMR0N02/QwIgro
 DlwncfYpTkBb/WkdNs1C3G0IwkmVUGR0OaaSZQXmZX7I3zuKxMA8d03ZK0FFdRwFtJMKXNP7
 ZQlxAUlNXhvsQ4ULIWTEYGAjux7RCXi0Rh2VntIlVk1Bt5+KXzPrjmjCXa1E17ci+gXdcsya
 fb1ZhJwXSbaXw9zZGsUEagvjMKPnX7Sd21X/Qf9SaofuwA/zSR02bnpdtHUZsaLVYNemUPwS
 mDupjqjREtAbZrGlGTDoinEauznxEsXXKo9Gbqi+fMsrECVwmULIBYXSUG6sb+yjUvWt9d3d
 RBPpnFw9PRaGEqDEf/TU0PkplK4hxNfa51ITcoA8waq8/+Bi+qeLjddFWMQADA8j+cmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMS7B8
 Sq2vhRgu7YKt98b8oKg+n3D0z358/AlUTUJzgnQW2uk6CZwa4ike5Gk5DDn0BpQEGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHI3hCZn0v67tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JmCMf4fj2GZUZ1CIU3c+TLNDK+8gj1mOMUZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlBjOdwmX5imDiMGPgXKihLN5LEOxZ5rp9fbTOzgh0RtvvY8G05D
 f4EXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLRz9/LYa+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq70vf1AKcVmJuh8nAGhpNYtJ
 8Q4lwy7KqknYhzM+igHbIm7q4pndR+xghmJMTbjaz86F6OMjSSQkjM9VgewpiQIEAStss4y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg69lOdwIJDXC2iCei
 1ScDyAHqLSfuIQy6tTI2/yJ9t/7D+tkE0NGNGDH9rLqZzLC92+uzNYYAuaFdDzQTk3u/6Cma
 bkHxv3wKqRfzl1Lr5B9A/Bgyqdnv4njoLpTzwJFGnTXbgv0VuM8cyfehcQW7/9D3L5UvweyS
 3mjwNgCNOXbIt7hHX4QOBEhMraJ28YLl2SA9v8yOkj7unN6peLVTUVIMhCQoyVBN78pYpg9y
 OIstcNKuQyyjh0mboSPgixOrjneK3UBV+Mst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP1+ZG207PU3svDnycj+NSiKMHtA1O0FJfdU+CncDIh6Nv0RBcmdjtot+5EvmTPzpPB
 1VW
IronPort-HdrOrdr: A9a23:ttM0n6yT/EfMx9OX3SwQKrPxqOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBZpTnyAtj6fZq8z+8+3WB1B9mftWbdyQ2Vxe1ZnOjfKl7bamDDH4xmpN
 5dmsFFYbWaZzkbsS+T2nj+Lz9K+qjjzEncv5a4854bd3APV0gP1XYaNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5d7bSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu1DhPi7ontprcenau5t+7f+3+4sow/LX+0SVjbFaKvy/VfYO0aSSARgR4Z
 3xSlwbTr5OAjvqDxyISF3Wqk/dOX8VmgDf4E7djn35rcPjQjUmT8JHmIJCaxPcr1Etpddmzc
 twriukXwo+N2K9oM3R3am+a/hRrDvDnZPiq59hs1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgl/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M0OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaDKDgDKFC7a
 gpfGkoxFLaSniee/Fmhqc7jCwlaF/NLQjQ9g==
X-IronPort-AV: E=Sophos;i="5.88,376,1635220800"; 
   d="asc'?scan'208";a="64343614"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc0ioYK3xrB7CSJYH23AwSUpstL2Ym0NwSTPrZAwsgLkpq2j+yuyex4W4EWfQWzNZm/R42oNvneUeAu+gEUx5w7d7hnNdGEdhI7DhiUuuREVQ62MYgg7s2LuvQ/AAVqAoroEDgjWDbin8sVLze15ybFmCZI3TmTDut1t1K40pc/Qbv5AVAApTgu0aX0hfXzpuqz2rZ9HTho2K1OO/ejfUgpHZ4ct+IQUD5uLsG4Y5ymSdszG5UJhutTcZveIH4KOkObISBHocNYvOD7iZyRxLq6BaPfP4UC0SuFar8bAAEJhM+rujm6uNjx3Apb1aiNwEyS5NCUc7TN01VU51zro+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krkmKVsFDyASJVU/TyqNyjsSzSBZs/HUFZ7ywK5S1r4=;
 b=BeS31v2C3rjx8lymo4IW2d/+4dqpASlYddv6cSw8hQPTyEdh6l9hdSx0AU2yaswYHv1l1X3cRlmCgMokIXrTl0O1imetJK7cRP3pPjImggBpuIRWwzCAbQwXV6wdRZcNOFmsJiWUMTP/RKb9BZY2zDJ4z5Q4H7WLZeLorZGpR1ird2lFRMYcSEc9s3cndY1xqHmHj/RX8viF+g6XoXnhipb8xmTtcAcFZjDSNbb+cqFqBBiNZBl9GEWL0XXvsstqUSPwqcM22pC8B2e4G2lU3IsxNn3IAp/x30oflW5boR7l9Ep11gIY5xZIuRy+HbVlobvoyxTf8XHj1kf1RruU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krkmKVsFDyASJVU/TyqNyjsSzSBZs/HUFZ7ywK5S1r4=;
 b=eZcypNM37xJveMiIeZ2PGj7HVuzMqf1KFMahzmBxccycb9kNj4CTXgnNvDLAOnE7n6arZan6SLLJnCngmlUvG7UjYw3L17Qv26EFw8Ua+4w03y3lrtu8oG4gjPxjzT1p2HKCvmObPxENFsbevrWVFdeerkh4F2wwhqOouhjJcoI=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Outreachy, and the Outreach Program Projects wiki page
Thread-Topic: Outreachy, and the Outreach Program Projects wiki page
Thread-Index: AQHYJBiVHzNmzILnD0qqh0+WgY2BPw==
Date: Thu, 17 Feb 2022 16:08:22 +0000
Message-ID: <55020853-21B2-4153-BEF1-0FF5A3F04363@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45d8461c-3237-4def-0ede-08d9f22fb886
x-ms-traffictypediagnostic: BYAPR03MB3670:EE_
x-microsoft-antispam-prvs: <BYAPR03MB36702B213617B6BCA459DEA899369@BYAPR03MB3670.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N+CDCINEP50OWGqtvW8dZbPc7FNxMGdW6YLHKzVmNZjkapoRtMf2Wp2TU5PBYFeVPSJ6R/G3FGfIclorymPBrSf1quoxHvOhhbATkPF1mhZ9euVDLCTWtxw5Fs+uX9+CXpncJ65dH6WsRlctpQFlFymyv41beD0Yd1Yhs4Fpo2v3qRHHcNQ+WvxBM7bm4C21eEWnAZDYCmNUQG84T0ZrPWfyUJMIwPDDBw22WaBqWTUciSe3iRTYYDvB+xCcN2Y645FoaAUUkl7n8AcfSpXR02jrzJbC4l8s/6K+rRf4nQcjmH68ab/CZ4yBJLVmJlOoLteZIrsqQCSN89QUFB1vxUv6A9NCZD9KnU7pU9m38A68kqBT5zlHXJfkSkSgJJFAt0jYzNGJrOtA6diOWVg7HXbrSs1t78FPkO6EnRE+TuOarqXJCicFPuSrgMqKqIzlO+UVB19vvAZhLhoYjRptnVzEPxKKMcO9bA8KH2Kw0ta/QOUTwPqTi0QeUsEs/CroM8CVt1Gq9wQBKkiDvmMJAclqdTAayTRxnHITuEEzAw+lEEK51lKt1xHvVwEytukFyQho9kpHM3LsCUq1Sw5FEco0EtP59xDRheuATVQPbSgwNqdyZBGcjoeckX137D4p3X3z/iJ7EKcHGGqgJ8PEHU6bSjUtJyx1ZhxVx/FqoBT/fPG4Zh9YXOb5KxzVFqkNxP7iK9BSN3MInb+gphFiY0MnXRe3f6LlY6qyElUWz41RoARSEk27wGeuz0IKaoWHbaqb/YT4oRVohEFPHNfLL3fz0syXwcH4545cemQG3UAx/iGA+eLZ68+sPz6/gb7x6IJOGHMAVTTHFXuD7QBMWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(26005)(186003)(91956017)(76116006)(33656002)(6512007)(6506007)(508600001)(99936003)(122000001)(316002)(4744005)(36756003)(71200400001)(6486002)(966005)(8936002)(38070700005)(2906002)(82960400001)(83380400001)(66446008)(64756008)(86362001)(66946007)(8676002)(66476007)(66556008)(5660300002)(38100700002)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3VBeWpTRThjSHFzeHpaeVNLMDJhczdIOHlJMFVUNmFrelJRKzdZUVAyYmpt?=
 =?utf-8?B?T09vV282YWM1RU5wWFVLUDRKZG1ObkM0VG9VYVFCU0ZzZkFqNm5xL1hlMTQz?=
 =?utf-8?B?SW8yYWNIYTM5ZVVoUGwzRk1VTVNVTHhjbTVrdUwvR1hJR2pFWWRVdWloeFNt?=
 =?utf-8?B?aTZ3UCtUNElrRzFhU0dSVjdoMFBrZmxYOGgrcUx6ZXNKc2p6TWFteG5vV2F5?=
 =?utf-8?B?TmFNWTlHSCtiMmhWeFBKVHl0VENERk13ZnU1eWs4bDlGRkp2ZDV0cU1SU2VV?=
 =?utf-8?B?R0dhZDhXTEtuQ1IzZjJ6Nm5sanYyaHI4OHFRcUlZWTNUK2lOSnAwY3ZXMXN5?=
 =?utf-8?B?VWxzb055YzBjRFU0M1JKeWh3L1pZQnVwQk9aN1IvRldocmxJeFpEL2hLOUFE?=
 =?utf-8?B?dFlVaHhoZVdiV252Y0lBSllKM3hYTEk4allJVmcrNkxadW5obVRGTUwxbTc3?=
 =?utf-8?B?cnBlbW1OMVdxaDNuempjVmxEZ3BTbkxmNWNsZ2R0eG5XSDYwRmRhRWdienJU?=
 =?utf-8?B?RXByMFE0elZGeDdCSkZBWVhRY2tCeGxoazNKMEoySlErZm9ONGR0NTBueEha?=
 =?utf-8?B?cWVLMkNFYTZyRnhpMlFYZnFBUmRMN2J5eWh4Z2lHb1FUSEdqOGdhayt0L0t4?=
 =?utf-8?B?ZHM3NGhQVUNTNTUvRnVtOGE5NFVaaG0wYkkyRXdTVTAwQUZKbTBZUVZadFBK?=
 =?utf-8?B?dmJjaDZhWXlXUXhzZUhYVzVCeGxPN2l1ZlkyTEVzZEgxMXVTN2UzS3NmK1lP?=
 =?utf-8?B?L25makJrK0pia25OQkVsdkQ2djRVZFpGUmpvK09tVDNZNW1Bd1I1ODhFbW5Q?=
 =?utf-8?B?WXdORzkrK2hib2RsMXdSd1MySTlDR05MZ1YrbjVWdlVLb1V1SDlBUHdmYlgw?=
 =?utf-8?B?VXB4SWpCcFloWlRyVUdoUG1HMXdiT0xxNjhvTjBwOFlEZ21kZEdkUnl3UDRQ?=
 =?utf-8?B?a1hzU2haYU9XOGpHVWk4WHhtYlR4ZTUzNWFpblNRTVJBWTFJU3JSUFNaVWQx?=
 =?utf-8?B?THVvL2JiMVN2bmN3VmtxTUdSSGRpVzhsUzNQYXVlVzI1VHZuTmYwUmZaM2Fj?=
 =?utf-8?B?bmlFUmVQYWJEbWtvc1ZucVg4aFUxdVliYlRUNHdWSkJXeEZaOEJyUEs5Yk5l?=
 =?utf-8?B?c0ZicFQyWjVTUVJsVE9taklDQ1BkSSs1M1VDU2w3UGdPd1VaaG1TcCtmazNq?=
 =?utf-8?B?WjkzeXRzWWloMmZlLzhvME1iY0RIZzZLR1hlb1ludGJIc3gveUhpWjZxNnpO?=
 =?utf-8?B?VndCMnZ0dHZKR2NEMnJlc1lQMGt0UUpjSlVwSkFVV29valVPTTJodWt5YXBB?=
 =?utf-8?B?djNLdnJlVm15cENUSkNlandXc2krVXJpb2toTkF2L0k1SzlkdWZVS0hUVXdQ?=
 =?utf-8?B?L2Mxbzg0K2E5MzNkTUhXZkQrbWxGenJkN1dYUVEySWdEa3U0dVd0Q1BNc3JE?=
 =?utf-8?B?VGZrRmdrMzk2czJqZE1idTVVZytWaThJOVZ1VkR4YWxMUS91RDM5YkpraVJR?=
 =?utf-8?B?Ri94RzlIQkN6RWRWUVg4RUx5NnJPNVQwMnI0KzFvMlV5VU1NV2MzOUYrVDhj?=
 =?utf-8?B?NnZoS2c4UTIrWU52VlBPdjdLT2RGQVo4VFZ0TFVxWnNHR3FjM1dHMnovK2gy?=
 =?utf-8?B?cHRwTi9TY1kyUTJLNUZSeVpickRQbEttaWxiNGh3U3hFZ3FoUkJOWGlBTmZ4?=
 =?utf-8?B?Qk1MbWI0ODgwWnpzdG5QUGpnSVI5ZTUxT2lkK0pFcVQ4blM4eWVqUGhoelZD?=
 =?utf-8?B?Z1N2dk5JY2o4VHF5Q3BselJEREtnOXU3OU9jS3RMMEhIMWdvZzlUSkFsc2p4?=
 =?utf-8?B?bDJuWW9DK1FOQ01PNzFncy90SitlU0ZZOC9EWGc2akNoSWx1WTdJKzdzUTB4?=
 =?utf-8?B?RHFuTEptakVPWC9kOCs0UnRValpzQVVMY2E1bU43TjV5c3h0UWEyNWhrTFFB?=
 =?utf-8?B?VVJQdktFSzZWYTFJSTl0MjFYTGllYWUxNFdYVEI3eTB0WGpjRkYxL2ZFemlZ?=
 =?utf-8?B?L3dISGdFNEtrUHJlQXJJRDg3WDloN3E1U0U5dXk1bWZESnNCMlpqck9WUy9k?=
 =?utf-8?B?TzlZaGVOUys2Y2lvMDlVUytaYkZHbHMycTVSdnlVdmk1bHpRaWV6YzVFa0ZW?=
 =?utf-8?B?Myt0UVRFU2tXK3VNUVBEeHpJVDJHTHMrVDJJQmVaT0gxa2U1ZlhYazltY1ZQ?=
 =?utf-8?B?MmcyZC9xUFRuVFlaSWozNWJveEoyUzh3YnIrc0p2TzRFU0RodDE4RGhvVUZE?=
 =?utf-8?Q?rgNZHcKZKjPZiAZ4FB2aJRNKwlSiOBSlJr0aQmS/CY=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A61881FD-AACA-4EE0-8BDD-E134035BDD40";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d8461c-3237-4def-0ede-08d9f22fb886
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 16:08:22.2032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01ADzntffee0Ae4NlCYFf4yaQ546q0CLdnuHsF0KPC6pqPNvW6Am7vw+3AVEKFTmcWESv/+LzZ6PvQ8cr61AXCIadnLseMSvvnmLaS9qB1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3670
X-OriginatorOrg: citrix.com

--Apple-Mail=_A61881FD-AACA-4EE0-8BDD-E134035BDD40
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hey all,

Sorry this is a bit late; the deadline for organizations to sign up for =
the upcoming Outreachy round is 25 February; and the deadline for =
mentors to submit projects is 4 March.  It=E2=80=99s not 100% clear, but =
it looks like prospective mentors will need to individually submit their =
projects.

Additionally, our project list [1] is looking a bit thin.

[1] https://wiki.xenproject.org/wiki/Outreach_Program_Projects

I think for this session, I=E2=80=99ll only go through the work of =
applying to participate if there are people who individually step up to =
say they=E2=80=99ll submit their project to mentorship.  In any case, we =
definitely need more people to brainstorm projects for outreach =
programs.

Thanks,
 -George

--Apple-Mail=_A61881FD-AACA-4EE0-8BDD-E134035BDD40
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIOcu8ACgkQshXHp8eE
G+0RWQf+PAsp9wA052/4SO7ZI72N+1dQwW56RKkPd8q6zTTh927aKW+17x+pkv1L
rKJvvbGYxjDWMVwrqhKKDKx6u1jTOcNsVrE50BP4NsxlhRUE+FdFNjhPhC5mvdAD
gY7zCYGpsm+G3SsU1do3Z7GiMGu1CrTBZ4JDF57vz7gLz8e7xItt3QuLNfzCu0SG
yXbX2hMLwpssNx/Q9yeo16E2e46xmnlfilz55Ryh3+EfMDhME3iDCz5L2bBV1lit
xn5CtAYDd2C+lPc7U6lbnuysgDs9ywkfZ8wutUpe3ENHWV+q2xjg5/7v86k02mHH
irc2IqhwBQx0rRKsIh27lVrBSL3Hxw==
=WLjO
-----END PGP SIGNATURE-----

--Apple-Mail=_A61881FD-AACA-4EE0-8BDD-E134035BDD40--


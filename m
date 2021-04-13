Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB02935E0D5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109825.209701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdi-0006Mb-2F; Tue, 13 Apr 2021 14:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109825.209701; Tue, 13 Apr 2021 14:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdh-0006Lp-QG; Tue, 13 Apr 2021 14:03:37 +0000
Received: by outflank-mailman (input) for mailman id 109825;
 Tue, 13 Apr 2021 14:03:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJdg-0006KX-BV
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:36 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2658cdd3-a2f5-4515-ae80-ce5a6f63e98b;
 Tue, 13 Apr 2021 14:03:35 +0000 (UTC)
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
X-Inumbo-ID: 2658cdd3-a2f5-4515-ae80-ce5a6f63e98b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=SvFuPv+ayBPXc00cwLumU7gxLcmcG3dejOnRxECnnd8=;
  b=eELQFL8YO/zKB/kODPpXxzwoEtff2uTpzXZIEN6BSjnsiB4rlgKbjnIs
   DtNCRwXA1rE1luQV8Jfj6RG6F68phkpf6e+R8ZQjC/QEtTb7PdaEHruJJ
   aY3H0iqeE/i07Dv1CYUJhxZ5VWi9Fev2HKRXYxWpIltxK7I+KO1QNWvkz
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: D26REcR3/iU4c4pPJrBtRS3QJvmZQWYNmYmIAb2sHOES7gYATs6AznOgGsoutsYk4gQLcrGPSB
 AqbRuQMZaomyVYjywhOagrDEIsySkG4I+ZprMVbrfynCSuYUIXCo+u9a8L1NE0zOZbzIllPK8Z
 WI61Z5kNb7ZyGxpB8TaBOEiaDaoWL/IcCRV7g9HVcZs4dxxqL+RWh7EEIWkDiLD6FbwJicgB7g
 XFz0VGfnYu7rk7khPFBV/Izq5+gmBo8JaQOcv+x4KUSu4b4av0paKaSGad8m2FSuPGUaFzrbS6
 iYE=
X-SBRS: 5.2
X-MesageID: 41322379
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lYZCGaobPwu9yePZCT5QHF0aV5uuKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQb3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIJg/I
 9aWexFBNX0ZGIWse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsA0y5SIG+gYylLbSNBAoc0E4
 fZ29FOoCCudW9SQsOwAHQEWOarnay2qLvNZxkaCxk7rDSflD/A0s+GLzG0/Dc7FwlOz7Ar7H
 Tfn2XCiJmLnvmnxnbnpgnuxrtMnt+J8KogOOWtjYwvJizomkKUYu1aKsa/lRQUhM3q11owit
 nLpH4bTrROwlfcZHu8rxeo+ySI6kdW11bYxVWVgWTurKXCLVpQYaox5vMqTjLj50Utp9162q
 5QtljpzaZ/Nh/cgD/7o+HBShACrDvEnVMZjeURg3ZDOLFuD4N5kIp3xjIxLL4wWAj+6IwhDd
 B0CtDd6Pt8YTqhHg7kl1gq79q2UnspGBCaBmAEp8yOyjBT2Et01k0C2aUk7zs93aN4b6MBy/
 XPM6xumr0LZsgKbZhlDONEZcesEGTCTT/FLWr6GyWpKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPHE6S1rd122yGIZF/4cSXmy8lY6ZQ8kKb7XqDXPSqKT01ru9e8os8YHtbQV5
 +ISdNrKs6mCVGrNZdC3gX4VZUXA2IZStcpttEyXE/LjdnMLqHsq+zHYNfeLLfgCl8fKyHCK0
 pGeAK2CNRL70itVHO9qgPWQWnRdkv2+o81MKWyxZlX9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oeypWy8+3f0/3xkUyAtSnp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1tZQ97JFh
 Vc43B647i+IZDV5S1KMaPoDkuqy18o4F6aRZYVnaOOoe3/fIkjM5ogUKttUSPRFxJ0ng5ugH
 xZaBANQ3LeEj+Gs9TnsLUkQMXkM/VsigaiJsBZ7VjFs1+HmM0pTnwHGwK1XdWvmgYoTTpMjl
 hX+6sS6YDw3gqHGC8auqAVIVdMYGOYDPZjAB6ebItZoLztZTp9VHyHnzCclhE1dFf77kl6vB
 2TEQSkPdXwRnZNsHFR1ajntGl5cWiQZGpcQHF3u48VLxWMhl9DlcuwIoaj2WqYbVUPhtwHOD
 beeD0IP0dF3NasziOYnz6ECFQrzpgjJfbmEbwmar3fs0ndbrGgpOUjJbt57ZxlPNfhvqs3Su
 qZYRaSNy69JOUz2QCZz0xVThVcmT0Bq7fP1xLk5mTjgyJ6LvrWPVh8R7YUZ/ub9HPpQv6U0J
 N/yfI51NHARlnZW5qj8+XwaTUGFzb45UiRZMssoYpPva0zuKBodqOrGQfg5TVi5lEGMMzwlE
 kiW6x177DKB593c6UpCldk12tssO7KEVAivQP3CNIvZF0Bj3fUONWS/rrDwIBfdXGplU/VMV
 mb/zY1xYa8YwKzkZobAbk3O2JYdQwV72lj5vqLc+TreU+XXtAG2FqxKXmmdrBBDICDBLULtx
 5/p/WFhfWeeSa9+Afeu1JAU+9z2lfiZcO5GwSXH+FUt/S8JFSXm6OvpPeJsw2fc0rzV20owa
 tfdUIRacxfij4tyK0PuxLCNZDfkwYCiFtR4TZui1j3/JOpiV2rRH17DQ==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41322379"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aR8cZTscSsAQVIPiB/sMjmQCwS3wI2SJjQyWIS6OyzvOtsvO3KW9mj903n7dQIPLRmVGJh8pkyQPz8oXuFAjasI0O/fu/Sg19jXrJjD7SqrhK47hjfYGuxy0699P4bisbCo94rcL/h1zkvo8XBXzlVb6c7PCO5GMlI8zNqzmr00hmvhGVUOKnhG5treZKvxeJO0ETN2IZdAr4xzGPWIeo5DWEVXwVzCSmWUsIHy2EDqrx83RPRYcZZ/zEG9fOnT+d0BVGHudDsi2KP3b/MpZOLN6UqmSnyUDToCkhvXPHyxC2qXrXTMe3e156naDeJUGBfYtekSe9HRLqFjr5KBlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ke3HLuqORzOFlUKMPs/d/zUjkzAyI5FfHtUyvohI96I=;
 b=U6y2YQ+WHjT3fKwWcLLKEvyYbEOjUsbBzDDz3C8qH/oLX+rN8AaeJZHoxByBqnacsNFAsVqhI37QhmD9A0UnJ4moSyCYBjuyRcj4tn58wc7OasqTtmSbx+ZksbIM66n80y83GgW2/GbU+b4snxEqunN6uVC0UvGadReLiuL9WtQlb8F/P5RDoxJgoVJPVg9Mg2BpHmBbOHQTo/O8cor4Zev68YephgANveVViNaHxed69dTGK5RHFBjvf47rgsJzkpTuEJmwiSFy2TIDNu6VFW7C9R8bYJsyU/TIGOuF3iaF2/f3aTWxNhqAXuEhsYdDk3QE/+WBqrRVgFOqJ+rvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ke3HLuqORzOFlUKMPs/d/zUjkzAyI5FfHtUyvohI96I=;
 b=GpYuKG/rdsVEI9/Wx71EDXV49WnbYWONniy0wvG2eOpVQWFS2f+rUNfcoz+V0+KFcqRF1aIvRswmFBKFeA5MbOvcIrJpPye+PP2xOhYkJyIhPC4QG033WvGPvg16RHYOvueA6pMrx9ci8gDLMLPGA6oHhWPsnC20EXONVOrw/Dg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 17/21] libs/guest: introduce helper set cpu topology in cpu policy
Date: Tue, 13 Apr 2021 16:01:35 +0200
Message-ID: <20210413140140.73690-18-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d39fafd-e6f1-409b-7c42-08d8fe84eb90
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2969662B3585DF91A60639C18F4F9@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVfyxhuEeeB1mL0HxJycAj3tyHOTCi85pXBevdaddypQCDwZt21xEzEt18HBF6+6Ii5twBFOMFMlvKvgE2ZSxbUwaCCtWDcVDG28T4XSM+bb1JMKRE8ll95IcgatU3gL/LxUJqtEJOZQPpnCeR9sbWhpA8+2NiYoNFjMYxUJf+7JVMUo3/HZW+6khVOBIRsu0SycAcod2e0ze+VGpTm5ZUA5RX32U8yltuCtrD1Cm6F8o2ZJZKhiy5IkHOJE7fC/hBiDC7/L230v17h9yz5ky9Tr3CJcDsnEXWAI91GpRT5lSJCg9iwMKu2ta6QHKuk06wcuvb2K4EdI8PO4sjhCfSkg6Odkrk1QF5u+z5fiyYP32OmsTQF5ZvKaNNj8VniMGu/8fhcfUL89LtVIRPrwncRDkvu8kWsjkFw5j7ZAAjGjg1f17h5DGiurG132SxLzDRfHJVrPMb8naZlKrLz3gUMdKpPBhl4uz5FiCALDuxF9/GavZ/nIc5lrhWUcACNmxCwE0bqCTrJgGXuwlWLvDqtdgnHdFt1dBnBqxXWWXTB4MwAnJQBxSIO3ALbHpTGgOtgkGI0+9w5s5fLQz3NI2CxCso3vkFLzbF/oSD92Jr0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(83380400001)(186003)(6496006)(316002)(2906002)(4326008)(36756003)(54906003)(6916009)(2616005)(16526019)(26005)(478600001)(6486002)(1076003)(8676002)(8936002)(5660300002)(66556008)(66946007)(86362001)(66476007)(38100700002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3Jxd1hQK2xDbUorRG1RSklkcCsyL0VEWmM5MERUYTgwaEV3RW9yL3pPTEU2?=
 =?utf-8?B?V2xJait4dlBWUVlwYUtzS1VFRXpFR1pFYUNkT0JUdlNXQkkrMDhEK2lIbThT?=
 =?utf-8?B?VGZhVjhkbHZjYm0rNVl4d05YbG5DKzBwZWV6RzdUZTJuT2J6bW5xMGVZMXEz?=
 =?utf-8?B?cHUwL0pLRzM4anJQd0h2cDNzY1VEQmUrRndWb3JBMjYvdkc3OU92NUszSGU2?=
 =?utf-8?B?Rk41UGtLdThGbUJZUnVQcTAvcy9RZEtwYTRQbFNocWlNdzA1djk0YTJzWllw?=
 =?utf-8?B?S0lPSVN1amh0dG9ZYlVISmhvL3VsbHdJRXYxUUR5djJrUTMyWDBBeXozNDRq?=
 =?utf-8?B?Y2g2VExOL2hNUEpEOUhkTnNTOFFrU2NORGFtR3NzSithL05naldQdW9HNWty?=
 =?utf-8?B?S2hNeVZvQ2lDVjNtdkZiS3krV2ZRY0dMT1dVcDVpK0ZRdUYxc0RzY0VBQ1lz?=
 =?utf-8?B?S1dlUEptMGNQZkJxK2pyeXMyN3NOcThYWC82TG8ybW5sc0R0V0oydXpRdHcw?=
 =?utf-8?B?ZFBCM1pRRlg5UjdMN0JaRGFuN0l1Y0Q4UFY0NlJqUHQzcGhVRGtScXlrMXlv?=
 =?utf-8?B?MHJhZFNwVTVmcDQxR200Z25GbGJoMFNNd2o5a2p4OWVJNHE1WitnZ1ZBRnFM?=
 =?utf-8?B?dDErVFNkanp6UjM5cHk1QTdMcGx4TWlQYUlGbXJhVWRldFlpb2loNGZ0TStQ?=
 =?utf-8?B?RjgwdzJSRVJkTURoSDhQeTZHem12UVhhQ3N2N1FsNkpzaWFvMHI4UC9HK3dx?=
 =?utf-8?B?b2RKYmc1MHZmV0NHMFd1anE4cEZ5c3VSQlRrL1RxM1FYRWtQb3JmMFpTMDVa?=
 =?utf-8?B?b3VNSG9VNlFJdVNOTUZGVXJYQVhoRHhwemNtbnlFZnVYb3ZQcURNRkJmbWt1?=
 =?utf-8?B?cW5vTWRRZGE5RHlBYkRqRW9INnNHcEFsTnAxekpNWG5TdUY0Qkw3alFtSkkr?=
 =?utf-8?B?b0dib1pWTjJZQkNSaUgwVHZIQVQ2TVI5KzFPOFpYZVJGdkV0MG9WV3g3ZXZi?=
 =?utf-8?B?bTl5RTJZeFVEVU1rLzV4ZVZjOEw5WU02bTV4RjM5NElMaXJCSEV4UVUxcncr?=
 =?utf-8?B?cmEvRmNlQ1JjdnBTVWpDaG5IU0R5N2p5eTdKYkZHdjAyV1lxL3EwdzBVMkVh?=
 =?utf-8?B?WmZUdlpubzNpekxiaWgxUFg3NW05U2p0OVdicmNwMkhjTG5TejhkclBDVzBr?=
 =?utf-8?B?QmFMNWZPZTFHZldKakdEb216NFJrOWUwV0FtZ3dvdktUSE9waE5ucjhXWDRa?=
 =?utf-8?B?KzVva0lLdjVoMUwrVkFkNnBaV3Vob3prTUxjUnJ4dTJ6SFFvM0pjdGtZbFUz?=
 =?utf-8?B?N2hrQWZvUDhrRmtHcHJJeUsvb0lRMmEvVTdudjd4cHNJRitrZ3E3bnZCWVRm?=
 =?utf-8?B?QmR6OW8xcTJNWXRwa1ExRmplWWYvYXpWdzFFWWVubmF2U2pZUWN0WDRjQ0R1?=
 =?utf-8?B?bEZYL2JaRGVjb1BDMkEzUm1zTEp3S2x1eVl5b0lMd3ZNTHJjRXk4b0ttU1Y0?=
 =?utf-8?B?eEttMnpsVXZqN2picGlzbjlvQWEvZTBDazR3T3U2M2xNakhOMDRqU0I2Um5Q?=
 =?utf-8?B?WVdwTXQxOUtCaVc4VU1uZENpOGJoZTViUVFZNHY3VlUrK2N0ZlB3V3JSM3pP?=
 =?utf-8?B?clpiOGNFUUpwMnorWDZ2MHBMWHFOcjhIVDNIWVFuVkd2UFEzYUJHb21CR04z?=
 =?utf-8?B?cWo4bjU0bmJKQ1RhcWx5eHNNWnpkem5RMUtMVlk2VW5MTy9zOVRnUHdETHlj?=
 =?utf-8?Q?iomVmlZokOvA7LAWiUQeKI/qEltKBcgR4ZKEux+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d39fafd-e6f1-409b-7c42-08d8fe84eb90
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:31.5547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYvGGoYpb5NRfQVkIoItik3NkEJdt9azkHYAC2GFH7BhXmt0dCfW0yPot7SGlg0Cbhd8w0W/ighPtN1AvxUb0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

This logic is pulled out from xc_cpuid_apply_policy and placed into a
separate helper. Note the legacy part of the introduced function, as
long term Xen will require a proper topology setter function capable
of expressing a more diverse set of topologies.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 - s/xc_cpu_policy_topology/xc_cpu_policy_legacy_topology/
---
 tools/include/xenctrl.h         |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 182 +++++++++++++++++---------------
 2 files changed, 103 insertions(+), 83 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 89a73fd6823..ec184bccd3f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2631,6 +2631,10 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
 int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
                                   bool hvm);
 
+/* Setup the legacy policy topology. */
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 6486ac4c673..83cd71148f7 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -443,13 +443,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 {
     int rc;
     xc_dominfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
+    unsigned int nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
     struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -472,22 +470,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          (p = calloc(1, sizeof(*p))) == NULL )
         goto out;
 
-    /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
-    if ( rc )
-    {
-        /* Tolerate "buffer too small", as we've got the bits we need. */
-        if ( errno == ENOBUFS )
-            rc = 0;
-        else
-        {
-            PERROR("Failed to obtain host featureset");
-            rc = -errno;
-            goto out;
-        }
-    }
-
     /* Get the domain's default policy. */
     nr_msrs = 0;
     rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
@@ -575,70 +557,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    if ( !di.hvm )
-    {
-        /*
-         * On hardware without CPUID Faulting, PV guests see real topology.
-         * As a consequence, they also need to see the host htt/cmp fields.
-         */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
-    }
-    else
-    {
-        /*
-         * Topology for HVM guests is entirely controlled by Xen.  For now, we
-         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
-         */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
-
-        /*
-         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
-         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
-         * overflow.
-         */
-        if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
-
-        switch ( p->x86_vendor )
-        {
-        case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
-            {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
-            }
-            break;
-
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-            /*
-             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
-             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
-             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
-             * - overflow,
-             * - going out of sync with leaf 1 EBX[23:16],
-             * - incrementing ApicIdCoreSize when it's zero (which changes the
-             *   meaning of bits 7:0).
-             *
-             * UPDATE: I addition to avoiding overflow, some
-             * proprietary operating systems have trouble with
-             * apic_id_size values greater than 7.  Limit the value to
-             * 7 for now.
-             */
-            if ( p->extd.nc < 0x7f )
-            {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size < 0x7 )
-                    p->extd.apic_id_size++;
-
-                p->extd.nc = (p->extd.nc << 1) | 1;
-            }
-            break;
-        }
-    }
+    policy.cpuid = *p;
+    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
+    if ( rc )
+        goto out;
+    *p = policy.cpuid;
 
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
@@ -1104,3 +1027,96 @@ int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
     xc_cpu_policy_destroy(host);
     return rc;
 }
+
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm)
+{
+    if ( !hvm )
+    {
+        xc_cpu_policy_t host;
+        int rc;
+
+        host = xc_cpu_policy_init();
+        if ( !host )
+        {
+            errno = ENOMEM;
+            return -1;
+        }
+
+        rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy");
+            xc_cpu_policy_destroy(host);
+            return rc;
+        }
+
+
+        /*
+         * On hardware without CPUID Faulting, PV guests see real topology.
+         * As a consequence, they also need to see the host htt/cmp fields.
+         */
+        policy->cpuid.basic.htt = host->cpuid.basic.htt;
+        policy->cpuid.extd.cmp_legacy = host->cpuid.extd.cmp_legacy;
+    }
+    else
+    {
+        unsigned int i;
+
+        /*
+         * Topology for HVM guests is entirely controlled by Xen.  For now, we
+         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
+         */
+        policy->cpuid.basic.htt = true;
+        policy->cpuid.extd.cmp_legacy = false;
+
+        /*
+         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
+         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
+         * overflow.
+         */
+        if ( !(policy->cpuid.basic.lppp & 0x80) )
+            policy->cpuid.basic.lppp *= 2;
+
+        switch ( policy->cpuid.x86_vendor )
+        {
+        case X86_VENDOR_INTEL:
+            for ( i = 0; (policy->cpuid.cache.subleaf[i].type &&
+                          i < ARRAY_SIZE(policy->cpuid.cache.raw)); ++i )
+            {
+                policy->cpuid.cache.subleaf[i].cores_per_package =
+                  (policy->cpuid.cache.subleaf[i].cores_per_package << 1) | 1;
+                policy->cpuid.cache.subleaf[i].threads_per_cache = 0;
+            }
+            break;
+
+        case X86_VENDOR_AMD:
+        case X86_VENDOR_HYGON:
+            /*
+             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
+             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
+             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
+             * - overflow,
+             * - going out of sync with leaf 1 EBX[23:16],
+             * - incrementing ApicIdCoreSize when it's zero (which changes the
+             *   meaning of bits 7:0).
+             *
+             * UPDATE: I addition to avoiding overflow, some
+             * proprietary operating systems have trouble with
+             * apic_id_size values greater than 7.  Limit the value to
+             * 7 for now.
+             */
+            if ( policy->cpuid.extd.nc < 0x7f )
+            {
+                if ( policy->cpuid.extd.apic_id_size != 0 &&
+                     policy->cpuid.extd.apic_id_size < 0x7 )
+                    policy->cpuid.extd.apic_id_size++;
+
+                policy->cpuid.extd.nc = (policy->cpuid.extd.nc << 1) | 1;
+            }
+            break;
+        }
+    }
+
+    return 0;
+}
-- 
2.30.1



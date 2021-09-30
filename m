Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065741DECB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 18:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200104.354509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVynq-0002rX-3h; Thu, 30 Sep 2021 16:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200104.354509; Thu, 30 Sep 2021 16:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVynp-0002pC-V1; Thu, 30 Sep 2021 16:20:57 +0000
Received: by outflank-mailman (input) for mailman id 200104;
 Thu, 30 Sep 2021 16:20:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Bos=OU=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVyno-0002p6-Qb
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 16:20:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e3e2316-4a53-4201-b5f5-638a3bf8789b;
 Thu, 30 Sep 2021 16:20:55 +0000 (UTC)
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
X-Inumbo-ID: 5e3e2316-4a53-4201-b5f5-638a3bf8789b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633018855;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/67HFbhx/Yu00e4CdcAnZrFPeyBkC4QhOFQgInI4wUU=;
  b=dlQwrE/ilQiCTAL+HJdmcrIFH+H4473K9pVoaJquEzJGkyj2Q6egONRv
   V8fWcusKHiGYAKpZHALmN5Pi4dwFtS8OTrxVWJR3IlKY2xWcNcns7iddp
   GK30huyfEgk3b+nyR4HPyV6Vl7z+brMp2MXmZxb7PFGD4otL+RWcmQxh+
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JJ28ox8VsgiJgeLfna5WGQ34U3GklxUlNAP2uLPw4cg2exC49Sy8cAARp5JltEenjTxSzTzU6B
 xqqGDGfn5LIa4A9sEadYGk/HXDFxN71T9qTTifet3sinPiSxc652LRovln4+kyGU9Ve35Nxna1
 u3d2TmFuP0MtZKDNH2WjT63AoGv/3tutdKzP+aIDfMQ5SOz5nHhUZExeAGhq1jXlrDK7GqIw/L
 QAgldSLBTEuznmZyFA69nf01xOSIMsrpnVI34WgrpuErOKxLfTAVhLb7JArOUrkvM7Cm/Gql2Z
 GwG+d3h2T4EcTJXiswA+7P9A
X-SBRS: 5.1
X-MesageID: 54455875
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eCs2uKuoo/rTSrfkoWNjiDSkK+fnVKNZMUV32f8akzHdYApBsoF/q
 tZmKT3VM6zfZzH8L9siPI+wpE4O7JWEzd9nHFRo+CkxFnkR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y52oDhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplu4eXSRYnYpP1w9tacSBgTjpUILR7weqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DO
 5ZENGowMXwsZTV+OQ9LIYofnNymn1/2NANRomnM+5Eetj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Hbuk9vlskRuLy3YaEhE+Wl6yoP3/gUm7M/pUI
 lYY/ScGpqEo+EumCNL6WnWFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYsQCVmaM0o6PEPHgNt9
 GaxwsjDGCVSiejAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+XeTJEPYgHnFIg6T//s5jHhMXSgm
 2nV8HhWa6A715Zj6kmtwbzQb9tATLDnSRQpriHeQ26o9A9wYIPNi2eAsgOAtacowGp0VDC8U
 Jk4dyq2sL1m4XKlznXlrAAx8FeBvK3t3Nr02wMHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSXxN/4rO9PhV5p7ksAM8OgJsNiPNbKihbArKWe6ENxGPxbMjwgBbmB2+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbZeVc5RDF9VaWBqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA9370s5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:xCym+aoZENoMoQCHeN11tisaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.85,336,1624334400"; 
   d="scan'208";a="54455875"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc1tTxLkB1Qa6/6OUfdJAV43JrLUbR3iPMcr+eS3zXxMYFJGrK6o/3EQATV+5iTSNLaS9mCBJPg8LB/yt9L8hZO0MPckjEOEd1W8mO4o02EEN2jnN8Pl5wKiEBErY/gIvFPSKkUh4nYXBK4iXk9U/5v7RFuhfikdWUyOLBRGx9m+jl9fXyeYh72IPIJvnoC9GAjnH8c8E6fGPjYV9vBKxcjwgQ9faXy31LpHLYQeyACI4nxeDrTW38Ypo+riZzboqr3bUlaACZ4dxPpX5YvNWLpGlKnXFiXM+62rLbcea9I8+Xmmcd9fnozvMQ8xHL61H9X1dbkIhpjnzJG9pFtwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CqOOlg3EQfoiMvUZHKxb4QSuuT+aojwlTuDKISbUfpw=;
 b=VGL4auWIPa1XfwbzqvE2QZVWgGrKZ/Vfze7MK8N6RSHuMLtT1yqLdFNPXdSlMevdrRb/yP0k/8o2eYBEmxlZFdOt+QBGzLSVhWcGpfgKcjyv3/K6zyniXd5yfPHOQUt5ruNjnSfUiQzgOn4A8bWJ+v8pysaEJMtYyHsPzC/kMYn8KXvbzZSYQIqAnuzO04OGyqnoTdsHT3KzbGd1YdFlnI+fRx0WHFeOGBYwdtxN0Q+GGh6bg+mUeAkwKHGlfdvNMc7TlpZYo0Ns8UeJxum6U1yGwFC9M1sLJjTHQiUgp5Ov/Sf0l8eHGhv59ogIwoiNFxIHMWPcbesQCwu0S7t5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqOOlg3EQfoiMvUZHKxb4QSuuT+aojwlTuDKISbUfpw=;
 b=mQWSeW1yCF6ITRwWeKh4Ra17F2oATg3XonGCZESy2Cf4SK6V04VZPKVPohk69GeGtFPHMQhkzmO7S1CnbQICgHTDN6MSZvMZlq95RfaxgyHJXPP4+FqL3frT4ftWZC+NDSy2FySAARFRP+1++615S/0CrdJqw/sdCzTg7xswM7c=
Subject: Re: [XEN PATCH 1/2] automation: switch GitLab x86 smoke test to use
 PV 64bit binary
To: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Doug Goldstein
	<cardoe@cardoe.com>
References: <20210930161720.825098-1-anthony.perard@citrix.com>
 <20210930161720.825098-2-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a01d951f-1078-2048-7f86-ed834bdcf76b@citrix.com>
Date: Thu, 30 Sep 2021 17:20:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930161720.825098-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3773e175-381d-4cea-c6f9-08d9842e3cc2
X-MS-TrafficTypeDiagnostic: BYAPR03MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4166181A300B2E2C3E1399DABAAA9@BYAPR03MB4166.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: shDZwz2nAIVJ2EaomsD8sxpNc1nOXhi+1AcLATuLt24da9UpAcsYbD2+43AdCf+uzM5dEiKLKX6rOuI4DpgXSWpzyAdxBSuxC38vbs+dajeECbbkI2MbELIATaRzuX6dpbmPeeA58FiJnYKqZ5ngmADpB0NI5VVzoZJKTTSCT/ScUmLfT3PTmn23UZ5iYpiOpCatAEg78H85XqjYgOSPl+s5RSbJEUiYLJvC3nJrUtNKQFMghMJVFcrEgo+HzuHkBYm3u/Y+1VJ+FSHxUXPfZQZgeadElsbg8I/HTHBquu0p8pwexrOJSFQv/CRQ5iBL21rTqab83d1oQjdQhY+l2OF38j8OF9BNsVuKd24Ar4Q9Y26rUKrcPc3OyXoS55fWB9pgjOAJzUD/UnCFgQ4qFFy7IikfRObJDm6s774FkpDEd0KrDt1yla9A1hnB8xkaDWulspYaPDKEMdUWALazEZweF2GL//niZy5RMR6JyeC0VjsVgNxT0J4TqL/dJa/xyKr8s/prgV63dIxGHZ8SMGLJQ2xCZQn1VtRKZTtJnfc3m8gJUEwB0sDrPmd2nZi4zi0daUjwnWbjsUKfXeKm8bWt2QwKhqLnd/FMaHxYvo3QM0zKAhmI83VDKhQFn6wd1wJXlJeaWTZ6UD908alxL2OY2VTMho0aUBHvLCYNmDqfZTxUJ06OTIejTZsw+gkxtMbk+bsuyLwEpazBuM8pAuqmc2DFAH1kJLcQew+ph+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(36756003)(31686004)(5660300002)(16576012)(8936002)(316002)(8676002)(186003)(83380400001)(4326008)(6666004)(54906003)(31696002)(508600001)(956004)(66946007)(38100700002)(55236004)(2616005)(86362001)(6486002)(53546011)(66476007)(66556008)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0FYM0NMMzNwZGp5d1RPa0hQSjRrMytJckcwOTNmYmxFeHQyUmtYMnVVWHNp?=
 =?utf-8?B?ckhBQmhmYThrN1hBZGdOc0hxM0xROG1lemhLQzFBOVZqNVhFMGtVRjlXejU5?=
 =?utf-8?B?QWFlTmVwVnRHOTFBNGZrc1lPbDAwcjlPM1NFUUFVZzNpd2EycUFscVV4Uk1B?=
 =?utf-8?B?Z1BGS25KcGxrYUcrSVB3WUF0RWtqbnhOVG9tMFVLcTg3Y3JtWmhtZHdwYjYx?=
 =?utf-8?B?M29OdFYxczZFeFBKN3dIeFlnVjJiQnRhbGVYb0tKOU5ldUR0dzVwdk44Tm1t?=
 =?utf-8?B?V0pnR1dSUTlSVHhLb3ptNkpRaks5Mm96dThMdVRPOVVwbzljdzBwRElVQVZj?=
 =?utf-8?B?bEtGd21tWUUyWVpWbjlKVjExZVE2RHNvWmpza044SmRmVE9XS2VMdE5MbG9a?=
 =?utf-8?B?YUVyaDc4Rm5KU3UyblN0OTV1cXllbzBJQ29HQXRndXo1ZUNjbWl1eWNlMXRV?=
 =?utf-8?B?VmNGRFFMRHc2TDU2eS9ubjJlSmZtM2h2Z0swRTZZYjNhTG1EQlpHY1dKVURE?=
 =?utf-8?B?aUhIQ2VROHZDVTFqVUo3QjZ3S0lqRmJXNWhNNFN0aTByVmZOdFR3ZDRWSVlk?=
 =?utf-8?B?K0tZMVcwZHY1Q25mQWsrM3FlL1R6cVNYUUY1ajlKYmVLTVhNU0UvY2RDQVRk?=
 =?utf-8?B?TEVHSUtOdHVIaFo3TStibkVYb2l3dUQ1eUk2Zk9xR0h3K1gwY2ViK1RaYXJw?=
 =?utf-8?B?TU1Hd21QamM0bWhtZ3AyM0loQ3pOSkpNMEN2V0NXM0ErUWJWc3hrYW4wd0w2?=
 =?utf-8?B?eFJncDJEKzRrc0NheVBSMEovOGR5VWhUSGUxdlBKd29mSU5hN3BIcmQzTUVQ?=
 =?utf-8?B?b3NZdytHS3BOdmM3TE5RSGYrVmpxSTBEa3BGMmREN2djYmJUMk14bnZ6ZytW?=
 =?utf-8?B?ZEs1c250TW1ObUZlQWpSaC9ORXlHa2lJREh3eXV6TitNM2hFT0ZQcHBkVkJU?=
 =?utf-8?B?UDdaTDZ0Ky9rQ3hMT0RkRklZZ2dXM2YzL0NSYWd0TUxZTFkxRUFKK00vZk1u?=
 =?utf-8?B?ODBab1c0dXgwQnBad2VCVU9YVXplZlkzMTVyMmp5U1VWYStjVkFjSThYQUhz?=
 =?utf-8?B?UzBzZTAvMldxSnkrYlZCeXBPUjQzMkZudmFCckZsOXRET1FxSWMrTWpDS3hX?=
 =?utf-8?B?cFZmNDRhQ0hVdk91cnJOKzhEZDJlZTFINXdmMWs5Z1d2RFF4WTNsZ3pObHZF?=
 =?utf-8?B?N2FkS0hSRkQ4bGQ3akdtR0src00ybE5XNGphUnFFYnFQbHM2a1NmV2ljbFVF?=
 =?utf-8?B?QWN0bFJHSUJ3UUdXZE02b0k5dDJsY0tQUDZwMFlIZ0dmK3hFUTNraml3OUor?=
 =?utf-8?B?aGtvWmVIMjM0WEZBTUF3MkZQOGZ5a2c2a3Nldm04OXE2S3JNOVBnTk1KOHNv?=
 =?utf-8?B?NW1IcnU5U0w2d2JHTTYwMEF4b1llNDhraklQMUJiOER4YWYyL1FKbFZrL3U0?=
 =?utf-8?B?NWFxbTBIYU5jZmllL0JBeCs5QU9HNEowTGNpM2FNbERUcWJ6NWRNaERzUUhn?=
 =?utf-8?B?MFNlVUVDeTNaakcyRG9lQWlqbjBpMHl4WXppejFNNEY1d3pyd052RGJjT0tC?=
 =?utf-8?B?WjZ1NWl0TFh6WnNWVzMrNHNSQm1kN0hlUnZNRmE4K1IyRnNsV3dyVU8zMG5O?=
 =?utf-8?B?RHJHQVFLaVhSQ1JSREJveml2NnlOalc5U3hrRk5MN2tXT1A0Y2dLZWFzVklP?=
 =?utf-8?B?cXZZU2NuN2Roek9DMkdlNzhzcklNVThTOWovTlZPMyt6Mi9sd3BCTG5tUitJ?=
 =?utf-8?Q?Nzkkf44rVE0OCbAJlVcKtaLHuTpWTrq9CweXXUb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3773e175-381d-4cea-c6f9-08d9842e3cc2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 16:20:37.4974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD7deeQLIv1ESw8yheeVpu2RDC4OWNm6/eR09J2bPj18J2awYEk3xKgJ+gRHnOrGvCxglsvioru7yauONDKXTUvY6uxrqxnlDvnbrTWnoOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4166
X-OriginatorOrg: citrix.com

On 30/09/2021 17:17, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@gmail.com>
>
> Xen is now built without CONFIG_PV32 by default and thus test jobs
> "qemu-smoke-x86-64-gcc" and "qemu-smoke-x86-64-clang" fails because
> they are using XTF's "test-pv32pae-example" which is an hello word
> 32bit PV guest.
>
> As we are looking for whether Xen boot or not with a quick smoke test,
> we will use "test-pv64-example" instead, which is a hello word 64bit
> PV guest.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  automation/scripts/qemu-smoke-x86-64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
> index 09152e3e9ca1..4b176c508dec 100755
> --- a/automation/scripts/qemu-smoke-x86-64.sh
> +++ b/automation/scripts/qemu-smoke-x86-64.sh
> @@ -16,7 +16,7 @@ cd xtf && make -j$(nproc) && cd -
>  
>  case $variant in
>      pvh) k=test-hvm32pae-example extra="dom0-iommu=none dom0=pvh" ;;

TBH, I'd be tempted to change to hvm64 here too for consistency.  I can
fix on commit if you're happy.

~Andrew

> -    *)   k=test-pv32pae-example  extra= ;;
> +    *)   k=test-pv64-example     extra= ;;
>  esac
>  
>  rm -f smoke.serial



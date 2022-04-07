Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496C4F79A9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 10:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300513.512634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNVD-00037D-2l; Thu, 07 Apr 2022 08:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300513.512634; Thu, 07 Apr 2022 08:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNVC-000350-Vd; Thu, 07 Apr 2022 08:28:26 +0000
Received: by outflank-mailman (input) for mailman id 300513;
 Thu, 07 Apr 2022 08:28:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncNVC-00034s-3D
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 08:28:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b03173b8-b64c-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 10:28:24 +0200 (CEST)
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
X-Inumbo-ID: b03173b8-b64c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649320104;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RTd9bN7jetfpjAoMPcprr0AqMw/mey32W5oEKJu0LNo=;
  b=SKFChOuSN4XH6tLNWRzGi+TKzGvzsldgcFt5W/YYnXUMyVJ+T01LgKa5
   o9B8NEVYD260tT5Rd1tnf1+aNwDKNh01fBeKwXmV1uamoMwsJKiXtw4HL
   vZ4UtxvxSYLPT/vUOxLQKcgC1OLGa6c62hqT7m+bgQi3megzZAlLWOvMo
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68253756
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zERF/alEM7pIsfEjs233gcvo5gwrJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLWmuPM/rYYzbwfN8nb4nn9U5S75+AzIBnTVFl/y1hESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW1zV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYEz0rFbDgyO4kawhgPhgjZagW9o3lCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6aEO
 pFGNGQHgBLobSZqF3YoCNEHnsCDiSj0dyJqlGylnP9ii4TU5FMoi+W8WDbPQfS0QsFSkledt
 3jx1W3zCREHN/SS0TOAtHmrg4fnhjjnUYgfELm58P9Cg1CJwGEXThoMWjOTq/SjllS3Xd4ZL
 kUO4zcvtoA77kntRd74NzW7rWCFuFgAWtNWO+w89AyJjKHT5m6xBHUCCDhIa9Uktco/bT0sy
 lKN2djuAFRHr7m9WX+bsLCOoluaKSUTaGMPeyIAZQ8E+MX45pE+iArVSdRuG7Lzicf6cRnyz
 CqNtzMWnKgIgIgA0KDT1VLahzOhoLDZQwhz4R/YNkqn5A5kYI+uZ6Sz9EPWq/1HKe6kokKp5
 SZe3ZLEtaZXUM/LxHflrPgx8K+BvcyHGyDw0VRWJ4gZ2g3wo3vzc7JyyWQrTKt2CfosdTjsa
 U7VnApe4p5PIXenBZNKj5KN59cClva5S4m8PhzARp8XO8UqKlfblM17TRTIt10BhnTAhk3W1
 X2zVc+3RUgXBq18pNZdb7dMiOR7rszSKI66eHwa8/hF+efGDJJ2Ye1cWLdrUgzfxPnZyOky2
 4wCX/ZmMz0FDIXDjtD/qOb/12wiI3khHozRoMdKbOOFKQcOMDh/V66Lke58K9M6xv09egL0E
 peVABIwJL3X3yOvFOl3Qio7NOOHsWhX8xrXwhDAzX73giN+MO5DHY8UdoctfKlPyQCQ5aUcc
 hXxQO3ZWq4nYm2eo1w1NMChxKQ/JEXDrV/fZEKNPWlgF6OMsiSUo7cIiCO0r3JQZsd23ONjy
 4CdOvTzHcJYF1s/Vp6PAB9tpnvo1UUgdCtJdxKgCvFYeVn28ZgsLCr0j/QtJNoLJwmFzTyfv
 zt6yz9B/4Ehf6ddHAH1uJ25
IronPort-HdrOrdr: A9a23:2C7v06hrWEeEvVbLgtS4EnH0xnBQX0F13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKOzOWxFdATbsSl7cKpgeAJ8SQzJ856U
 4NSdkbNDS0NykEsS+Y2njJLz9D+qj+zEnAv463pB0BPGIaCZ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqL+T5qhruOTXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6R60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKdQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOyfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Ts1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgg/DWVZAVxIv66eDlBhiTMuAIm2UyRjnFoi/D3p01wtK7UEPJ/lq
 D52qcBrsA5ciZZV9M7OA47e7rENoX8e2O+DIusGyWTKEgmAQOEl3el2sR/2AmVEKZ4u6fa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68253756"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+Xb9oDw2w5h7u7SEqEfceqm700PY1Hwj7Ii3IVlVdwbKIajpYv66yhGhd6wFdHbRfK1IzN1zw4UVhwOIu9UNEFenB829EEbY6kj6/imGAX9MGdK/f/RhU7Bl0TOnR32a9wUCwLtcWx39xk+lQ5dcFfKvk8YkchWDfpIC3m+RbOqZ/kyM1Sz+LrhxRN0ifdvcokD0IDnhHvIS9uG2doYeAfNZcN63JCyHh1b+vMSiUAMOQctbgMoqVGNTpfjCYurseOtdp7Ldc7sEjPTK+DFr033apE54gBh0WbEG+xUgETuwfSh37mWNDj3YHrgo8OSImsnQVWNwjYmcrpGOJgSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nDfqYXk4k2p9jJC+zgR2+/QjmY/2QJMwVgszh3DnuQ=;
 b=T76zZPtkZCjFh4fvQQZtIxJbamJCGQb789v1HfYBGslVEeSr+5fgS0gWzVlXqWG1LyRMIKKDDJWqluHbNGFTnbzO8mnA5J35C0YllNBYM3+UtvKLuCjGftt/8DC/s8QldV6Usq2uuxcKq1AogAQJxvzSSKevkzvJWHF6OvTSXrzYMxBtbjGsSF5cTvUh7GBOq4+usPKUNvHyw0U4ityB8wS1k7tpuechPFHRAsyLA/FBpUjyhBTlBFKPkFwBRuCLYwS4e9lsleoZ9KQ7npU+shyRgnwb/HsoJCETSx1EvaiPZ+s30o0C7lzAhYGLSiN9ZEK3Fiv+H1W7TsDt3ahnKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nDfqYXk4k2p9jJC+zgR2+/QjmY/2QJMwVgszh3DnuQ=;
 b=nriy8uq/U8BGJE/Ep8mhe1HUdRYvGlZp5hQOxO7zQD7shaHMzRJAy54Haf6hdvKdqg2/msgoZ4lvHvq5pEF2WpKGz4KiyiKKUDr5QG6T8AcfrXq2RZd65dih5Rn1l7i0v4sj4cMw7jjtmx0DHxd4gD6V+C5J5p8jbwhaM/IUUfE=
Date: Thu, 7 Apr 2022 10:28:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v9 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <Yk6glX+SHMyY/GYF@Air-de-Roger>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
 <20220401104713.22291-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401104713.22291-2-jane.malalane@citrix.com>
X-ClientProxiedBy: LO2P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba67d0a5-51e8-4754-f1ff-08da18708d20
X-MS-TrafficTypeDiagnostic: MN2PR03MB4719:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR03MB4719CD60A55241978756DD8F8FE69@MN2PR03MB4719.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEKz3Lz2ek4z85VJrW4IpreydbEaJUWH/RCVCkMasSBv4Nla0u2M8gufuvD6+Wn/9tnxmlx1AsJRvJ50C6NJczibf9hM/RY9QnaLHhNOzaF9JTJJ1t7rEJdCYucw5oRH1JR8m4xHO9aU/9IJJ78BTrNNe4m2KthORJDP/dmAc/u17soSpdChzKIHdxqsXL6VP/EAshwgFoE5ar5TDxqvvKJFpLm3qa1bWGWraIYIR681uulb2e/dKSU0hBEKv0vwaQb9KbDjUPwXSOvpO4OEoDKkquz/V77HQ+9Z7iY6CFT302IU0y+RqJs2q9MJvJDqp2Sm+S8KdXnMWJvS92cmnsUhcLpuDL7SvZi0N/XNRP0Ce048SH8u7AXrk8FjicMD0oca0yaFbA+K/UoJy5sa4UKiyhZQoK9DpYbyz8MRh6RzfvbxCKB2X8uBJA3k8yOjO2VDCDYuDw/C50VX+5Wl5n/miP8q5hxEaHx8e0Ep7dmBSSXBZIbvePvBP+JDp+n4gFzxllOoYiICQAVmMGCnoAzTRbb9ihdjkwv3W6MexmcX8HZ+OaLsu6BcRWcg19BBS7/v5Ffrr5Iy9aaLwX9z0a4gw5vYntt1dwyIE0WNu78y6rwqLYbkKkZUjhUkUX8Pn+oY6M778xPSV0bdY1zJHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(6506007)(9686003)(6512007)(8936002)(66476007)(8676002)(6666004)(6862004)(82960400001)(4326008)(85182001)(2906002)(66946007)(66556008)(5660300002)(186003)(6636002)(26005)(54906003)(86362001)(508600001)(33716001)(316002)(83380400001)(7416002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlZXMjZScUV5SFNwRk1oS0VPWUI4aXcwd0JvdEN4RDN4cUZ1K1VSM0FFK09o?=
 =?utf-8?B?cDYyNnZZZlVlV1c5MVpJM2lKbHgzNEN3ZUxqRlJ3Y3ZnZ2hHNjZSbHdHODBu?=
 =?utf-8?B?aEV0amcxSTdWa2xwU0dwc0pHVTA1YXAyc211WVlPT00rMWZOUDdBQ09LYURE?=
 =?utf-8?B?Q2ZlUm5GN3FWUkJYRjBvUGxVckY0WUd0UU5xSDdaTHN1ZjZrK0VLYWpSVE1B?=
 =?utf-8?B?akpRSW4vQzlIWE90UHpSNHZoWWVIazVrYm1BZ1FwV25TTEV3UVpseUlRWnhZ?=
 =?utf-8?B?NFlGUnQ3cDMzWlZleGZXNjA1ZldGN2d3RzY0bUtzVHRET3NUQVhXSWxVN3l2?=
 =?utf-8?B?KzZHUVdqTXA1TEVZazA5ZWlsTmxpbDdEamwyempvTE9pOWFPZVBtM1h3QUVG?=
 =?utf-8?B?OFBXL3dSWXlRdTgvNUNMUkZxSVU4dWVsUFpmeUNYczlPLy83RGFRdk94VDJI?=
 =?utf-8?B?SlIzRlRHUm9lNW8rR2RDaTluak5YckFpdnNnUW85QWMyN1Q4QkhFR2NGT2M5?=
 =?utf-8?B?c0JreXNnWlEwUlowRllYRDk3NmZuYlpvNi9hTVl4MmU1WTZXREptZUNhZkZv?=
 =?utf-8?B?MXNGcktCRFdieURNNG05Um9ESnFvQVQ4TTZBS2l2c2liYnlZdXUrNWVFU3Vo?=
 =?utf-8?B?RGFPcXBNTU5YTzc1M3JxNkl4dXIweTZIOHg4R3RRNXFYdEMzaWhWTS9CZUNM?=
 =?utf-8?B?bDY4S1FoV2V4dXNKeUtYUFFnVXlpUkpGQlNjVU9jSHhEOUdmdVN4N2dySUp1?=
 =?utf-8?B?UC93QXNSc1RCZjlhU1NJTXRReGRmZWtqSUtVYVZOU2hyTnVSK1dzMXBkeDl5?=
 =?utf-8?B?V0RnbjRKUjlnZkJoTHc5NnlBVUZrdy82aEJwdXVFVERjMG9USmVXSGgzRFpQ?=
 =?utf-8?B?THd3c0RKOVE3NlFVNlBzV1orWjI5OGkzeTFGM3VQalBJYjNRVDVjUjhMUlpF?=
 =?utf-8?B?OWpNWlFxNnFJYzJwUDIwVS9TeElBWGVQeXRXS29VVS8vMFRBL3U3dTMxVHpJ?=
 =?utf-8?B?SWJYVmM4czAvVEcwSEhnS21yU3FuNlJsSGd0MUY1VFo3VThTTVdyenpVbjRJ?=
 =?utf-8?B?MU9IZEwwbW55MHk1ZjlqeVlETVlDZk1iZnRIVVNwSEdRRFdIbFBDRDBiOVRK?=
 =?utf-8?B?WHNYRlRwNTFyUEZYQ0F5NkgrMnJmT2tyRTlBbzJkY3VXOXRPNUxBM1FhbW5L?=
 =?utf-8?B?RnBTTXhURm9DbXNPd2FHWVlZMEZHd1czWmJoRlVqdmtmcjhERThIWjVFSjg1?=
 =?utf-8?B?VTRLWEtaamYxTm5vdXR5UDlHUjVXSUJ4YXlRb3FkWjVvQldJM2hHZ2NzaEox?=
 =?utf-8?B?TURnRkU3SkozaGp4Y0xzMGVQZWtGbkJsaXJ3R3VmY2xxQVJ3VnNIWTFvVTN0?=
 =?utf-8?B?YlFhU0JvWExpbmlwUVFBUUM1clgrUUtxVnI1blRzVzJTeG1zSitLaXB2WHRH?=
 =?utf-8?B?aDZIS0FyRXRqWUdRKzJzSmVSR3VDK3g2ZjN4RUtLc0FuZm8zMlJxREs5cVZG?=
 =?utf-8?B?TG1zbFJnOHJtTks0MTdlcWhBcDNJWHZRM0J6TFlaQVErV01BUmlDbTVvM1da?=
 =?utf-8?B?L0tKalYvOE1YV1U2Z3dLbExIQ05ENXU4Ny9aTUVZTXRZL0t0VTN3U0JwbkJ6?=
 =?utf-8?B?YlpNamdwV3VqN2JxUUJDYU1XalBUSkg0OXZYa0ZEaVA4ZmhxV3YzNklDRjZp?=
 =?utf-8?B?Tm8rb3BPalZ6QnA0QkMyb1d2MXdKRE0vRkpTUWgyalQyRVEreWtjWEZpUTZF?=
 =?utf-8?B?MlBUd1R3eGZrNXUzTHlZOVltSVV5bWE2N0VqUGRtQm03VWJMei9YT2MrMDcr?=
 =?utf-8?B?STNVckJhUitHbEVwaW9JdHhBNTg4WmRmN2hWdTlSRXduT28zREVuNTRKOXdt?=
 =?utf-8?B?blBaVTZWNUQ3UDQwWTRiczJDMnlodzZWTWRHZndpQTAySWhjNXhHbGNqY3Mv?=
 =?utf-8?B?akEzVVRXS2hJb2NVdTlSdk5HSnprckRrS0lyN2tMUmQ2aW5JYjZZY1hYdjNa?=
 =?utf-8?B?Sm5NWHNwZDlkMTV2UE5nMVRJK2hSaG54dmFQeTFaOS9rNjNOWm5WbUVKaGRD?=
 =?utf-8?B?OU03K0JCUm1XUlhkWkd4U2ZHalJ3Uzhnbmx1TlF4VHJqWkpnZnpySkxmTmVK?=
 =?utf-8?B?b21hQVFsbGlwOGc2UkNrNkwvUHQ0UStjaHp1QXpUY3VzSm9kTEVKOUxDekE5?=
 =?utf-8?B?WFhHM1VPUEgrbTlQWk8yS1lQVlY3SisvZUJFYVRRZzVwMENJL29LZHR5SUZI?=
 =?utf-8?B?TVJsQXVFRnJ0aXV3Uk16UzIxVWk4MDVoSU9NelFveGg2Z0VHM3crSUF0Qzls?=
 =?utf-8?B?NnpqQ0ZHZHpua1ZvVjd2S25CdlVvYTZCb0g2Z01PNExhNFdqcTNXcHVqN0p5?=
 =?utf-8?Q?JnT6m/Y+lXIHtZS4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba67d0a5-51e8-4754-f1ff-08da18708d20
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 08:28:11.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geZRxK3sMc+eBWxODrYU2v3SX9SluqZH2CADP27IHmWL/rm+DHEootoMFhUGK9weBE7LykjFujQXqVYjaQEsuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4719
X-OriginatorOrg: citrix.com

On Fri, Apr 01, 2022 at 11:47:12AM +0100, Jane Malalane wrote:
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 709a4191ef..e5dde9f8ce 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -117,6 +117,9 @@ static const char __initconst warning_hvm_fep[] =
>  static bool_t __initdata opt_altp2m_enabled = 0;
>  boolean_param("altp2m", opt_altp2m_enabled);
>  
> +bool __ro_after_init assisted_xapic_available;
> +bool __ro_after_init assisted_x2apic_available;
> +
>  static int cf_check cpu_callback(
>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>  {
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 56fed2db03..53d97eaf13 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -2145,6 +2145,12 @@ int __init vmx_vmcs_init(void)
>  
>      ret = _vmx_cpu_up(true);
>  
> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> +    assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> +    assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
> +                                (cpu_has_vmx_apic_reg_virt ||
> +                                 cpu_has_vmx_virtual_intr_delivery);

Setting assisted_x{2}apic_available should only be done !ret, or else
we might be reporting those capabilities when VMX is not usable, which
would be misleading IMO.

The rest LGTM, so with this taken care of:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


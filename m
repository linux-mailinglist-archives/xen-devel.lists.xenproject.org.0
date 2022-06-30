Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477C556157C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358339.587507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyM-0007HU-Hm; Thu, 30 Jun 2022 08:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358339.587507; Thu, 30 Jun 2022 08:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyM-0007Ec-DX; Thu, 30 Jun 2022 08:56:26 +0000
Received: by outflank-mailman (input) for mailman id 358339;
 Thu, 30 Jun 2022 08:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pyK-0006vt-ME
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:56:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83a6c381-f852-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 10:56:23 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:56:09 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6977.namprd03.prod.outlook.com (2603:10b6:510:163::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 08:56:07 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:56:07 +0000
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
X-Inumbo-ID: 83a6c381-f852-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656579383;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Is0yTsQH5C0iliVyRcu+gGIXiTYvoerDUpGD7PPJUTA=;
  b=Y5KP/QQBMeUifv0FTvbEJkNpad81w7bXg/AqDi3e7VeYs9UHLUtwdt5i
   Q+zTofIgCBoXMQ3zgcZYPYms+sh5qbnvbAsn6yHUOVSIxE2UcZ7ndjyUy
   vCOtYYMbWHbjICe4Pum1bUPX+mru0yFC8LEcx/tFbY2bQQbO5fljB+SEi
   Y=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 74604574
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w8bkUa2cv5QQduBhzPbD5c9wkn2cJEfYwER7XKvMYLTBsI5bpzUCz
 GAcCjzVPP7ZYDDxKYgkPISyphxV6pCGytNjTlFupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tAz2YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1m6sW/WUAgG5bokdg+bggINw1PF6dZreqvzXiX6aR/zmXgWl61mbBLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B86dBfmajTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SWhK2EF9w79Sawfzmv86FxK1P/UM9f7dNO7QfxVkEzHu
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1jYeRt5RHusS+AyLjK3O7G6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRSXKa9THuc8vKRsmm0MC1Md2saP3dYHU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdv1y/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:4rmv4K6MUwThnhKG3gPXwSeBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfjqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCeCmMeV+bOitXXnNa+CCR2cSIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwlv31nPV7b5RhNz9o+Ezc/Cku4wwEHHBmwyobINuV/mruy00mvim7BIQnN
 zFs34bTrdOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvGrf2UIUh4bD3wXklX6vpREnBmc4a+a
 hVfYnhDc9tAB6nhyuzhBgv/DSuNk5DbituDHJy+vB96AIm40yR/3FouPD3oU1wiq7VM6M0gd
 gsEp4Y5o2mHfVmGJ5VNaMmffadLFDrbFblDF+ySG6XZZ3vfUi94qLK3A==
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="74604574"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQO5qWeJEKKlcn+nVWXCcwGUI9OYalvvKQ4tJTMNbd7RZUThr2dqQ9UJXgGsto6aW9DvBv0WI+m2lyI6uIAkK8q0Bc1mlQYVlbGD0/ylETXg7ZV3ONneYzqQDL7/CSrs62m1Red+MW3lYSKDqIw5vepJbhUI5h5zZVLE9bzm6TPyMVrgjPoZpn3nPaZTwyEJ45vywIfGwzDJaCZtubWGU8zQmLmxYR+rRpbwxl0g6ud6ZgU8/wem7FW7C/LRPtYJblYV1cR6ODuk1H2S2eK99XgCEqYwcnmBZ9FjxEd4c0Wtips5DQqcDATZ1Y3HXtLXJvne7Xl1wXlCIQPCoC53Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Lk+qrBP83OcPYZn5y6uqm8i6vkKiGznZizcw4FHPHk=;
 b=jaM7UL9J8fS8TUzUq505S8uhH4y11VtdIcu9r3So0HzvWbnQzsRd6MRaFwhTpkP26JuICt/M+N5sngVlmuqXsRVhMIklmW3wFycpJpNYScX9k/SQ7baDD+TLudHZzvv43/typXzoMYJI1vFP9OLq6tE6z6+l5tgKAO5rd1Pp0Vp2WXoHSZs9MK7e50DpJAg/vuhOdSuyENzjGyqSX+WxOV7QuOVSeKul7QaJiCPpbtv4KQe2sUqJjL/8EcTfK3sIHeeUm6TtaicAtKWHn9g2PYmXepv/6VvgnOoJZDhwk4i/VRRurcVCBOKnNEndLmUfNgXMvg32NgX4VCsgqnvVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Lk+qrBP83OcPYZn5y6uqm8i6vkKiGznZizcw4FHPHk=;
 b=f2AzyGtjMz6GNJs/vG6+4SmZEz8Nl/kBxCYnFo7HhxeWwcSNLh45Bxp4VhNqi9hDH46kw9vzHH8wjeK41tYkyNTe56EICznWBx+0xsxVCUWBik/AmCOk2md7oaAZ8Ypubs7k46Q30t0CNi0Q/3Jx/mssrfW+yJQaTTbdYhoab+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/6] x86/irq: switch x2APIC default destination mode
Date: Thu, 30 Jun 2022 10:54:33 +0200
Message-Id: <20220630085439.83193-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0373.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b6c2e24-f9ff-448d-18e2-08da5a765f22
X-MS-TrafficTypeDiagnostic: PH0PR03MB6977:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zScufEK5GoBVKq0gooYOTT52baQGzRhSWf45GZMdIA9vIE4DS+j7kUyrQviyz4Z8DeXCbMyuShVxS50f/BkU2x8qBRRgvEjwqrMEoHnkvoIRSKpUKh3Mf+rs+7r+LF+l25X9rLROHnRZr2dNZUW+c2xLSyerR3l3zyA9DYUWYVAue6Rr0koHTVrytUm4DRHrv0GlkOV5ukz9Y/EJn2jydJ60/UqPzQYgBVZIz/mmuX1WTD0TsdkAeDgECfdgv4ZCsgJHmG93atB0qXYY6v2UEMu5wrtAkexMyq+9/iLgT4r/JTYUwIv/REEYKhq5mAxtvz8/RSewwbFZoOl2dHNvDgbWq1Te7wBHx2yLjS961RpME5kpC7YAj/0YXiyiHECmrkgIRpgPLnTd9krgmbRzBNVZJY1wFPjU9bdHQzx+BRk4XlJoxbKwncz2oTxSPog5E/sr7X2kNryPXfNT7ehwGKOcxjJo/Unax/MfYtG5ubvyHRdo+7Gf+0Ffqp2/Xmqz+7MBFm9sPJuWVluvEqbzMCHtbPPC4OE05qtusklzKoubJw5jiBClOdJ8VL01ucexFiwLgZYpwWuoDXtA6d9KrUcQnvSjgJR8BB317pR+/wPnLVHG/3C395yrz7K/Fp1aBmFCMQR+KJwwnWhrQB91VwRXSv+hT6dVksoOgi4dB2z0BtDK2biVBllieGsiqasXajVE8cCp63RaapJR60kfIDzL2TWUbCOMTuDtZQkdzFa8ZXhzcjiWZkqpTj7gCAVNuQMFYfJ7suYZ5cNgMA/UdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(316002)(38100700002)(66556008)(66476007)(8676002)(4326008)(66946007)(478600001)(2616005)(186003)(6486002)(1076003)(6666004)(41300700001)(6506007)(26005)(6512007)(82960400001)(54906003)(6916009)(83380400001)(2906002)(5660300002)(86362001)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWJFaEluVGFVUWNobUxRWVhmVVBjZ1FBMmI1RTV4TVp6ODA4b085UzV1NUJv?=
 =?utf-8?B?V2lidUVxZU1LdGZKOUU3OC9wa0JKd2xldjhtRGF5S1hoMlNMbzZzc2IwVVJt?=
 =?utf-8?B?MkF5dDUvOXptZ3k3MjhQYUdoM1lyYUx1dzR0TFNmYTcxalVhVGhraEQyYjhj?=
 =?utf-8?B?Mkw0eG55M0x4NmtKUEs5VFkwOHZmeXZWYkZJak9KRjRWVVUxK251Y3hVZVBn?=
 =?utf-8?B?ZDVwN28vQXBXOGJaRWg2Ym5MUWRtRVJGdUNyazNVSEtWbk1sdlV6bWE4ZG81?=
 =?utf-8?B?OEpYZ1Z4d2tFNFJkUEhrUnh2Mmdkd3Y3VVVYd0I4TjJmR000UkgyN20zUVJ1?=
 =?utf-8?B?Y2VrYkthWXZYS3gzMG5nbStxUEVobWhuVkhKM2pERUQvb2ZqRm9ySE94bHBJ?=
 =?utf-8?B?UmlHZzBiUW55dUp1dlZ0OWlWY1BaVEl0czRWTFcwR3pLam1XL0pja0lDTmtI?=
 =?utf-8?B?aS91dndVY0dMUktucDZwVmk0MisveXVzeWF2bjJmQ29VbkdubUlDc1R3OVdv?=
 =?utf-8?B?QjBlNVhjSEZ5QjczdWFDOEtteHI1Ym5rSHFpQXl1WmQzOVkvQjRHWjJ0RWth?=
 =?utf-8?B?N0FtVjZvclNBMnNpSkZoaHlrRThmNXk5VWNXeVRGM2MzeTI2V3ZsaENGWmxq?=
 =?utf-8?B?UllCTlZwUnlrNldjd21nV3g1aldURExyUnpyUGt2d3l6ZXd6V1hxcW9GNlZ0?=
 =?utf-8?B?U3JxbjdiZldOZTRZSzhsa1AvMCtraituL0o1SUQvN2dOb3pERVRIbnFuaGl1?=
 =?utf-8?B?OTU1SW1xZ2dFUkl5ZytQdUNhbWRtYlZpOVY3SG1WUEJHTFhOVXIraFJCeHpx?=
 =?utf-8?B?NnhrUkZFcG9sWmFvUjZKNWhVU0lQUFc1M0pVaXk5aVpUL1hpNEVZYzlmN2FV?=
 =?utf-8?B?aGp2Qi8zTVVlc3JyMkgzWm40cStXTmJ0bHV6WHVjN0t5eS9IcC9HZ0x2SHdI?=
 =?utf-8?B?K1VVeUNKK0pkaVloYWRKUm9YZWVVNmhtSU1FWGppSmgvSGtQaXJYYk83b1pI?=
 =?utf-8?B?bkxrNXl1bXEzZ3FHeWRLVjViSUtsR0dHd3VMQ3d0dllHNkNOM0lOdCtSakJD?=
 =?utf-8?B?S3ZnQVpRSkhzWDFrdy8wN0QxVTZrWE1nbEZ1amtTL0RZTFVpd0F4RVpPcHFv?=
 =?utf-8?B?dGpRYjFLSjhlaFRuRERKY0JETEN6cklJTTB6YWRPaVRRL1RpYWFQVnhFY29S?=
 =?utf-8?B?NE1DeTMwRWkwUzBFL2pEMVk2K25pQ1BlSWphcit4WlFwZjJyMXlpNjdXcTBL?=
 =?utf-8?B?UERhaWxld0kyY0dHdHNCNFpaWGtpYUpYZXlHQkZEaXpOZWpyVkVzaCtXUmZo?=
 =?utf-8?B?amJnTlpkKzRyS3ZrbzZBZ1ZveWtYR3ppcitDanZOVVZNemVhWVprTGE5TTFm?=
 =?utf-8?B?d1hUdzB3YzJldE04cGlWek0zcUJXZ2ZJdk9BUG5iWUtqTkxHUmNuUzBvTExC?=
 =?utf-8?B?SnBkODdoRGxvRkR4WGxMd2pWRDh6YmIzQVpuZHRQclVMMklFV2FFQnhoeCtk?=
 =?utf-8?B?MEtpdzZlak43dVMreE1JWkVzWnAwVjZZZGJaazEvZHcvVGVLWXdlWWlhOUxw?=
 =?utf-8?B?c0tONDVnbUc2cS90bXhQaHNuZDBodXlVdFcyYVBrUXhSbisvYjFkemNKak80?=
 =?utf-8?B?WWlVbWtrQkFXeUY1djhxQ0xZTW15Ky9oUC92dGxxSzBzMkRkM2hPWkV6QWd2?=
 =?utf-8?B?ZmFmTlhac1JleDByRXVwNlF3S2tXMFFySVFRVitGWndaL3V6a2dTL0dxTzg2?=
 =?utf-8?B?UmcwMHVlTGRINEpVWkZuT0dXZ3F2UjVZRGRuMjdlbzFUZVIrbzZxQ0w1cmRD?=
 =?utf-8?B?NittNDBvL0pHc1luRGNPaTZNTmU1NjBFK0lobGFIWGsvWVB0TVBnOEc1Ykow?=
 =?utf-8?B?TDI1MU5HSEZ6SVRIeTlVVU9GQnQ4NGZKbGJEdmtFd2N3bWNJMjZtbjhweDdr?=
 =?utf-8?B?cE9YRUx5c284T1Q5aHVib2k4T1NLeW9Qd3YyTGFJUHIzNjFqaXAyR3IzV000?=
 =?utf-8?B?SHdITU4ySFYwMHh0ak1oQlh4Z0VkUHdBL1I1ZmJPTHNXMzJnK2hOL0UzV0V0?=
 =?utf-8?B?MmRyZHpJbFJsRXZZcGJqUWZ3RjdBK3hocDJqWk1JMytQSC94SHYyNld2bmZj?=
 =?utf-8?B?Mm1sTGZvcis0ekh2eURWQW1KejFoU0gxUnh4VjRwWHZTSEN3R0JJQUNOZkp1?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6c2e24-f9ff-448d-18e2-08da5a765f22
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:56:07.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4oZGtRtdT5PZqQZUMc3UkWmiItSQxB+6NjliDjywXAcuJIGUzg1B+HrMWcMflN3KMJTqXUnAdp8kBHTG+3H7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6977

Hello,

The following series aims to change the default x2APIC Destination mode
from Logical to Physical.  This is done in order to cope with boxes that
don't have a huge amount of CPUs, but do have a non trivial amount of
PCI devices using MSI(-X).

The default x2APIC destination mode can now be set from Kconfig, and
will default to phys in order to reliable boot on all boxes.

Further patches are a bit of cleanup related to the interrupt limits
reported at boot, and making those values more realistic.

Thanks, Roger.

Roger Pau Monne (6):
  x86/Kconfig: add option for default x2APIC destination mode
  x86/x2apic: use physical destination mode by default
  x86/setup: init nr_irqs after having detected x2APIC support
  x86/irq: fix setting irq limits
  x86/irq: print nr_irqs as limit on the number of MSI(-X) interrupts
  x86/irq: do not set nr_irqs based on nr_irqs_gsi in APIC mode

 docs/misc/xen-command-line.pandoc |  5 ++---
 xen/arch/x86/Kconfig              | 19 +++++++++++++++++++
 xen/arch/x86/genapic/x2apic.c     |  6 ++++--
 xen/arch/x86/include/asm/apic.h   |  2 ++
 xen/arch/x86/io_apic.c            | 10 ----------
 xen/arch/x86/irq.c                | 15 +++++++++++++++
 xen/arch/x86/mpparse.c            |  5 +++++
 7 files changed, 47 insertions(+), 15 deletions(-)

-- 
2.36.1



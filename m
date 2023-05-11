Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8666FF510
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533439.830114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7eK-0006rF-S4; Thu, 11 May 2023 14:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533439.830114; Thu, 11 May 2023 14:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7eK-0006oL-Oh; Thu, 11 May 2023 14:52:08 +0000
Received: by outflank-mailman (input) for mailman id 533439;
 Thu, 11 May 2023 14:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z6rJ=BA=citrix.com=prvs=488b3df2b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1px7eJ-0006oF-DI
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:52:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63e7dff3-f00b-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 16:52:04 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2023 10:52:01 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7232.namprd03.prod.outlook.com (2603:10b6:806:2eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Thu, 11 May
 2023 14:51:59 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.022; Thu, 11 May 2023
 14:51:59 +0000
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
X-Inumbo-ID: 63e7dff3-f00b-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683816724;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=mrI2rusD0JviNDhvgeY+tdSjHbjiscnh4jCl5whg3SQ=;
  b=F2YQ5wwSpumw21kNBqZ0CC0FTdCMIXaonGWLVezYSn5nmhPxiFrNXDp8
   iTFtqDuvxiExgIiPy5ptOJpgoWeUMgOPpvP84B5oBIdq9XukLJN3eM21C
   d6OOoHVXMkuk+hOgUy5cM6bGx/VXRaOW9LN+vd8GqF3MdYkbAnJsSpKLC
   g=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 108568732
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:57LXn67nPOrMn+/HDJUN5AxRtCrGchMFZxGqfqrLsTDasY5as4F+v
 jZLCm/Va/+PNDGhfoxxOt7noEwO7Zbdm9A2HAdp+HtgHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S5QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 d4YFyktdy66rO+k/r2Vb8hUioMCI5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+GF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXOmBtJNT+fQGvhCsWWeyU0KWUYsD1ai/un+j3WDAs5RE
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2IB5UlqY/7aQ6Dm0aS4cKDZYYTdeFFRcpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:ymn2carRAhBC/DBwAB+11J0aV5oReYIsimQD101hICG9Ffb1qy
 nOppsmPHrP4wr5N0tPpTntAsi9qBHnhPxICPgqXYtKNTOO0AHEEGgI1/qA/9SPIVyYysdtkY
 tmbqhiGJnRIDFB/KDHCdCDYrMdKQ+8gcSVuds=
X-Talos-CUID: 9a23:eNGsumFDPyd35PHxqmJ31k4rA+A8TET2wWXuLGGdKF5lD5yaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AJn0aFQ1Yx/gZWryR3F8WRd1UXDUj0pyjB2EUwM4?=
 =?us-ascii?q?84cSdajw3Pgyg1Si5e9py?=
X-IronPort-AV: E=Sophos;i="5.99,266,1677560400"; 
   d="scan'208";a="108568732"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5ShBfjRckqM7hncQynaown3a/AGEa4SUaOQsc3cI+ROz1Bn04AR4/whp7WvlGFcfLuDJTBCnphcda2R4g1NicMrFE0KIYDjVSfbvMvR4jZV4xdWh9qrBxz7DPlWj8qPgz9ciKn5kTFojT96Gbg/LQhcIE8lRxUNcezMOB0hNDurCRs7un/9Z8L5M7i/rxK4VDG2iEXRYj5oLxE/NA8VbSYJ9XVQnd2Faenh1FxI2z8MnX4GjDGnSrFoEjSUxuvwkYCYMDVwysD91sM4LCqneyBeXhUoLuYbyOcxecJHCjs913s92JXvcDBflx6lfXTzjRFpcXv0MtXMqpkLU6Wd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRLwXEHiNJLX7HjBGmjUrTtwbY+2Ehv3zGsT/ef0u38=;
 b=JBOLkziKLkcHIL7+C+VR+UoYx154PTCBRzjDjVTFqpC2HPCcGgpWDKVLk8bV8V76kV/NJA7p3diAV36k53392Sb8IcqbfGQYT3sGAR5okRQd813z5G9cfdjP/+ieFkvnjl/UsurYDe422++Q8gpceEn20Il//cwevFZEZ079YYOyUbn9mdS3dGVke9XIcvZj2zJ1NCy9mq/ri7se6Zn3ZYyAt8QE1MGoPh75Hk0hqIo2gOOTqN0W3f15PKv2GwuXRIJa84oIbvLKmiJJnAPMHtnSHr9X0lqSCIr6uYOuYLG9NuU9HsAsiDY1w98bVdSJZ08APe9OLuo71w/rkw+YbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRLwXEHiNJLX7HjBGmjUrTtwbY+2Ehv3zGsT/ef0u38=;
 b=EcMN6eKrd3Eyf5NOpq5me8tbKOdoFrlB+Uh8D6f6lzMjvOdD1gF/3Sx9ACj8nMJoFO+w7A9a+Ad3TsdV5+BZPRoqWaR/E70/TDHKD86ELARv8g0uVo0n8LK3Td8ApslfsX3zFkPhj5o8tNAN1V+1hNWemiPAUY/wAa9uNfC5jEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] iommu/amd-vi: fix assert comparing boolean to enum
Date: Thu, 11 May 2023 16:51:52 +0200
Message-Id: <20230511145152.98328-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::33) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c116db7-4e0f-4ff5-69c6-08db522f45c4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BM8i55MCVmd/mNTkXATDZMt+npoRxGQ+4vE6tSehnwOlV1D/PDefOeU5cUZfwzhj30BfMe4RBObI3yLBhzWtA0M+uySKZdulEPv28ejxjtrUVVVqceiKonOBqm4HWm0+KHfTznbTTjfpD6q6UQb6Vp2GF7gEcmsGFunzUVpryVu0n9tYvc5ZGWcozFwFoLgWM43NV79PUdMQbLoN023cIYssS8Tob/ShgzZskEpA4LEdhGPZ4GBT2COhzeUDE1Ts4AV3Qg77rNCKicw61gn/8QoaTH17wPNIBWzn8o1ab6Z3mY0LUG47UqzxMWFVA4yxTELSuo8wwFMw8pjeQW+UZ0iaD/P4qfcT98fYcUn0cisKYFcBOrsqo9WE+jjrBZ549VWuEVSZelkYR9QOl6Lf+FQ2ioXgwkCCkJjj5e/PcSasRaJLl1uk/uqaXiMvMoRp3sfX4BHdOLS5dqMTT5Z7kMghCRtKGmq2ZJ4pJLwSNcG4/yWgM6nGpCR/p7muNEHLz56b+o7jIXmcEOq7tuvNK19YFdb71aTby77Ry9JJheuDzjj+DYFTeJMdH6E5e5q4fkGgQwZ2s0jQ9e/qQ4uVmcAxiRjw3l49KNVj8K+W8mUesVccrN3vzRr5aZQ8qV4v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(5660300002)(54906003)(8936002)(41300700001)(6486002)(6666004)(8676002)(316002)(26005)(66946007)(66556008)(478600001)(4326008)(6916009)(1076003)(66476007)(6512007)(107886003)(6506007)(83380400001)(4744005)(186003)(2906002)(2616005)(82960400001)(38100700002)(86362001)(36756003)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUJTbVIyOHN0ZzFad0F3L2U5d2xGUWIvU1Nic0ErazZ1ZWlscFNmVnh3Lys4?=
 =?utf-8?B?b2Y2SElveVl3bkRxVUdPS0VXZWVjc3IwV2NUdStYT0lVMnR3R0hoSHFXdlQ3?=
 =?utf-8?B?N1NaakFjYWNkVW5iTXJURGNheFVnT0tlazFyOWh1d04zM21QOS9pdHFzU050?=
 =?utf-8?B?MkZ5cVAzUUFTZ2M3akNuZ2duRGFtSFZzakVwNVl5WGIySjNHREJZbmZyWmpW?=
 =?utf-8?B?TnpmcTVwZjVGSWpOWnhSYkx3UFNxcnJuUlRVMzg3QXZiYWJjTm1WTGJxMEhK?=
 =?utf-8?B?bG1jNUFVcTdaQU5iK3ByOXE4S1hZcXlLMkhlMXM5dVg3UkJaMHNvd1NVZTJk?=
 =?utf-8?B?dzJ3T2FLdmpOMmNBVDF2U1IvQkU5a0N6UGNPQWo3R201QUUrSzNuaUdPQTQr?=
 =?utf-8?B?dXd6WCtOYVVPbGN1UmMzM280Znc0VHRuU1FSZTV3cVJma0tONE41cFlST2gx?=
 =?utf-8?B?S3NQbmlaSkdKWFM1YlhqcFpSL0t2anFQSXdSaEY4anJDZ2pyNEhWSlF6aWdI?=
 =?utf-8?B?WW9lQXE1Vk9JekVZMW9jdE9wZ1RlcTRTcE52cUVDd2cwMU9lUzlXWjBPNUpl?=
 =?utf-8?B?ckZWSDBZZjZPVHMrNEdLTVgzczg1bmlJSFlldVM2YXRDL3Vnc29hTEtQYjhI?=
 =?utf-8?B?aWx5elNhbWxIZlZvcFllYVppNXZVd1AvMGY3b0ZuSGVDMHM5V2dPaU1ZYVBM?=
 =?utf-8?B?Njl6RC9lTVgyZDhTcUEvZUdLNEtlR1FLVlN3RnJzbmk0SXBtVlBwemdhcEh2?=
 =?utf-8?B?NjU2ZzIraERxK3BuTjBVaXphOUszdVY1dk50UzlWMkVRaU1WMkZycGhzVDM5?=
 =?utf-8?B?TDdBVnhVblpId0hCWmV4eTVpV0ZUK3Z0bEFVaG4vejN2SURiVEI3ZEtRWEE2?=
 =?utf-8?B?RE9UbXVveHJaODBIdjk4S1ArMHhHYkNHcWZtYlJmYkd3MUI3aG1kajkxVGF1?=
 =?utf-8?B?OXpRbWRQck1IT0puM3lYeDBiU3RQZmJhczdnS0xySUhEK1dPb0FubU9peGpk?=
 =?utf-8?B?Ny9MemdDeFZBY1kyZUJ6VCtzcU1vTkF6Yk5vY3ljRVFiYVZxUDFzeHdQQVVX?=
 =?utf-8?B?czBiSm5MSVpKRERwRFEyaHFhL0JWR25pa2dWNStONTgrai9MN0J4QUM0Q203?=
 =?utf-8?B?L0I0NDlWY0VJVzExUUowN1lBM3YreHdzTUdPcEhaWnlBTnZ2WUdVL2RnSW5S?=
 =?utf-8?B?MEk5OVVPaDhjd2lONFNLdVkvL1VKbEdGdVp1cmlubDFqQlBBbGRDRmdLd0RX?=
 =?utf-8?B?ZGFZQlhyKzloaDhwNGJXQ29Oc2dTWlRpTzdYM3BmRjdJMnVOT0cwdGpWdU8r?=
 =?utf-8?B?QWJndkpsUmU2VGZTWFFuY2d4czc4NE1xUDBRdCtXUVJJb2YwWm1WTFAwR1Qy?=
 =?utf-8?B?clhOS2hoWERmbVZVYjBXUzRReE1aS3ZuNDM2OWw1M3NDWE1icEpWemlzbWFp?=
 =?utf-8?B?NWVkRXlhWldsWk1uVGVmR0YyMkt3akJ0c2dzSkhzdDRXRzFwcm54SEpkN2pX?=
 =?utf-8?B?T0dVQ1o1dlNILzhRNGlhTVhWLzJabFNURnRVVHZtQjdTVlRJNjVPUVF6S3Fy?=
 =?utf-8?B?NndBbDZzRWR3KzNabDU5VmlJSzUrRVRKSFBZbWVqaVFseW0vZ3l4WTM5dkFo?=
 =?utf-8?B?STh3L0crUnBHc29VZWNod1k3cTVMY1BOUjM3bGVlSDNTM2tIQ09XWHlVRUtC?=
 =?utf-8?B?QzVyL2plbmlGLzlMZ2JVdlBTa2ZpWmUrdGVqc3hDeGJBTmtaN1J3TFBPdmk1?=
 =?utf-8?B?dXFyRzVwMnltK0JHazhhMUg0cDJpRFViV042T2tOSFd4UFU1V2Z3M25YZGJt?=
 =?utf-8?B?M1FHYXpyNTlySHFWZjBxVXJuRm0yOGtMaWkvMFE1V3JqWGw4aC8rRkJPemJU?=
 =?utf-8?B?eC80Nk04cllqdERZTktrdnJkeWpGdFAzc0hhYlZWcituT3pLV1IwbTZtTVli?=
 =?utf-8?B?L1BpOVRmNHNHTEcrY2lyV3lROUhmT1RHaVRlUFZCaERySkFEMFlvQkRtUDVD?=
 =?utf-8?B?Q05ncDZ1MG1XNzcvMlhNSjhGQ0VUNGw1NlQwMVJ4SGdpZUMyZm54UDFoNVdt?=
 =?utf-8?B?Tkg3OW5WWlUzdG5WcXRlelcwNDZRb2NJS2ZhcUFGbXE0ZDUwRFUwU2FlMzVM?=
 =?utf-8?Q?b1+ZxJBfrY39hsjTgZv7/dE33?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z/Uyp7NQ5w+z+joKEXPqYEMZksbVvW1gw6Twd9n2MUjzKhky8StlXLfq2ffWTydTDC08YlcXp3Dk8kuxdVmUWvD13PS804p+D3Jba/rA33PVvsY5UpGPAjZbTrnBuVEFSHQHSdYtb6YTKLFOvP+4O/KCfG4DcOeGz76sSA7g61Y1sdTTqI/A3xJKFAF9uTAvqcOiZTwvsZAYVYulOBpiQa3Fd0Iw8Xr13SiibxfbuPfx/tkWbR41c7Kbu4n7iwvA8UVEFYtAh2FKN7bD71mze5u78HrQ9cx1BP1tpInkqMO4M1j+erhdmpEyA5OHOWz17Ufuy7Y6OGqD8MGaILnomzsdn1iopnG5ZIU4yvwRz//LM86Xp7oIixf+obRK75DG5ZePu7sbWf+SnhpUOYvQQXFS2dEtSPT/A5k7DWvLlUfRmuJE1POUNM7L6eSKFrX/VYZOF2yJC1cBpEtYGSqLfgVakh5zvTSsmieCI03gUuhN5jroEoLkEek22BpK/oS4ZXUqWh1D+OVfMrE68UueYUoijD6ncDKJwYVloyrWBFek3XqsiaLlA9qras4LNhD+7vre6dj//duw+hBV7tmnHNe/GmTu/WIUJX1uY1EZLfxgI9YiTYqT4F7b0VrkBBeeA6KiORXiqtVzYxTIzLq5fmkKzwOcpyolwmlYAw4Ca77X6y7ZYGuUQL+lQmh8TsKdUQVQKnhP3H3/ggejc5Ppl2v0aK5Pr47Rrn3mJz7rLoegh0sEwaCBKn940zd+9nDiViKWFQ41rkglkHMx/+dRo7au8LgNjetPhtg0oWHDFK4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c116db7-4e0f-4ff5-69c6-08db522f45c4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:51:59.2497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oMr0YUHJfEFLZrddAadlmzRULfIbQiQvculm03hFHh0jCZdeGpCC/idREC0AnUP7SgVPpkW/Uj06rU7jEArwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7232

Or else when iommu_intremap is set to iommu_intremap_full the assert
triggers.

Fixes: 1ba66a870eba ('AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 4ba8e764b22f..94e37755064b 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -240,7 +240,7 @@ static int __must_check amd_iommu_setup_domain_device(
          */
         if ( dte->it_root )
             ASSERT(dte->int_ctl == IOMMU_DEV_TABLE_INT_CONTROL_TRANSLATED);
-        ASSERT(dte->iv == iommu_intremap);
+        ASSERT(dte->iv == !!iommu_intremap);
         ASSERT(dte->ex == ivrs_dev->dte_allow_exclusion);
         ASSERT(dte->sys_mgt == MASK_EXTR(ivrs_dev->device_flags,
                                          ACPI_IVHD_SYSTEM_MGMT));
-- 
2.40.0



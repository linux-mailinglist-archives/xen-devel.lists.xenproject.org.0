Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470C26E4232
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 10:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521827.810748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJvT-00049e-ER; Mon, 17 Apr 2023 08:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521827.810748; Mon, 17 Apr 2023 08:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJvT-00047M-Aw; Mon, 17 Apr 2023 08:09:27 +0000
Received: by outflank-mailman (input) for mailman id 521827;
 Mon, 17 Apr 2023 08:09:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poJvS-0003fb-5z
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 08:09:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28c962c7-dcf7-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 10:09:25 +0200 (CEST)
Received: from mail-bn8nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 04:09:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5070.namprd03.prod.outlook.com (2603:10b6:208:1a4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 08:09:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 08:09:16 +0000
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
X-Inumbo-ID: 28c962c7-dcf7-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681718965;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nJKWWJiu8fJzuR/l1aOE4WNY5JuaYmW1hUX683p7PbU=;
  b=eGrdauDzIElV36392SLrV3ltKLPp2HbXIfmkcACdwo8Ki4zW9J1byaIS
   i4/nc4+a02tmrLKfqTn+EjM23NkLS3b7OTvsnjR2rEhRUZwcXmwEX7RKI
   tF/kzf+6YjJ78dloDGKuRZu0ZtWT3F5cRFzxjkfCCpEgzksUYDmun59OZ
   U=;
X-IronPort-RemoteIP: 104.47.74.48
X-IronPort-MID: 105674896
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3fpC86uiMR340VE7l3xwXEJGlufnVHRfMUV32f8akzHdYApBsoF/q
 tZmKWmEOKyLa2KjLYwjbI+1/U8Gu5TVzd5jSwM4qHtmFS8b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBCIsbS2jlbyK2Lu2W/lJieoREMjwM9ZK0p1g5Wmx4fcOZ7nmG/mPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oujP6xYLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXlqKE20AzNroAVIFpOZ2C7k/bisGu/HOlhI
 Vwk1QUSi6dnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ5iELJR9M7TKqt1IWpSXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodu51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:jdGmna3WUlku9oDHr7cE0AqjBa9xeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtj4fZquz+8T3WB3B8beYOCGghrTEGgG1+ffKlLbak7DH4JmpM
 Jdmu1FeabN5DtB/LjHCWuDc+rIqePvmM7IuQ6d9QYUcegDUdAe0+4TMHf+LqQZfnghOXN0Lu
 v/2iIRzADQBUj/I/7LTkXsGIP41q/2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbfyJTzawk+W
 3llRW8wqm4qfm0xjLVymeWtv1t6Zfc4+oGIPbJptkeKz3qhArtTIN9W4eatDRwjPCz5E0smN
 zspQ5lG8ho8Xvecky8vBOo8Qj91zQF7WPk1Daj8DbeiP28YAh/J9tKhIpffBecw008vOtk2K
 YO+26CrZJYAT7JgSy4vrHzJltXv3vxhUBnvf8YjnRZX4dbQLhNrbYH9EcQNJsbBir15K0uDe
 ErJsDB4/R9d0+cchnizyJS6e3pek52MgaNQ0AEtMDQ+z9KnEphx09d/8AblmdozuNLd7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeE6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSSAtAzWu4NjDqVCy/jBrOKBC1zGdLluqbrvnxwnOLyZZx
 7pU6gmRMMKLgPVaPJ0NkPFKt9vwEIlIb4oU+YAKiOzS/3wW/3XX8zgAYDuzenWYH8Zc1K6JE
 c/dx7OA+gFxnyXexbD8W3ssjXWCwPCwa4=
X-Talos-CUID: =?us-ascii?q?9a23=3A0YPwr2siERHZzBv6G5Kff7Hw6IsJYFze8VfCfXO?=
 =?us-ascii?q?gAGt4WJiaZ22s+bhrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ATcF5vw+BFqDT4GGBqaULw0GQf4Aw0Z+uOk9Wq7A?=
 =?us-ascii?q?H/PK6PzxAFBihqjviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="105674896"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVUEg0D1fj1HodBGpoFyN72o5rAp8seBVel8YNo5kiRwAtIuiCsekQOiVkd7rNKKWu3917W3Ofaax9XCRzlNIoql9eol4x/h31jHPD0q3+jAo2gW/XQPBEGhpjKdpe4mUY8MpTTrvIDQ2/yyUz7GKYTQz9h3VMcO3INUK+QQ7a9IhyJ8zcB+FcdWvRTwxfB21yXhLKWq1XjIbGmz00HPMRqHoWc8t+BYeChoZkF/TxLoCg2F4oLEPCdgFHR5L2FCBMi9lw/ZLFNbmcDaFlMBvWQQcUHX/keikALJD7EhTaNtvKteOzL4c4Xxfff8YfDtzpN6RrlUc6+BiWKssQ1nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJKWWJiu8fJzuR/l1aOE4WNY5JuaYmW1hUX683p7PbU=;
 b=F7ntzVVdOnEuuE5NSQy278jhw0dFVhVe2AznnffgMNJ2pTx6aWnc1tOQWhFY/D/Kqxo7vspFLjffQQu437xGs/XyQOCo757d8ZETzghHTHpmJRU55+pnqJj98RSqzNEU4z93dTRjPZoL0nZ6SHPFC1aqwlT2rLQAgXK70Jfgy3vshYLQnIKZgBdeg2a2H+V0L2rAwIPyiM/NdgHc6gNEafzxz3fkReNi+dc3spT8ouXFF689pwweFt7IS1FuWH8mDAReyfK8DM9lwtMcFQwHTKGsf0+U9joFC1DcO+kNMLKJAGPRuNOg6bg4lY3dhtFz0OKgduA6qT7x1AUyMQK4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJKWWJiu8fJzuR/l1aOE4WNY5JuaYmW1hUX683p7PbU=;
 b=xHbOQXXiNT/TFQKy+A1Fdq81Kt0dLgIiQ+nMkmrPUXjsMPtNAnkLpLreUHrAnVlHN1lQT9gpUgGaiGZp4cIKRCXvSQPr8hJo/usbIC/OEzD9qt5P6OhTuC3HWGHIigR620gJ9FPuUAk5f7OrslVnNGVnicA0owNMlcPN2pGklN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cc0b5260-d551-b623-3eaa-50de22c2d124@citrix.com>
Date: Mon, 17 Apr 2023 09:09:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul/fuzz: correct header (symlink) dependencies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <658f5267-9943-7c5a-2ae7-f7e40a15301d@suse.com>
In-Reply-To: <658f5267-9943-7c5a-2ae7-f7e40a15301d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5070:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f3cdcd-ed04-4a0a-1956-08db3f1b09c1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0IVWYiEvHK3RK47T/tZkouqvnrGakCWLqGaIF6WAjxJphRhg6rOJroq0C1R6YpxLymEdVAwcpIUIO6RsX0oJSTZas5zndXNVURTps70g0nbffa3AxonRN4JU26GuJ0gT54RkKd26C53MEVj3tCFrcJBmLbwt1h+aPEKIWPRtNW7+OkbiMUwmfo0tfyfUjy2E0HA+Vm59BMCoyHHlAq+SWH5qps3lLEXh1NLDVA16IlXOfI0M4l6UEbfrVPkXAmCMvTe3lNLMXLyT9Di0xgkK8NeGkLb5mwxwiyQ+OQi4Y5hISXcBm5lBARSRuInC3QuKA5wEh1yOrE0NgiZWCLkd723X/oDBut6Z7cTS0QChcsezqDDxA3PSy8gRk/whTsr82GBqxIBCBcH423h30ii4QBca2fzIjZFI0xWE956gcfWF04tGnJ6nByKCnI0D8bTjWWh9dmphMK7kmo9m0etQJDEXepxhrhuypCFtTq/BCPjJNLg+va4tJVL/5IlGVH7pzEuMYqYKLf+NyYre5y/FCf1NHnuLY/AJXvPDEAxj+/i/OUcb+TL7cQwd29415SFkgceJ1zdlCIrRVwkUbzL8jUDFgL2L1sABrqkStzIIgZr/B5/Rxlbi+GgYB7OZ+FwGv4QDYha83SEGOiX26jvN5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199021)(54906003)(110136005)(31686004)(6486002)(6666004)(478600001)(41300700001)(82960400001)(316002)(4326008)(66556008)(2616005)(186003)(107886003)(53546011)(6512007)(6506007)(26005)(66946007)(66476007)(5660300002)(4744005)(2906002)(8676002)(8936002)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTRQOHFJWmxsZnZKVWk5Y1EwWlZ2YllsTkswbnh2WXZjcndOcCtpa251M0hM?=
 =?utf-8?B?QXJKNGlxTWFSRHY1blk1QUhZa2hNaExsVEhHTHNLdzVaR3B4cVBjc2FUZGZr?=
 =?utf-8?B?em80c0hkUUFka2NKMkRuMVM2UVVEaU9HMGNqZSs2UUk2VTRPT3JKNm5HQ3d5?=
 =?utf-8?B?OGlFc1Y1ZGFwR21vVjV0eXhsKzlaaTFLNHJtK3NNTHVrRVo4ckxiOXVZbytW?=
 =?utf-8?B?V3JybEI5QlV6aFVMc283azdKSGIvU2wxa3BUbWU0YTlETCs5dGFqTzFEYlJD?=
 =?utf-8?B?c2w0ZktEUlNGc2R4bjRlMTJEQURnTFB0czFnaENNOWg2b2hXN2dLaUEzRDJl?=
 =?utf-8?B?TEhheWlSc2VXUzdxaHo3MDZldFoyaFA5Tk9tM08xL201THM2ZFBPNlJlQ2dI?=
 =?utf-8?B?UE5SQjVjaTJWZ1BTZkRwY09PYitEZk9yaTd0MEN5OEQwMmlrOWFFMk1URlFS?=
 =?utf-8?B?T1FuZDIxNmNzdmtyazFLS2pqRjZHcnVFRzlFRU92T1ZwcWh2aFBYTC9LeElm?=
 =?utf-8?B?cGpOWWZXL3pVVWxGVElqOWlSYmU0YVZoS1VPRHJsYXVONTRYYVAwS1Frd0Nm?=
 =?utf-8?B?VXF0blBFekhBd1RaVkNZdUlLVDBpeTZERmdiZnl6RGZjS2ZielVhMUxCcDQr?=
 =?utf-8?B?SE1mV2FCaWtvZlVoSWQzTUY5RFhheFZ4WDNWQzBnVXByem0rMW03bXZWMkgv?=
 =?utf-8?B?MVNOMFZ4MnpOWE0yN3NRWXhieWtmMzZCTXl3NmxrTU5ncWhGWm1iRUpnSnVW?=
 =?utf-8?B?ak5ndTJkOU1mZFovZmVMWERDdVo2cFM0eDBOQUFFNHNCejczNWpxWG9RR3FJ?=
 =?utf-8?B?NVd2MUdsdmNuMjc2TTRxZHp5S0k4YTExeWtKZ0kvVVVWb3VHS2VTMkNtV1g0?=
 =?utf-8?B?TGk5bi9Sd2ZvNGtxb2JQU2Q0SlR5Y3lhRzE5TlBWK0ZVYUpjbkJ0L1hjbFRO?=
 =?utf-8?B?OUlyaDNhdXlLQnRlRytIVTdvZEIxT0NxcXRnMU1sMW1WNEh4L2tvR0xYQlZj?=
 =?utf-8?B?TUdFRitnNFlkYlViazVtZDJlaDd4cmhFcS9xTndwMTVSbHZNRW03ZjVJMGlP?=
 =?utf-8?B?ejQvcWt3dEYwRDMrbngvZDdFZEpoam9ES0NmRkY5Y3FwVG5NU1NoNjdPVUZV?=
 =?utf-8?B?RXlaKzJHZzBrZnRoZWJOVDJicE9TcVBuRkJiTG5lR3dEUGhFRis2VFVlWEVh?=
 =?utf-8?B?YmZkWWdnODRWdmZ4cUlFTk05blN4WG92UVpRdTNJdUd5akFnRmlOSjZVbmh0?=
 =?utf-8?B?MmN4bk8zMGpFOXgrVzcxZUhGYkZXcmd5MFFsdGtyVmFXbXl6czVnU3FOVncx?=
 =?utf-8?B?ODJkK1JCQjFyaUtib2FUUVdRaDY2RlpjSzk1TUw1OEc5QVNRTk1HZzJ4R2Jp?=
 =?utf-8?B?b3BFQ3NrblQ3c0lHTFRhTjNTNmtaSCtOZzVPc1ZIWVVGVVQrc2N5UEZYckw3?=
 =?utf-8?B?NDVPOXd0WFFFckNDUDVsdkNhYzRGcExsSVEwUjNrY3I4N0c2SythazRYUG5h?=
 =?utf-8?B?NVRaWUphcjI1N0poSDNsaXhuQ3VONjRqaTlHL3FCVHdyYk1SK0c2WFMwaW14?=
 =?utf-8?B?QjZjZ1E2emtOc3dmRXNZNGZtRmo0RlNGeGd2RWcxQjdNRytHMVZCOUF2SjRW?=
 =?utf-8?B?N3ZFWXkzVFR6VVBJbVRUb1pWaGx6dUlCR2pCVWhXeUJNNTdad1I0ZXhlYkVV?=
 =?utf-8?B?aWU5ZDB3Z0lxMW11TEJGUVZBQzNkNENSWG53TElhNkdNWkwybE1mQjZvWUhh?=
 =?utf-8?B?Y05BekFNN1VSK3dHQmk2L2dWcHc1SDlOLzkxV0J2dHpBd1NLcC9oNk9NdUdm?=
 =?utf-8?B?b0wvZTlEU1dybklYc215cjRlN3lJZ21iR3dVeXR0ZWFWN1Vsd0lYTlAwZ0hx?=
 =?utf-8?B?Nit4THg4Rko5Q2xhcm1NOEFlR0dpSDBIOGlzRHVqam9WZFQ0UWx1NHRaQ0ZQ?=
 =?utf-8?B?TDJDRDEwV3NxNzZFeDFQRldhSHNMTFlad3NVbEd6QS92RW03VW9JSzVHMzRR?=
 =?utf-8?B?MDc5QU5vZ0lOYnNaT3NxTmlRUEJHU0FjcWpBdzkwWUx6N2REYjltclo1cmpQ?=
 =?utf-8?B?M1hqaFJ6VUp3eDVRUlMyenAvNGZXd2NpMVNpR29qNzk5WkFaQ0xyV0pFOFF3?=
 =?utf-8?B?L2lJb0xJVHhzRlhJbTNwT3p2MnFoaWgxOWFFejJwNTJKNVh3aUQ1aExvRFRV?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cCiWzp7IV9e2D7YONOV/6wms1i5KHbelHrl43cL6KBfrEJcFiP6QCuNk++ifBvRz9UcFjTGLUDOSrQMbr+SG5xUvazx95ktnjTfXZ2lkyKl9RUIBG9Mdf/VU8vkw9Kuc9RhhD3+epsCm5NyRZPsvhpIgTyWU5Gtq8pJ1WUeJvtkwge8uuY/juYCQq8xIlZQ1eTsIYN3JLn14bF1TMpJT62kd5xH54mGZ6w5N0bATFqoQN2dFRFqW1CKw0n2lwJzNHnmcjO3AbJBXeeClD+uV8pR2IcMOz/1zh+e+UGOBLkBjVqSIyy3lYFwcJU+sII2ErLDYE4euLaYi7L01JbzW1J/79UK+QKP0fFJv7PdOQVGkpEwBKHoDid/V1cDlYF/EUxQbDDLZ/y1nP/TnNVWU/8WbDQiJHK46nXgEAX3Z4qeYmUO+LwlYiTk9QNzDXwLoB/3zEyEjPOdm8Edw/H/dXSQNl12HbMkkE1um18ZQtkViQcDTxCxinnmmR11H3ZYDoPbO/8PC5tfiiAzf9GrgnM8Ml03B2ZZ6jQ8jwd06AlboCbIQrNq8Vhiyi97E4mpJkz5+UkGIv92qWxkb7Ny9GcR63kkL9tRCVYzLpqykN2whPihY8l6XP6UK3RS16+o5NESYY16iYmaR87dIaqIATHPaPy+MutC2KYWlgOJYSIrtUAXW7B1+70gLOfj6uYJ4tIZV9Q2BgLHyzs3HpC457b4rm/Eoe004wgKRJJiqo4hnZrUZVCd86ViYk5y0fHFcyUMmHU6PtqIcePVNm5lDUELslXlsa+aKo/4yiO/Ue6lxo3rfgck8WUhI8VQtu4Fw
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f3cdcd-ed04-4a0a-1956-08db3f1b09c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 08:09:16.6008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qK5g4lKFqwEjl2vokShj2pivr2Cz5lqApSzUv3HSYCUn8HdviV+45J66J2yViZ7n1ls5Ot6nOKa868fAEL4hRgmJz8sp9+zxZXiglRSVJ4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5070

On 17/04/2023 8:54 am, Jan Beulich wrote:
> A use of $(x86_emulate.h) was introduced (mirroring what the testharness
> has) without realizing that no such variable exists here. (Re)name the
> variable (to) "private.h", which better expresses what is included which
> way.
>
> Note that because of automatic dependencies tracking, unlike in the test
> harness no $(x86.h) variable is needed here - we solely need explicit
> dependencies for files which need symlinks created.
>
> Fixes: 9ace97ab9b87 ("x86emul: split off opcode 0f01 handling")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE885B1A1C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 12:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403077.645056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEuF-0002kP-4C; Thu, 08 Sep 2022 10:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403077.645056; Thu, 08 Sep 2022 10:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEuF-0002i8-03; Thu, 08 Sep 2022 10:37:11 +0000
Received: by outflank-mailman (input) for mailman id 403077;
 Thu, 08 Sep 2022 10:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcJ1=ZL=citrix.com=prvs=24360eeb6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oWEuD-0002i2-Hm
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 10:37:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f45f08c-2f62-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 12:37:08 +0200 (CEST)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Sep 2022 06:37:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5333.namprd03.prod.outlook.com (2603:10b6:610:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 10:37:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 10:37:03 +0000
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
X-Inumbo-ID: 2f45f08c-2f62-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662633428;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Z2Hfaqj4lRLqkKucv15USXRiZN+PUMQ48swob/UWc3Y=;
  b=VqMMJ0ZGXFB1NLQTEdWaplxaUqIgZvZ9c5ra/o+BGiljnwOZfRX7IKSV
   7TEIQ58tZFguwtVVaDpMhun91r8bSFdClSsItcNTk+phmwfwfMU1tU1mC
   Sh5cbADR9KHdNITf29HHbZAucVP9B0nRXoMlkMbSuxcgmgQs07DBAxisr
   U=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 80048305
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ATNjO6K2i6xokmx1WUPbDix16xa8BPHBdZdB5h?=
 =?us-ascii?q?dg8DyJ0ofsy17SWlPg9Dm+OpEbNEGCloGxUELxf12oI5UW6QaFr5uuB5u7b/?=
 =?us-ascii?q?R11eHcAu1UiAY0htHyPgKxaff2+K33U7uuNKlXwDMjRABC4dKNYs8K9gqpuH?=
 =?us-ascii?q?WUJGWxhvuGCSAPKRqGFqql8ZfQfDDiUskzsGe8CdQ15AD8CWdTKagDRyr5lq?=
 =?us-ascii?q?Fm9Xv4jAuh0HjX1mxp3lwUx+e0gGvNvBKGpwXFvN5v/Vl5NU/tx9Sq9aeyPT?=
 =?us-ascii?q?KUBSk5vz0M9veEiNqSwXhgo1gi8u4eJDVmEBvnPN/4NJ/rjePDSf/JrX5JbE?=
 =?us-ascii?q?yVwCTu88q6usuZX7Z561C4RkmNsaUqt+C+M+mY5gkKLyuuG0MeX367+vva9I?=
 =?us-ascii?q?FsN22j6PjdabbjaK/JKiVL0693IZ/lvQ3BGv70MB63BOfjor11hi37I3CdqM?=
 =?us-ascii?q?MfPrcrgcWvJqMaEkWPn7Qb0af1Pa0zS/RZS0cIHmDtNA8riRFT/K7favzabD?=
 =?us-ascii?q?lb1HAWpIqpSxDiz9GiotQL4dkXgl5SNGYN9f883Vug6PtKFsVO1Y3+tbZQIJ?=
 =?us-ascii?q?knsKDHhFjQlw9n90m2sgaj1eP5l6FiAgAmkFZ8Q8OOv2RP7j0drfRLOgSHdI?=
 =?us-ascii?q?G+PMkzHzY80bSLIV71T5efd+obP9OxR2b834+3kZhEInKW/08ECQy3cVDjqe?=
 =?us-ascii?q?OIFlbjD6uz+GosnHhjVbH1fDPwacs4+7KSLkViZI6NTxoUYnl1FPUSF+sFiZ?=
 =?us-ascii?q?UD+U746dJIvvXMVrXpRpkNGoCA5TcyJRSYo8lpy150yg2UrL7zK2BB2EVqr8?=
 =?us-ascii?q?VLQoH/LQHQBR92y2CZl1wedxIv6KFPHljuqswY7sbVPGPmklGa648XVwYBHU?=
 =?us-ascii?q?iJwUP1joDnaVrk9yWTyopgLlZITBZXM9XtQfsib+dajbgECcA7G7aSsetmh1?=
 =?us-ascii?q?JUkGUcV6M5ttCc8i+2XfOz7HnJowGDq8NKdWs4AkfR0iDPBHT8hv7gJaOGbc?=
 =?us-ascii?q?rEGcsLm1C2iURIvdgi1U7vhVveeV5bNBVGxTis56fy9lLWEA6ZZXmK8QVFbW?=
 =?us-ascii?q?Tf48gcRhNFfaMmlzChbVbXcBOBlpOfIuekvEgR5c4yW04H1ufCZoYffwtpUa?=
 =?us-ascii?q?xE9QkEDG6l1lp+uQpcjDh8ZGm7OXTix7ni9RIINnp42AktUHTHuIObFv1yIX?=
 =?us-ascii?q?rJJl2TCoyv8pcIBYkvZDclo31yelzUjuwSlEYozRUK49rrZLl2YdA/GGmIux?=
 =?us-ascii?q?47Fn319EChVuJTD5wZgt6g8+OIoO7D8AjRrPoak8gHKQFG4o3gGR6UIsxRaX?=
 =?us-ascii?q?3UUgoMdq5NKfcmPrVnVB6EEdGwgQXIYP8w+fE5Ls8IUIo/6bcI4I34Gv3z9n?=
 =?us-ascii?q?P614R9IFewTqCQkUKLrwdqW+YA16FTlZyJGn15rEI0f8IcXffOLh4Ik3oqXq?=
 =?us-ascii?q?08HYP2I4CX22eJvKh31A0292UX2/cURsipm3IviJjdvytBA8kC+04ygHZAhX?=
 =?us-ascii?q?WnL3Dh5L6jmJdATRqIUH3x175GcidksVko9aZ7H3DkC0tyf+jY//iJc9xytX?=
 =?us-ascii?q?ufPVHF3WkHoNpx4goudw0sdBz/9kd1l9hZFa0EtAnMVMxI6TlenDFhHeY99w?=
 =?us-ascii?q?X59K/cbNE+vwqKgu4Yn91+4nvb78L0aBFWFuOqHVKi7EGrl7nPyk6JkWBCli?=
 =?us-ascii?q?klJ9L3F6h1vrpAl2fVXjyIZk2kOsFdYk9PH9TW10UD+kY16h7rhpuAMGJi/E?=
 =?us-ascii?q?26xJKAAEnCkJ3S+bpXuPQpXDeQeXaDQA8t719LBJTEEuuA/rgUqtJSHOE8K6?=
 =?us-ascii?q?0fJ1OYP+xEcv8BJBXZrxFzynNgOzGYexXPhE9uldpeZ2d1KX3CPCz3k3sQ7k?=
 =?us-ascii?q?Q9/GjaAEnd2v3o4yCpoWDlEmThFlSko0HtfvTsasrN/WrLhs/mVwH6xUTZXi?=
 =?us-ascii?q?Wx/wMWlgSqlvcKrLf1CnFuWqdAFk0/QvjXYffOpJoFa27GBkv/7FCWTiNceC?=
 =?us-ascii?q?i2nGCGijn7RVk2VBbX7tCQrL18NU+TA/F3VEU0hO/QQ9hWBkE0/GnZRPTwWN?=
 =?us-ascii?q?dx4tL9StKkq8f1nc/QtAXOBQ4AFK6GcYoagC6wmEFcMoDdgekYDxb85YQfFG?=
 =?us-ascii?q?ypUNwopDDrrF2LQTuIlKtJNH0gT+XNEARtJorQUVlhYgW8sPWz0VFFxMrLAC?=
 =?us-ascii?q?RhwmU2PRAFWRjx250RGK3fsGF6CsBdDSl3nVRnDKGQx2SwPW+4HFvO7VZ2mb?=
 =?us-ascii?q?BVoF8t/VaiLvf6i9KRUUzt5PdWbqMW2TRauYwvG1t00NC9/OHrVOL+Fs9qUu?=
 =?us-ascii?q?ejeHqSStDwKhBpFhvphYTzJIeXBIotfpGMkK2LbLbeTI5SrDuLwt+gsphdxc?=
 =?us-ascii?q?nn1xTBDP/A+worL7psbaBXNW2RHb3cWz4ichYg5uIE+t8/dWdO+hhXBrK3X2?=
 =?us-ascii?q?GkVOttIx9fIoOFSfljhQgADqN0QSC6Bsy5c3M9grt57D2/wVl4y5UMjLUH5h?=
 =?us-ascii?q?+4C2EFH7YVdP8CP6x+Gfm4omwn6aeRw/cfMaddjj1vCIq/EDfVj1y1QAGRxz?=
 =?us-ascii?q?B6DUvKjJIykqBafmzoySwA/WPJfC03DDOed22iBzUltStipnx+oAex6mQu0n?=
 =?us-ascii?q?FMUp8VtN3R9KFrA2ixC/qFEkOVpN19dxq6m7hLgx3Vx1A=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,299,1654574400"; 
   d="scan'208";a="80048305"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEjABSNWzksLrP4szpDJzagfanM5LF2u3uXZo35murC4rc/PHeFs6nMQagUrxOb/HmqrzmI6aQ4n52sg9EGJHeXE7vgz3SuQSadBTxDsQs5mRHT6JQatsK+Y7MtEY+zTgM26DB/MPl7IJfrP0uRxxGqd3M/w3YOO42KHJeYHXBroukQZPuOnihROIjBt/Q+aXZdg51ET5LHv4cIXJWwUVtkQT2KjPsqSaZqMs0e5K8s60ZqDbWVbrzKpigU1SlgEZDLSaQM0/1l4DdvevGoLcan6l4FvbB13gU5UFU0L8doiGP96g7ytMA+OQcw4sRlEtj0ZrwdubXrrR/URGptKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2Hfaqj4lRLqkKucv15USXRiZN+PUMQ48swob/UWc3Y=;
 b=Bab21K304+6mBGBgwj1M4tjSjoJmzfTdaZu0JDhog93M1rYrfanhNS3aaNs44qSmN7DuPPcDjzF7V4wcyN6a+4o1MnK8PLfDq0Tj0OIZ/N1DHe6UJM5S3ENdmJfYqlNdngc84f05RFZ08waf9xU+V/SmQvNEvi0OIwruTqC2j3nDB1bsKqRwvuawDWMXh8FhTMPq6g+DUFi1inq9gMqpOi6AgW2kN72i2rNzlFJfdDxCr7Wi5GaaXfL0Lqtvpu44fwDuT21VwGejiQgy7iG2EbZ90oIxxCFqfM0VPYPOWk/vlPDob3XNwnOIWyJpxgwisvAHJ2OlQgM0f6mBxocbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2Hfaqj4lRLqkKucv15USXRiZN+PUMQ48swob/UWc3Y=;
 b=sbgn6QgWeBLOJfHU8LYfQ6jPdA+jUq4o48DCucEM5cgsAtTMAPAMpVEwIQa3qcYEg9C5rWiQXh4SNmFaLQ287z7OLAj+bLHDDTkahTseqQviRoBDGQ8XuOKC/fU31N4dpsmxOvPMIXL/tzcCicgYKIiU5pgTOPkFVcLLjnvTbkA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Config.mk: correct PIE-related option(s) in
 EMBEDDED_EXTRA_CFLAGS
Thread-Topic: [PATCH] Config.mk: correct PIE-related option(s) in
 EMBEDDED_EXTRA_CFLAGS
Thread-Index: AQHYuFK+wB8KiYBTukKYWomgtSrgPa3UHOaAgAEF3ICAAEp1AA==
Date: Thu, 8 Sep 2022 10:37:03 +0000
Message-ID: <f1319763-83d3-d973-c05e-f2180bd9a9c2@citrix.com>
References: <68173fe3-b3dc-224b-c30f-719efa48fcdf@suse.com>
 <bf2cc299-6de5-42c4-2711-c13cf59fcae1@xen.org>
 <08f233cb-0586-1845-fd67-030eb8c4373e@suse.com>
In-Reply-To: <08f233cb-0586-1845-fd67-030eb8c4373e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c31245d1-f8f8-45d5-bf4d-08da91861190
x-ms-traffictypediagnostic: CH2PR03MB5333:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dgOh2oYzGLS7BoXHCegnSQ0l6gJoNHYj0Bna0iutQ6Z5CVrCZIAQEzGoiPuvRwkA3Wk5CL7zC7IWmlAaL8JMsdHXyG7i2ObRSS3CqElFMZqXfS/OK4o2nNqAE1bbUMJaHtr7zvxrQDtjCdYDYz2DxGesKctsr70cMXjfw4TiRZp4xMJnxrnd1g583nDpwBJJ+V+ZN0rCgrtXbSKuMi41zfGL0iZwnSjM0AK5TgLbrwwTNOmxUcpqc/8R6/0sYJ5UtGb8yBvSUT0CCztKju969dwoi4qwE3mjWUyMSNCAjHtlGnV5fU+mBXFkyoDXtfPtmhihlJJavvPo3/6f6NoTWP+phA4gtD7Dy4I8gmZTnjR9Ujt+9ONA4Y+bUNGpBiYcTzOO3q6nTZrssSZO51OZD4qTVcGtPWrh+xwpxvB9E9MIPBBET7dNMONmHZk8//wQaU7spAfkdhlHO0Cs7i1kwNNrRZ6JEABScjBbeeM+mCCvrOMa4RrTdVOKu8bbInC2DDxgihmWAtJXGPlilng1+g4V6Bmu48UcBtHazLxVaFlK4Rs4mmvApjZntEaS5a/VT6OnnTca72U5GNNd2sVVsF04BayS932Qi5pcpxr7jWcaF6stUu/8gD58bvl8DnhEJtDGhCgRhUr3qxHpY1Jm8nQKUx28f7BV/u38XdF4N6wrkIhzaRfPW8Trs4AQdMsuaZGmU2RmUj51suwn7la5OjuaUiCboybqXe9AKt5fgavA1H5RnyzAuR+xM4f850wDGeMq1nAni/sQuZIRQub5g6Zjkt1C5oyTQ3euPhtUBWyWo9F0IBvoso5y7RMDQetpRX2yeL7nisFHCXGNxwl5BL42wYDD2xBfxNMvNtlQsfw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(54906003)(316002)(110136005)(31696002)(2906002)(86362001)(66476007)(66556008)(64756008)(66446008)(8936002)(82960400001)(38070700005)(5660300002)(66946007)(38100700002)(8676002)(122000001)(4326008)(91956017)(76116006)(36756003)(2616005)(71200400001)(478600001)(6486002)(83380400001)(966005)(186003)(41300700001)(6512007)(26005)(6506007)(31686004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHgwTUpOdStyNU5taEVPenB3SWpCOGNXTjlLNzc5dzlySGQxM1RtcklnZ0g1?=
 =?utf-8?B?SkNyaGpEdkZCTjVtSWpweXFjVHhwSkMzeTJMamlNU1N0L2E4NDJIR1FOblZo?=
 =?utf-8?B?Z21JcjUvWGZhTUtmSlhnaEEvVXZkemQ4Q1kzYklIcy9Va0VBL1Frcmg1WlpG?=
 =?utf-8?B?cmxuWFVqOTQ5T1JtdnZ4S3BOYVlmNHdGNjdJZ01lRktMSGN3QmVDZjNHdTdz?=
 =?utf-8?B?OVZubXZJak1BVmsyY2lLMGlzVVA5S1NCT1ppYnoxS3hNaUxhV3J0cS95UDhK?=
 =?utf-8?B?NXQyVU54bTBUOGxOZWowdkZkdHpJZHpZOUxYUU5TdTQ3NmlSRFNURlo2dTB4?=
 =?utf-8?B?MisyTVlvM3lGai9KemN1UUhxUGFZelpZNUh2QUNPL045RThrV3VzRWtZVklu?=
 =?utf-8?B?aUgrOXN3Vk5rVzZNcVJrTGFleGZFa0VOdzdxeGtYdE9tREovY3RWbGE5Skha?=
 =?utf-8?B?ZGJZOEhUMDR2eHNkVUs0cnUxZ1RIbHpka0RwZFlQZjVrOXJMMGNHb3pTNzk5?=
 =?utf-8?B?UnQ4MmVleml0OEF4RGNwd3E3VlVYMlFJN3I1MFNnM2gza1dWd0tmL2dKcHVJ?=
 =?utf-8?B?a0RSM0o1L05VVjNHRUhGdUlWR2hSZ2dEWDZ6WmZWRVNubkxWZkRsNHM5OEZC?=
 =?utf-8?B?RVhNbUZ6ZU96N1V0cEF0dGtFWk5QQ3lNazdhUXB0OXlUT1BTSjNZN1NOeFNG?=
 =?utf-8?B?RVVTL2pOZ2w5RVBDVHZXNkgrbVE2TUhqdEdRb0FmWVoyWU94bFVFVVhTKzNu?=
 =?utf-8?B?NnVVNllSOEI1dWVMTCtMalZWa25sSUZxenZFVlFlY3dxZnE0czV6NUo0MmZG?=
 =?utf-8?B?bWdUVnFTaE9mZ29LSTM4T0NNalc1aCtTR0U4cEJUNlNTQnZvY1k1d1d3YjZD?=
 =?utf-8?B?NlFicmpHYVBHR29wSHB0SmEzK25nV1BOY1IrUE1qWnhncjhuSUxTQWZnQWF6?=
 =?utf-8?B?VXpXelBQbi9OSjJvbFJqUTM2a1hrT0oycGFrNTh5VlVYaUdLZHhIT3hyTlZS?=
 =?utf-8?B?YTBIa3FURmg5U2xoOGtPNnRlTnZhUllPL3BuS2hMTktJUnNXb3JIaVdyRndT?=
 =?utf-8?B?RjI4bUlnTDdFV1hWNENMek9pelVPR1ZlUDZiVk5mUkt3akNMVVlLZTBDejZ1?=
 =?utf-8?B?S3ovODUweTdFTExtM2NOWFpJS3drYlhSemZ5YVVtRmkzdW5QS2liQ3hVUGNV?=
 =?utf-8?B?NGVzczFGYnNnK0J0N2E2UWsyZzd5NlRMdC9qanFBUjdNY0d2MDJZdEtyMkR5?=
 =?utf-8?B?bEZqMWJub2Z2Y0pmbDJHRTNKai9oWkVvdmRlQmUwZGFteUIrS3UxNVpYSEU2?=
 =?utf-8?B?VjR2M0lXYTZNbDlWOVV5RGU5TjNkRmtPT3VBN1Q2YWFyVWZPL3pSNTI1UGRs?=
 =?utf-8?B?a0NqVnkyUHRMaGEzcFBrRnJXTzFHejIyWkdLcFhtRHFUdXNobDNhU0d6cWcv?=
 =?utf-8?B?dy9tM0F5Z1dqbWp1S3Y5WDJpVW9LTDRNaXdSRk9RRk93a210WUNRNUxqRGtB?=
 =?utf-8?B?d3VlMyt0NC9LKzFqQVlnL24rTVIwRnJyOXZTc0NUWHgxa1BkWldhSzZKcTRN?=
 =?utf-8?B?a3BXdlQ0TE1mUVhFWiswb1hoTXhETGtUY0Yxb3Vad21CY0RMS2xacHZmNGt1?=
 =?utf-8?B?QjJHTW11K2JIQmZmalE4REpNdmduOHJlQTZMa3FUcDlqVEF5Rzc2eW0yaDFD?=
 =?utf-8?B?S2huU3hxT0dQdkR6N09PRC9YYzMxRWl3Q2VydFpXQkw3bUFVNzlqK1drZ3lv?=
 =?utf-8?B?QkpHeGE0dnRwOU5SVVVjQ3ArTlN6M05lTEk5cmxuVmIzNGNBek5JUysxUFcv?=
 =?utf-8?B?Q1NIMGlzd2x4NVgvQU9rby9GdmdGTTFqWEhhekJjR0haWm1VSUM4TlI2Q1hP?=
 =?utf-8?B?WjlTanRNa2hFQnlFV0p0THF3dlRIUldmNk9rQnRDVWZqSHpKUzBMYkF3K0Q2?=
 =?utf-8?B?cXFXTGNVUThYS0JacGg0ODVJZDJpZzg3YVRlRVRscktqeXN4Y2liZk9kaDNE?=
 =?utf-8?B?cS9TczZta0s2TEtkMnRSaVZqa245SW5LNi9TWWhGM3E4bjhkWFdMK1VYOWcv?=
 =?utf-8?B?VWNPM3Nwejkyc0RGdXNjUWtpb25jbjcxUWZ6V1o5QytkdjhMYWw1dGtjTWp3?=
 =?utf-8?Q?3r5airc4b+sk9Qwf5lDG8yXz4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A8318E7392C604EAB2D7168CCE47142@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31245d1-f8f8-45d5-bf4d-08da91861190
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 10:37:03.2065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIOYGWPTbaNvi/CdXLr1nTK/X+H8jHTTzQddZzYWboGJOdWgkPa/HqAXjeRgMEE4bwaKXVvYhry3vT4nQEi8h7V1xm/BzSuY0CcbL8yNcCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5333

T24gMDgvMDkvMjAyMiAwNzoxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjIg
MTY6MzMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IE9uIDI1LzA4LzIwMjIgMDg6MTcsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+IEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gZmluZCBldmlkZW5jZSBv
ZiAiLW5vcGllIiBldmVyIGhhdmluZyBiZWVuIGENCj4+PiBzdXBwb3J0ZWQgY29tcGlsZXIgb3B0
aW9uLiBUaGUgY29ycmVjdCBzcGVsbGluZyBpcyAiLW5vLXBpZSIuDQo+Pj4gRnVydGhlcm1vcmUg
bGlrZSAiLXBpZSIgdGhpcyBpcyBhbiBvcHRpb24gd2hpY2ggaXMgc29sZWx5IHBhc3NlZCB0byB0
aGUNCj4+PiBsaW5rZXIuIFRoZSBjb21waWxlciBvbmx5IHJlY29nbml6ZXMgIi1mcGllIiAvICIt
ZlBJRSIgLyAiLWZuby1waWUiLCBhbmQNCj4+PiBpdCBkb2Vzbid0IGluZmVyIHRoZXNlIG9wdGlv
bnMgZnJvbSAiLXBpZSIgLyAiLW5vLXBpZSIuDQo+PiBPT0ksIGhvdyBkaWQgeW91IGZpbmQgb3V0
IHRoaXMgaXNzdWU/DQo+IEJ5IHJldmlld2luZyBBbmRyZXcncyAieDg2L2h2bWxvYWRlcjogRG9u
J3QgYnVpbGQgYXMgUElDL1BJRSIuDQoNCkl0IHdhcyBhY3R1YWxseSBmaXJzdCBkaXNjdXNzZWQg
aGVyZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC83YjEyOWEwMS0wN2M3LWU4
NTYtZmI1Yi0wYzdiNDRhOGRhYzVAY2l0cml4LmNvbS8NCg0KVGhlIHJlYXNvbiB3aHkgSSBoYWRu
J3QgZ290IGJhY2sgYXJvdW5kIHRvIHRoaXMgcGF0Y2ggeWV0IGlzIGJlY2F1c2UgdGhlDQpjb21t
aXQgbWVzc2FnZSBpcyB3cm9uZyAobm90IGhlbHBlZCB0byBzb21lIGFwcGFsbGluZyBHQ0MvQmlu
dXRpbHMNCmRvY3VtZW50YXRpb24pLg0KDQpUaGUgLWYgZm9ybXMgYXJlIHRvIGRvIHdpdGggR0ND
IGNvZGUgZ2VuZXJhdGlvbi7CoCBUaGVzZSBhcmUgQ0ZMQUdTLCBidXQNCnRoZXkgd2FudCB3YW50
IHNwZWNpZnlpbmcgKG9yIG5vdCkgdG9nZXRoZXIsIGFuZCBub3Qgc3BsaXQgYWNyb3NzDQpFTUJF
RERFRF9FWFRSQV9DRkxBR1MgYW5kIHNvbWV0aGluZyBlbHNlIGxpa2UgdGhpcy4NCg0KVGhlIG5v
bi1mIGZvcm1zIGFyZSBMREZMQUdTIGJ1dCBkbyBiZWhhdmUgYXMgZGVzY3JpYmVkLsKgIFBhc3Np
bmcgLW5vLXBpZQ0KY2F1c2VzIEdDQyB0byBjYW5jZWwgcGFzc2luZyAtcGllIHRvIExEOyBpdCBk
b2VzIG5vdCBwYXNzIC1uby1waWUuwqAgQnV0DQppdCBkb2VzIG90aGVyIHRoaW5ncyB0b28sIGJl
Y2F1c2UgZGlmZmVyZW50IGNyMCBvYmplY3RzIGdldCBwYXNzZWQuwqANClRoaXMgbWF0dGVycyBm
b3IgaG9zdGVkIGJpbmFyaWVzLCBidXQgbm90IGZvciBmcmVlc3RhbmRpbmcuDQoNCn5BbmRyZXcN
Cg==


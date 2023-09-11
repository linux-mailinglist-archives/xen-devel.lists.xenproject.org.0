Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8779AA97
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 19:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599686.935213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfkks-00025d-NP; Mon, 11 Sep 2023 17:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599686.935213; Mon, 11 Sep 2023 17:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfkks-00022m-Ka; Mon, 11 Sep 2023 17:31:22 +0000
Received: by outflank-mailman (input) for mailman id 599686;
 Mon, 11 Sep 2023 17:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwba=E3=citrix.com=prvs=6119d0f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qfkkr-00022g-EG
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 17:31:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03c983a0-50c9-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 19:31:19 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2023 13:31:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5412.namprd03.prod.outlook.com (2603:10b6:208:291::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.32; Mon, 11 Sep
 2023 17:31:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 17:31:14 +0000
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
X-Inumbo-ID: 03c983a0-50c9-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694453479;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XlDx9xJyO2+2E9wQM609HvLG1Z+0ew/N6ZhKWtEKqEQ=;
  b=OZmehEBNaITXld+hHzPxO1x6kXTmX+5Cn4B3nNYdtb2Gcq7N29cmW7Bv
   FFE8rvnTmYJtRMBSvlFwugA7oOtiqkd77UnZraSWOtvh1fPP427tYkcLj
   xWo5hvGmlG0RTk6CGnztS8ASzxaPrmbp2K+DCI9FY7h4GKZS3/4rtjHqo
   k=;
X-CSE-ConnectionGUID: M2zF8RJgTu6dfTumQeTs5A==
X-CSE-MsgGUID: 2n8S4VlWRr29wWuMJglKeA==
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 122304557
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:GcM+OqviZ8CzCxYsMYxVYQURXefnVH9fMUV32f8akzHdYApBsoF/q
 tZmKTqPbqzbZmb8KY1yaYWy8RxU6JDQy9M2TQc+rX0xRHka+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6HziFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwDWofQEC5pe2K3ey3RNVxg/0uENK2FdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4C9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTirKUy3ADOmQT/DjVMUwuA/ce9tXSkAYNAF
 FEx2CUqjqUboRnDot7VGkfQTGS/lhwVRdsWFuAg6QeK4qHQ5BuVQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAKKUcSaClCShEKi+QPu6k2hxPLC9pmTqi8i4SvHSmqm
 m/Q6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHY1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:XIhmdKsPWoOm+2UkOKCsLl777skDXdV00zEX/kB9WHVpm62j5q
 WTdZEgv3LJYVkqNE3I9eruBED4ewKkyXcX2/hyAV7BZmnbUQKTRelfBO3ZrQEIcBeOldK1u5
 0AT0FIMqyVMbErt63HCdGDYq0dKQO8gcaVbDrlvhBQpN1RGtldBtlCe3ymLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A0FbBhGt+nmxAhuEK7lUzvC536IsAKG/znE3yLHO?=
 =?us-ascii?q?lV2pndKCQcFKs4/5Nxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AY6IRKw3w+6LElrc/13i2noQzQTUjuaL+Mxwzlao?=
 =?us-ascii?q?8oZPVKhNtHhWSiBe6a9py?=
X-IronPort-AV: E=Sophos;i="6.02,244,1688443200"; 
   d="scan'208";a="122304557"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrRfGYlS+zyZrphmQZzCqJJFY8MUS+kO9W9/tJ2QLX6HeyceOISU0hBrdrsaJ759KwpVOVi4GsxVgyQ+EctikDlXR5/1NiBg7xU3VIfXC9PgEMzkt9H6ln7gHKq18666qKnJnCKnok1DJgWv37NKLc9+hFcoRaaalrbwJJQyj5oViuAECohfJn+PAZQ4LN1YUQF0INFxY/II8zrugu+Ms/yA8L3c7669SG5GmL7ZkBRqtbLNvGYAxIsDh6QwWZATAwtUl5QerCKyDbXUoQnmQTOmYzspB3Vz/ElDW+JENu1jTp7SFMPXUmj0E+5bZn1oQQqVtv8lZDH67CttNnWRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlDx9xJyO2+2E9wQM609HvLG1Z+0ew/N6ZhKWtEKqEQ=;
 b=F+2WE/V2wLf+gW/6iOyQeJUHpdIVPoMKq73WivA+6w025Bxbw9dJ/QxM7aJ+aTTOl4draeRrETtFwk+S35Sw8/Vl2W10z9xa2RNaGqwn7VLUFwAUAXguWrVPbGR93ZvBOiP6hjVQKePyxVqHMB+1e2yhyuQ6OquygtcCoGFDcJ1I/t3927EszsSQPvZBEGCp+HbUh8LmUV/qTubK1Im/SiUwnIsi5lbGoPcP+tvd9HSiXxpHeEzZI2VEMrTJdgjKDkLXJRqSmiW+BmO2AjrsVjLCrnLkMIdJnsuvVokOTPadXBBkI1g0Ozd1J4f9cDUTDDn6ypftQqVVirAWh+vwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlDx9xJyO2+2E9wQM609HvLG1Z+0ew/N6ZhKWtEKqEQ=;
 b=uRafvnP76rZFVzT+7S6ml/aBxMFLT+oz15x17SwGLGHeAdvu6Ye0RlcH/EdegK4AydJ1yA5i4MEGcXubUpx05S5tGwB8lATPEwuV/PiCbLFa14Gf6iU9T8MDVBld+HPF746mOaFe+80kudYUXappWuycjrfdXLkyBsrB6uCp3/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7e5acbd0-ae1c-8d7e-9f2f-9444f992417f@citrix.com>
Date: Mon, 11 Sep 2023 18:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2] tools/xentrace/xentrace_format: Add python 3
 compatibility
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230911160701.249853-2-javi.merino@cloud.com>
In-Reply-To: <20230911160701.249853-2-javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: 27715008-ebd9-42ed-651e-08dbb2ece57f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oSZ9yHquqtRQvOd0ypoeuEn7+JMEB/n9CbNga5zP5udObOlxBpPVIf9Bb8Ktsr/ovLEUNHGxBVx2xt8WcoXelbzSwCUm2wFyLVhYuzlTg/x0P8dVRjMgCI8ht/STYfQJLFc3rfQfvD9oAetjl3rdIQa22XloyS4/yFYvb+irmjE8KXDuypRUA2W5R/HAOWrPaN1Pq9ksCEmW0GreU/SJawzUM8KbBYV+8r0R8y5WQGvYSvRrPnHfL0GU+DDFqFDM2vhdsk+Jery2xSV7tOjtSQq4al0hbd/dKjYKAVQV/ngy3/PhuaJDOTSAtBwdJ3IlHASO/lKHfdbmzGcEip7FK5wDlEq7W9X0r1wwPfzeYyeVobMpwFJ0P+agrfT4Lm8YMB3u+YYq4w43vyl4LmSclNgNH9KrESK4XjTzEoi8ORXqfFd9nespjTYbRXEJoewmPsMGTYnNDKfgygWM/i0emMWq/iFqeW2ahfajqQcH8RkFrejlcJmPjp91h+z5Ma/pYzN/9twV1ecnjzbmdvbfMoIq1aNRjk884hoGfen5OO5I27Ox/iXf5Vi2DfK9QSV7kvMNGzvpww1Xo6jDaAsDL+UK7evqnWZC70WeCnAVEOh/oTmBufSDRBAeVACKxZq9/NhXoY5jGC7wfNMsFR3lxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(1800799009)(186009)(451199024)(6666004)(6486002)(6506007)(53546011)(6512007)(478600001)(107886003)(2616005)(2906002)(26005)(54906003)(66476007)(66556008)(66946007)(5660300002)(4326008)(8936002)(8676002)(316002)(36756003)(86362001)(82960400001)(558084003)(31696002)(38100700002)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0IyN2lpTXVOMmlCTVo4UkE3cDFxcm9sTGI4dG4yWWc2Y2RDQVlud3lhbllp?=
 =?utf-8?B?ZnZrRm9KR0JIYzBQRkgrd0hVM0Jzc25jcTBEd3dkVit5TFF3Rnk3N3dvZWZs?=
 =?utf-8?B?enNlSktLOTJKcy9uVkZPd0hNV2ErSjVkMmpRbS9OQmw2TmVNZFJSeDE3aUxw?=
 =?utf-8?B?N042WngwQ21ORDkwV2h0S282TUlnT0Fad3hSTUZEWllZTUxqekkyQnV6dWFs?=
 =?utf-8?B?SWVKTHk2Q3hkdzFYTGgzRnJWUzN6a1Q0QTM3VFN2N3hXRFF0ZUwvdGV2NVJ4?=
 =?utf-8?B?Z1BkUDF2SWkrUU0zRlJJRmpNQXd4aEJhdy8rRXRMQ083bGZNMXZleG93eG40?=
 =?utf-8?B?WTJHc2tXUytJWENIcUQ3RVBGWTBSb09zT0N1VGdPSkRRSVlhNzZlNjFDNXpn?=
 =?utf-8?B?d0tGcnBqSUpDcHBwK1VtVk4rOE91aWM4OXJLZFhMTVM4RldVaHI5SG90UXVz?=
 =?utf-8?B?WmxVRjNJaFF2RDUyNFdOOE40QUM2NnNhZ2VxaDBqeXh5RXk2Y2dVTXF3Tkk1?=
 =?utf-8?B?VzExenQxdTRBTlZIT25UVDUxSC9BeTVIQzlRbHo2SEF0U3RXOVVoK0pDZUdh?=
 =?utf-8?B?eUs0WUNQa0dudWZJSG12NWF1Nys1UHZmRmlEUWFVYjliSjV6TGRyampTdFhM?=
 =?utf-8?B?L2lPNUUvS2RpbFAwcVBaaWhzWmhvWUt4UlpVak9MUTFrVWpmNUxHQTYwUHJv?=
 =?utf-8?B?M1lzRHYxSVlVMklMYWNJaDFBZVVLNGphZ0FGaUhaeU56TUJjcVdLT0o4cFIy?=
 =?utf-8?B?dlVOYmEwaCtSVEZHamQzVGNvcVh1WHhtR2ZLNllnaXQxQUp1TC9VVTN2WG81?=
 =?utf-8?B?Ty9jNFBqcGtTZ3RtWnNBeDFndlRwenhuZWdLWTNFYnhtdHhwT3RINFp0YUZh?=
 =?utf-8?B?QUw0MXpNZThJOU1meGEzNWVmU0t0cWZZQmJ3RVEwQ3QwMHBjc09pOG9OS3E2?=
 =?utf-8?B?OVROanJtVitraVh0NXdqVEtBM1VKZmx4VFp6SDd4ZlBnekI1MUsxZkZSMjM3?=
 =?utf-8?B?eDNieDdsVDVJMGhPV283a3RHYzNwempySXdJelBRZ3RYTGVOaE9BM1RnZFk3?=
 =?utf-8?B?bnZnRWtIaGU2aHozN00rd3hvWmRjM25YMFRTREo1L25GeUgzTm1CdlJGTDRV?=
 =?utf-8?B?N0RONlJjMTlONzJSQVp5YW9jSjltL29idnpiRGtKclh1QnhLSGs3dy9VT2k3?=
 =?utf-8?B?Z3ZtWEsyL0luQmhWYmFxcWloek04K2dZTHBuRkVueGVHTTc1bWVyMFRiSGp1?=
 =?utf-8?B?NWt2V1ZSWEpvV1NUNnZQT2ptV2FBdW5xcHNYVWxDNVNSV3ozZDFMWGxtblVw?=
 =?utf-8?B?M1JXM1V3UTdIa093ZytTZzE5V0pFc1EvS1JabEpXY3dFekU5VklGRDhieG5I?=
 =?utf-8?B?eXVJUHRYODVqdHMwL3RWN3l0NU9VZmIyVDZrTzZVTVJPYjZnb2tUMXVWZ01j?=
 =?utf-8?B?a2JOZlRyUUduNkhLaFhwUG4wbkNXV3BnQVdUVURlS2J2SzcxRFpObERJekR4?=
 =?utf-8?B?VURSVHlxTXNadDZTeXc0UDFkNWVkZkpEUHNBanRod0RPRGMxWGRBZm5vb0M0?=
 =?utf-8?B?NDlPVnRCU0RMaWk5RHZkcDhsNFY4UWRpSDYzS3czTzZOYkRqRVZmZXhhSEJ6?=
 =?utf-8?B?eEpwZFd6L0dEdGpHdVkvUXhoOXpldmlSUE1Oa3MvNW9HcFZUNSt2ZWJPd3FU?=
 =?utf-8?B?L3lWN0lCeFM0VDdXNDRzL1NSb1ZDMUZHZGJWOUlVK2ZramJPbFBYemU0dmNB?=
 =?utf-8?B?MmpXbjZ6ekdJRzBhamhkWDdQbmdyL3RmQkJOTUF4UzNxT0RoQ0NKdlIyYkxC?=
 =?utf-8?B?U0MwTmh3SmdrbzVsZ1QwMnQwQXFyZUxEVHJ5TVFSTDJMdDI4YUJPcmlmVjk4?=
 =?utf-8?B?NDlNT0RRQzJ0dTJOaFNLcHBRT256RWVmajhKMGtwelhCMzNVeHpiVU1XN01x?=
 =?utf-8?B?bTU2VllaSXo2NC9UMjFnQ0xFRzhMd05MRDE5TVRoSzJDL2lPNHB6UUc4ME81?=
 =?utf-8?B?a0l4ODRmbjduVG4rSTc3QnBKVUpIamhycW1YMGhIaWttaFFmMDJxQ1ZscERi?=
 =?utf-8?B?cFNHMkJGWGUyU29nbkpCc0F3RTNhS0JzTDNnWjdnN0labTlMbGp5S0dMK241?=
 =?utf-8?B?cmk0Yk12RnBBNnBGVStsLys4aEtkVXlqcHRyWE5TWEJ3SzBQdkZCSXNjSXVK?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	58SbBMNde09H/xVA0h9LI0q/IeNgQ6V0Vfrrq4TKMqmJe9wlIslqNW1g61YW5YvE6SQKw8mHq1yWvtL3n3zmnf9WxQGSvUdI8Oy1ZCa5sKK2w3bMKUa4QK+U/zMja0CeKYH3RsTvufw69zRj6Pz/bdaiGasZ7cmCakZB5/DI1dvYOxuWQI3bb/9leYRc1oEDUbUmbBBTR4ZwIZJDkbZdu5M6crf6k8eIZJ5WTHLKJprORB2lF26vPlUmiOPpdlaWsy25QcOg6tylPsIezijvydHvRr4CpKA6L4O4KNkRFZg20HQoPA8ekavJv7cbcJbaw7gliO607R49Jw1X4pQAsuDte7X8pnmPRfS5L9tTeUfblh/EcVQmwIB54rCsMFpJ/fYjUjSdo4YPlRMptaPhpGCoNapQ+PTWAGhRc8F6hW5HBjZtHuTqyfN/ODH9x1IredjXHnfpI3ou/7e/I5RFGxwWpf7rnsjKpvBdBb9cqM4ZTUyksZw/449CoGbwTjCzXspaUZxVvjBf9nHMB0G+YZ8KEo1rjGHvbzBer8Kx8mqAjoRjpoQV67u0itJ4KR8qXYLH6UXKXKCAnB3xdhyJVBAw5zX6XGHrpeSNlWk6quWshK6NM1CCXniCsx8ioEknZehPvT0wsT4THwaz7SsTGcZff5lv4Oi29Qm55hMy8EEs3F9L9fivl3jJ6KUiLARIEynk4MBvD91HHqQmmqcoeMVvTc4RxT6+rdaM58ujd+Gf63ostdQ8udtgAW2kdD45OycLwHQCONwFZZ1MOFpDT/Yb2vqUldNdmcd7gat6AVbYKyAxdnePrwHMALacQh83Aw+SqF5WsCrvIhYJphx0qw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27715008-ebd9-42ed-651e-08dbb2ece57f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 17:31:13.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4jA5ovoQmLU7i/WB2TFy6EfM9ZZ02QAPGXylavz21SjSxu+fPt3r61i1X7fRni5RM3A25SLj4Ild9lTT4XKIRPscui+bbg11kYN1iSZzUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5412

On 11/09/2023 5:07 pm, Javi Merino wrote:
> Resolves: xen-project/xen#155
>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


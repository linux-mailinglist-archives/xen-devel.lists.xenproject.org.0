Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38F6D6787
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517989.804073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjihs-0005ot-PR; Tue, 04 Apr 2023 15:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517989.804073; Tue, 04 Apr 2023 15:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjihs-0005lX-MI; Tue, 04 Apr 2023 15:36:24 +0000
Received: by outflank-mailman (input) for mailman id 517989;
 Tue, 04 Apr 2023 15:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjihr-0005lQ-9q
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:36:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 726b7179-d2fe-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:36:21 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 11:36:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5263.namprd03.prod.outlook.com (2603:10b6:208:1f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 15:36:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:36:14 +0000
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
X-Inumbo-ID: 726b7179-d2fe-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680622581;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JUQAkjiIbs23B7Yu1hEhEOqPd/LPq69CwzaQsPDsfzM=;
  b=BXRenU5Fmb/3rDgTLX/+hk3NWU8j3JLhGirtck7MAtajg/SEUA073wra
   USYfbP2vAbwvMpIIpKLI5Lp9Fh9ZL39zvBGM0UzpxHwzGULzGcbInqYeq
   Ky+/j3oZj6MBpdIc2I4MC5UuGcJtvfiUHsDgpAjdJlREJTYIkNGF91FHj
   g=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 103085443
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wq2F76wSdAW61fmiSOd6t+caxyrEfRIJ4+MujC+fZmUNrF6WrkUPy
 zdMXzjSOPuDMTPwKt53Pti3p0sF7cXXyt5kG1NrryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRiPawT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU8Tz
 OAoKwkhVROKndC5y7aqcPA0rNt2eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANlKRODkqqUCbFu74GIQEBY2XkSCgae7tWGFHPdSD
 WIN0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptXm/oc6i0uVSs45SfHqyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CHhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:8A+cA6keXlnPWH97LIuZCLi5BnLpDfIj3DAbv31ZSRFFG/Fw9v
 re+cjzsCWe4gr5N0tNpTntAsa9qArnhPlICOoqTNWftWvd2FdARbsKhebfKlvbdREWndQttp
 uIHZIeNPTASWZGs+eS2njdL+od
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="103085443"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwnH+GSPsh06ycU4qxT6XUpBuRAhhrM6u7Wpp8caziK2Gv4W5dRG73YBH9dYH1jzLfh3stxd5MytEOEvV2z54zFFKlLiH7dceJC3+YnDRI2EObWh7li1IUureJDgA17XOzwXSLBL1VA92mRxPw6eGKkE4HHhvHDtyhY6esVpGwlSQp+Zy7AyukDCCwme+KTIjpOZyhOiTtWt8dZN43L7N1nLhy+ew6ok2ngichSBOphDKYUg7ILbGm1n8AECkhCNAo9u+x9oiGEhFOseqX1RhP9leORWzQyONtvn65NWmi4mYs8bbJJzCQDPvLmMaXkb8z9TwkwK3MtsTiEhtYP80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUQAkjiIbs23B7Yu1hEhEOqPd/LPq69CwzaQsPDsfzM=;
 b=eLuh/Uo+HOXY5dIE91PcpQtLKGuSvMECavazGr0o1nDqQGlAzP9TOEnHpNSgnZc3Vt4ivRHVJmAWt9qKe7e2ijW8qHTtfkI7v3i/wk1I3boATS38HZl8f0S3fRXrN6e+9MzkfK530mHetwTCp78/uLArq1/dbx1MM3oQlEfj01F5z08jMiOEtlhqG9YAdgWEI2PQNhQDsD7hTiHcvzP3Gw/vjhbMOSyU8GDgvL0CaIWt0ZYV4AImEJsOOOaZwBjXTL2qS5RFk53mfHuZ9alamGZJkkOmG93b2fhuFxJ8LxaWw0MgOYw2bwx/V2PHbwxb5w1uTinKHAc0MaGCfnBHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUQAkjiIbs23B7Yu1hEhEOqPd/LPq69CwzaQsPDsfzM=;
 b=hocUkkrP5dq4q/PMlcYfZiRAOdCQunsVFxoBtlsEHA2ObyK3KNSSnLgn+xW9hHK7NIf10KewtaM9W4ViTFFqiKmQRSAKFW+bK3a9gYq+guqroudfGyr4KeiVF276n1Elphys3x54yRv+kQpDOg5gEFqTf+4CzEZ88urrrbMhp5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f76f8bfe-e9ed-11ec-d0d2-16292e1adeb2@citrix.com>
Date: Tue, 4 Apr 2023 16:36:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 14/15] libx86: Update library API for cpu_policy
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-15-andrew.cooper3@citrix.com>
 <74e716df-b27f-a86b-a257-fcdc2526a820@suse.com>
In-Reply-To: <74e716df-b27f-a86b-a257-fcdc2526a820@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: f33def41-2bbd-46c8-f4a8-08db35225277
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+O8QSyb3ZY0c0qvgKn9ApdkQzwx7UrvJB+B4KcdTG5Oo+isabOJ8uc3lYwJD1gqlPH6XJD7rXbxVXNHszEq+4EHolsuCmlyjTqeyB3Qc3Z1JNZcUuJlWyMHE2xv1t3mItTFCgJj+M9AutOrvXJOHkWHPPVdlINB8zkGo4ofUomhCt75MPAo0WFIiCzF12ylrgrdVRh5iehQf+bzuJPJ1ifEATSso22+XqPMcKpL5AqO3IsWmkknjVkqKi+z7KSWvzAZroUSEJf/YRZf/bLW5lOoWj5SQ1oT6EkAlIQOhs8Md3JcVbqHsN8JyLEKO8po7EBuI//0rGTB4y3rbTlbYiQHfTGo6Pq38jI34BrNrYbwFFK6sxJMiO8BrX0Wwv9wyIBwAt3v6GtBwS9k7nWYurO+tbJ7WZ/2RJUpdqtOpOTk9/ayel7Ja65haQrfDdr5ujr9qNvsSYRRD5NOs7+uJFZq7drGv5Ab12cWwgoHQeyHvl9GWBw0FJQh0J69OQtWYdMwzYqVbHNnxnntBgMoFWHms40VN67BFog2R/vNfHokT3s33yKBVtyONGaqEFs9M0+MQTQXvI75dS1le2WP5IhS9q0Nx+OynvghIV4KU09H4Y7pfMTOtLMyWqD9Tx8sa/oaQJxdtu5n05mngYsvlNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(2906002)(31696002)(36756003)(31686004)(86362001)(6486002)(2616005)(6666004)(186003)(6512007)(53546011)(26005)(6506007)(66476007)(66946007)(8676002)(66556008)(6916009)(41300700001)(82960400001)(5660300002)(38100700002)(54906003)(478600001)(316002)(8936002)(4326008)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjB1Z2pOMGxMUkRuN2FHU0JYa2NMUUdHdUdHWlNXOUMrWWxFdjJ6YktCNFZZ?=
 =?utf-8?B?b3FONEtGQkJuRVQxL1I0SVg1LzhkQVEvOVEvN3NKMDczWDhUcVVmejVWMDU0?=
 =?utf-8?B?TTJDaWFaZ2ZFN3k5QUhFMnBUTVkyRDZLMS9QMWtMVUxlenA0eUdNWkRVZGtF?=
 =?utf-8?B?bldGRjU5THRlb0hic0J6WHVDV2J1MmhGbEpmYWFMT1p6ODJMU1R5aXR4NVdL?=
 =?utf-8?B?SElEeXd3MHRqNHlaZ0FtdjMzaXhOVkZYVzd1NHdobC9PdXZ6S0RpUnA1aC9O?=
 =?utf-8?B?Nk1xaTd1RVFScmJkTjhwQlczUzZaL3FreDBPblQ1YWdtS29iUlR6U1pVV24x?=
 =?utf-8?B?aVlPN2lYT2hlcEV4Y3FjTUc0U3Ftd3NnM3hkeTZ0TGVSM2wwSzFRczRZa3hz?=
 =?utf-8?B?cFZsdzY3aEJaR0RzQldkbElFTTllL3pHeEE5eVEybjNibEVzMW1adEtRVzQr?=
 =?utf-8?B?Syt6YUZEV2M5OEs2Um5JMnVpRWFPekg0S24wRTZTQkxGR08zdW5ucDNOeGcw?=
 =?utf-8?B?SU04TVgyazJRSjFtREtMVXBCZ3BoYkhoUnRFQllHK01CdjJOQVM1SmdKb3M1?=
 =?utf-8?B?bmlXS1o1RFZwWlhhUVVHQmV4MnZaSjNnYnZrVTA0OVczcGhkMExFd2N3L0hi?=
 =?utf-8?B?N1ZoNEhHZUthOU9pdlNtWU5uSkR0dzVzdkpaRnJVU3JsS0RoMVhiNlc4Q1ZD?=
 =?utf-8?B?Uzg4RzUrM0hqaHFzZE9TRlJMbXRlTmNWb0t3N1I3YVpDR3pidmUrc2N0M25u?=
 =?utf-8?B?ektHaXd6SnRORkdyMDdydjVEbGM0UU5IQkFvZzNOUFpxRVM4ZTd3Q20vcnFP?=
 =?utf-8?B?aTVFMzMwRVF3UnVnN3FiQVZEQ0V5em9tclA5ZElNbUNSZWlEWWdjZ0U1SlFB?=
 =?utf-8?B?cFZ6dklaUHZwbGtCUytmalVKNWpjQ2pqVnlraWFrU3hHRFk0ZUZ1OTZlNjJK?=
 =?utf-8?B?TXVCZnV6QlhEeWxMc0VXUUdaODFCVW5iU2d1M2t3WW9hWmNTVXo4L0dBQ3dq?=
 =?utf-8?B?cmtRc0M5QW4wS1pSSGYwbEU3ZjEvZXRMd3BlcVZrZXZtNmVnR1NSUVZOSllw?=
 =?utf-8?B?d2ZpbnZ1R0RxYlUweWtoZXo2d2FZVGhQTGY5dDhEcm8vVGRGbFpUeUhPOUN5?=
 =?utf-8?B?UDEyNlk1QlRBSlhINUhJb1Q1YmF5RzNCaE4xbEtaSkdkQWVvRlpyN2NZZVR3?=
 =?utf-8?B?cWd5Y3lLcGJOY2VvY1RvK1B5aVRzZmZzcEJVS21CeTl5TlYwRE0ydzBHR0xw?=
 =?utf-8?B?RW1vbGh2NkdvRlB2dXp4NHdnYlhxa3AwMlZsZVJyVWQwblhscE5hWWZ1ekR3?=
 =?utf-8?B?N2JuTGQrZmlXVnRQSEtiVzdqZ1NxS2ZCY2hldHVRNXFFZ0JrajAvRFM2M3Yx?=
 =?utf-8?B?ekczQkFlZXpwcXR6WTJiOExwa0lPWmlDV2hjeFRBVFlUT2FGRU1xZGlzVzZU?=
 =?utf-8?B?b2RLVFYvOXhCdnRkalhGUTIrZkw4cHNpWUgxUUhxMUM5WXRXYzQzQk5yS1Vx?=
 =?utf-8?B?aEVRNnpQa01NaW5Wbm1aVDhtYms2QU4yUG5JM09HSEo3b29ERjEzMUlBWlhy?=
 =?utf-8?B?VS9OZjhveS9HT0JDZVhDRy9lZnJENW9mUFNzdHhObWZDWUVndDR6NXFSYmdH?=
 =?utf-8?B?c0YvWXBXVDhZTFhBNVNSMUZsTXQ0bjErNmd0dGFJSlJZNjR5SThDSFBxUVdN?=
 =?utf-8?B?VjFLcHZiVm4zdVNGSVJaR3hSK0Y4NGJLTW41VGRMMTRpYVROT1Vhak1SVHRL?=
 =?utf-8?B?MzVWOWhtNndKUW1oRzRoVDVlNERmZzZKNE1lN3VEN3BOZlV2ZkJRdUJlbE0r?=
 =?utf-8?B?TTFGWXNLZ2JKVncxbUdkc0crZkJXWXdMRmNKVWpCRHZRVHozZk9mOTdzUkxm?=
 =?utf-8?B?bHlDdVFHelZzWXRUVjJHQ2Q1WkR6WHliVE1PdCt4Tnd0NHIwVnNrQjVIVm9C?=
 =?utf-8?B?bHhsbklnZmlnWlc5VTlhSnJvbmxEWWh1L0kzRWR0ZGN4dFAwTHM4L0FaTmY0?=
 =?utf-8?B?Wk5YQ1lkYnFGQ2htajB4UWE2aGZHaVQ2Zk13R054VmZyL2QxR1A2d1pVUUZt?=
 =?utf-8?B?T3p4NkZOSm9ES2hZWjdncUE0SURCV09wVWV1QU5UZElQOTVJZlNoeWZlOG00?=
 =?utf-8?B?cnMxbzhzYUZYbDkwQmVjSm1Bd1VxSk04c1duNldlSGRadm1kM0hEc0RyMU40?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5losZz6Zgz1jqfFZY5kNpbAGrJv9LZsLcQmNviY6hhhAVkn23/tx5TyRQ3DjQui/fPW1gW+JOIHSLTqDVXyX4hMhIXAvmC7DKN916M68OKCAY3X3P9+Q0nvR0tlTEhLtJqedBvGLYZ+xjv7jhPCdR3antjBkt1PKwtA/bHNwu5/6yuVDW8kXXdXyeJKsePkdnEE+IqXI6CUIkwuLTE5d82cCJfIFnJalvKj1Ek0ILaqUl2KgYs0TB9KMVVdMMlsvVlUYdvtR1XgUk8/KQWA6bexn9nV0IEWBjmtaGIRJbgdSDlm3QFbK/IN51E2jhqPPYu6ot5r1+7LXqttuyyObQ1xp6kXY6KzwAN01QYHFNt0hlC6vfK4O8g4r3pnT3EvPdYOGJPV9DTo127KliwYRTCJ8rONyubB+eQDFh/xsaiXh97NBTWBy9BQX1DeWq6HJ7HUbwovDlB2VJ0Yyf1wFxktThi2Ae4z0taAM3N5DVddOsvs5QxbfzYofchUlQr0lNiBbaOA3xmD/bozYQvEQXGrjOMsCKJRg3Ai75S1vIgA2vYnoNAhpZTUmyzwGkXL+WiYE6hSV28SIibtl6Dg5zoqpyjRIwTc8e1G2wkDyscH5FVigZYY+RqbFRunriMla9/nXa4ZtdwADXfuMYs/B4+t7u13eyRrHezq8ma7iGi3WMUHWAjrVI3QqP+dLFzdB/4Fx/RysF6OZDQfqlG2Nua5ylqjO5pZ2QEKSJX8p1najXRoKbEX/x4RRo1/1MuUYiytKU/JdXxvOqx19BaPIsbu1BuS+5/OnUUsU3FfudO2VilrfUuaWiLIlflr4+DjI
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33def41-2bbd-46c8-f4a8-08db35225277
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:36:13.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQFCXW8SpmHgk7fDe+7P+unfZOzafi0yafXJcBz5nPVDjaZcLkPj4p72Opn9HxENgQOjbsUO3hdj3W8wqPX2U7QKEIpfb0uK8cdTNiyTxMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5263

On 04/04/2023 4:34 pm, Jan Beulich wrote:
> On 04.04.2023 11:52, Andrew Cooper wrote:
>> Adjust the API and comments appropriately.
>>
>> x86_cpu_policy_fill_native() will eventually contain MSR reads, but leave a
>> TODO in the short term.
> That'll then require passing in a callback function anyway, such that
> different environments can use different ways of getting at the wanted
> MSR values. (IOW a bigger change anyway.)

We've already got #if __XEN__'s in there already.  I was going to add
one more in the short term.

>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> What about x86_cpuid_lookup_deep_deps()? That'll be looking at more than
> just CPUID bits as well, won't it?

Good point.  I'll adjust.

~Andrew


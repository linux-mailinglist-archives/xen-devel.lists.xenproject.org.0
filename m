Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE0OA9hwnWmAQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:35:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D1184AFF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239620.1541017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoom-0002Ey-MZ; Tue, 24 Feb 2026 09:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239620.1541017; Tue, 24 Feb 2026 09:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoom-0002Bu-JG; Tue, 24 Feb 2026 09:35:00 +0000
Received: by outflank-mailman (input) for mailman id 1239620;
 Tue, 24 Feb 2026 09:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lmg=A4=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuool-0002Bn-IG
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:34:59 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1503973a-1164-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 10:34:58 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by SA0PR03MB5561.namprd03.prod.outlook.com (2603:10b6:806:bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 09:34:53 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:34:53 +0000
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
X-Inumbo-ID: 1503973a-1164-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RF4p1y95WdIoPXk4BjVEQmyE5IWI0WEcixnzkmsWKnogktHZPo3Z3jWbiejspimOdC1eWpXBkHAE+oKHQoMQxSCS+5DuaXAzK0HftMhkTxbSQnh4pFlekIIi8jnasIdEKRHetInt3gLf/8y43SAko7roo1uQSU5b9SHmvFW7sJ0aEtbuEH5N9bc8q3EpBF52HIIGvAamiy8a6UzOzdSXl0NHD3do04YW6hpUJtPYWTGpxStz7CjSWKxz4s+SBMlrwQFvHLi5L6cgJDk2G1t6OKgsFcGm0KUnBUiXXAtZZhUzQvXz3lfUIxV/WRdfkKsXUEEtKZs4UgXFBU/RUy49HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLdHOwTTgqnX5/mIeM6S4siuMYMq9nsgZyCOc+o0Zr4=;
 b=e5TH2NGoilVxKSPrDM7hLPJ7jW0doKVeatgXIf9sIZVHp2uudJBIpEuzIgfX2HhjgRijSHC8f60RaXQgs0NMl/hQq8YBhM+u6TFvzpiqnX4k/kD280TKLLZ+bOkV8LTS9jTTUBRdsgQwe9lQjXCEmVyre5CyaUB07mXLahW9VT/v3b+pq7Jzsq50oBjSeltdTAYw54Ous3qq12od3U9m2tju5Updh9UEAzQjkOV5hevCrT2Atz3uoDIk+fE/mcD2dAelZeLnyB7T9zpelx3WBZGntVji6kVwAIzG3qgGc7svChPuFbcnK5TfLHlgnalpS2f3SDnQA+R8qo7DniwBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLdHOwTTgqnX5/mIeM6S4siuMYMq9nsgZyCOc+o0Zr4=;
 b=GxgJng9zYOuQjY4zdOsv2HYxLNapQ9NTZM5cNvIN/wgs4Hz9U5I8IaxLor5uO5CxPQer5ksgGbecJLkm8TQ8FDVz2ItT3iO818YmWu3gW8hYaJFKL62RJf3yL57c7Cp2xlXCQmk87zjQF7altuWWwsDyfJj6OOQhzQva4gRNU2Y=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/4] tools/tests/x86_emulator: disable xmm* tests on clang
Thread-Topic: [PATCH 4/4] tools/tests/x86_emulator: disable xmm* tests on
 clang
Thread-Index: AQHcpKvkOO1o8Mk+1keRFSkNkxjvgbWQdKUAgAEjoAA=
Date: Tue, 24 Feb 2026 09:34:53 +0000
Message-ID: <E1E1F4B3-C0FE-4077-A6E1-738056D5B370@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <9e380de50b64e45e9044a2f4bcf1a5bdb7e74a29.1771840208.git.edwin.torok@citrix.com>
 <7f6cca68-f681-41ce-8d2c-2f4854510759@suse.com>
In-Reply-To: <7f6cca68-f681-41ce-8d2c-2f4854510759@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|SA0PR03MB5561:EE_
x-ms-office365-filtering-correlation-id: 1596084f-f4b1-4f41-5861-08de7387f72d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TzBTcjhkU1dORHRBQTlqaXNETUlYUVR5Y2pmalo2ajFoTUdPNXJlYXNGMmZW?=
 =?utf-8?B?MTVwWjU4V1p6N0c3S0tqUzBCd3hLQjZPaHc2Zk5XMi84cnVCWSthSnFyVk1a?=
 =?utf-8?B?RENwbFZDc1pTRlNRUlorY21TNjZHb1phbkxIS2FrNTM3emM1MlBYeDFSVUxQ?=
 =?utf-8?B?RzNjcm1iVWFOcy9nWEl3Z3ROeW0rTWNndERYSFhlOXhUSU9mTzkyc3I2aW1E?=
 =?utf-8?B?b1ZySURpbm1TNVlia2luYmcrWGN5ZjlvRXBTRUROZW9oZmJVVnN2bEltam1K?=
 =?utf-8?B?QkNLMkFianhpVndVb2pDUCs5OWVLZ1EzQU00NWp2a1loMHJWT2N5TEZielVm?=
 =?utf-8?B?ZTY5eUd4ZVdNNGRnbkZGT1RhcG9jT1FtVEZiOVRzb0t0OG1JeGo4Q004RXYy?=
 =?utf-8?B?ZmFLYXcwRkdsMXFxVDBycEZYOFRYUUNjbnJHcUJDZHF5S2NpOGovby9kYnJp?=
 =?utf-8?B?NFhBT2xwZTFuYWFidHF6QVdKOHEvVWNBOE1VS1dhN1gyOHdtNjhhQUsxV0RB?=
 =?utf-8?B?MVFUdFFsMlNZSGpkNmJwdUFDVVhZRmI1MzJobWxkNFZySm9STUYwbTlrQnp5?=
 =?utf-8?B?VXBINERwTnl1N1BtZGdNeGpURVh4UFdyaWlEZW9UdVNoV2ZzZnVkNGw3N3hV?=
 =?utf-8?B?YzdaRzZCajZTTmJJZlh1dytBeDZTMHpzOVJpSFZPRUxPVU5pa09hemI0cFVI?=
 =?utf-8?B?RmNkMkUwWCtiL0ZodWxJVVpFSWlScS83emRnUm1UVHgwMXhYN2ViVnUxaFBz?=
 =?utf-8?B?algwQjRMeXJURHp0anFhY2xweTVSNy9VZVhySldod1pNd21pcFVCNFBRdGdM?=
 =?utf-8?B?OENCTWFFVnV1Tm5XcEc0dENQeDZreFFkeDRJSXBCRkN6VWxPbGdsUGlUMnJW?=
 =?utf-8?B?MFpSazJ5QTBucDd2U1g5Vmw5bWVVankvaXNxL3FSRFZYRWZwQkVyZXhWS0lN?=
 =?utf-8?B?SmNidTlNU2J6bVI4dHR1WmVLVTdVb2MyMHhBeTk3RkxibUVRcjREMmE1WTJH?=
 =?utf-8?B?Y2x1QnhGUjc1ZkdCd2hnSWQrSWQ5c0Z2dzNPQnlId0M1QXpleXFSZ2xVbjJi?=
 =?utf-8?B?VDZpeGlqbFl4Wnk2QU5qMHNwMERkbVZjNU0rVWIxT1QrQXVPYU1ZSjhPYnRj?=
 =?utf-8?B?MjRWemltWG9rOGZmWERyYnpINVYvbnF4bW4zM3crRmMvL1RZUi9QNkxhUUsx?=
 =?utf-8?B?Tlo2VnhyRXpWM2hjcG9KWjhpY1gxc2JXRVMwOGI5d3hsNHZOWHQ5L0E3a3N1?=
 =?utf-8?B?alpaV2tvbVdkejJsWWpUL3UrNVVvUXM5ZVpxcnVuUWlMVHN4SUpWZVY1SjY2?=
 =?utf-8?B?S2ljZ3FaQVdaRXQxTXNvRjRhRGJiOXFrZXFnY0RPb1NsRktGbVRSSDhpUTZl?=
 =?utf-8?B?NE9GeGQwZzR3eU40ZHdHbFFEWFRzQWxiY3FQbUliSDNsR01UTGNQQ0k4VEhY?=
 =?utf-8?B?Q256TU0wT3pUWkxpRjF0Zk0vby9ZVTlqT0N4Zk51Si90a0RKdVU2TmVkRUNS?=
 =?utf-8?B?K3ZSUCtVcS9DT2tKZ0JPQ0hjZlNweTZoUVVLMVo1OWZ5TXFqRzNWbHB5STZu?=
 =?utf-8?B?YXlLRTlOVC95QVJPRUE5V2tORFNiZ2NpRU9SK1FVa0VaL05sNytQdUZJamtN?=
 =?utf-8?B?TXhudzJWN0EzZXJPYzVtQnQ4MnFyaWpJWHg5bVp3cHNKS1g1YllQVTRCUDJR?=
 =?utf-8?B?YmxWWWllRk93YW9lZnVmaWJlRFRvazVOc2xwOStwY0xqejZMRWpWbHJROVlS?=
 =?utf-8?B?MDVQT1VnaHpZaTZ4MDk2UDVPdy9hYWpkYXUrVjUyekNFRFBscksrRTNldEFs?=
 =?utf-8?B?NGE4YnowMmhTamp3T3cwelZSMFBqWUZxZXYvalh0a0xNYmpLRWJ6VUxPM1du?=
 =?utf-8?B?NFdxdG8raG5iMHB5NDZ3aU5TZGRteHpzOGtiYkxqZFY3WWVyYkV0Vm1PWFNr?=
 =?utf-8?B?Y3dMRFQ2d1ZFZjJJMFE5RFVoS0NqZTY5QXdLQktnOERoRUtRWHppbVJ0NUhR?=
 =?utf-8?B?Z0RlSDh0N0FvbTAveHBTaW5KWlFCRk96QU1LNXh4Ym9iUkJWWjNlSWNhK1VD?=
 =?utf-8?B?c0F6aHNFMkVuSkxYclpGdDNiWGNwOElSeThVYnU1Zk1aRkJnWUFHUDNwSkZl?=
 =?utf-8?B?aUZUdVluUWJiR2RHWExUQTN6VDM5MnZnVk1FV3lSZG9PcHAxdGEzQXJJMENx?=
 =?utf-8?Q?3R7jQY/3MKf1MBtTsaM8n2M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGptSUZIQTBwWDRRUHRzcWo2TlBsaGtaTlIwY0l3cEtKRTJ1WkNhMFZNS00y?=
 =?utf-8?B?ckZjVmR2ejBFSnFiK2I2eEVkV3g1ZlZCbFZ3dHEvYnFWTk4xQ1UvSGVoRVJY?=
 =?utf-8?B?blJnSFJzVWJYY3Mya2w1RFhBbm0zdTZRTW95aXdOd0NLSUtFeFFnL1ovaWJN?=
 =?utf-8?B?MWIwbmlBWVphMkF3Uk5tQ28yUmxsd21zTWsrYWVZZWZPaUV1T1E3THArM2Qr?=
 =?utf-8?B?TEJMdlM3UW90ZTlMS2RlSURzcXhTYTZiclFOYWRqTzg3SFJ0ZXlFY2NwUHhi?=
 =?utf-8?B?emp5MS8xbGJSL1VIY00xWTBqU2JZR3k1VDNWbDVjbEpaSVJHdWpWWWROZHZZ?=
 =?utf-8?B?VWlkN2wzN3BBWXBDNmZkNzdoNVUwb2EwaEM1b0g4bjZZOTdJeGVBSjhkUEEz?=
 =?utf-8?B?UWNrS2tUTW1sVnFHV21aYW1yeXRiSWNXZnpCVG9CUk1aWTA5Tm53OWRQVTFU?=
 =?utf-8?B?clpkZ1ZZTmJEQUVqNGlaMzUrNHVWWTZVc0dWdWJSUDBhS0N2VlpqeFdQV3VH?=
 =?utf-8?B?aW93SC9oSEVNcHdVd2VLMVEwb0hhZ01lNVdOQXpWZ2R1WDFlWVU2Tk5OWXhx?=
 =?utf-8?B?cDNrckI1WHJ4WkNiaG1jOUV5dU1mWHliUmhMbkZBU1JoVkFvaVprdXI2Nmtx?=
 =?utf-8?B?QmxRNDdUT2FLYitWQ0FxUDhCZzhmTUVsRFFBOHhhdHFuRjI1VSsxZmJ4UERI?=
 =?utf-8?B?TS9DZWRHc2xrV0lNb0xSRGRSOENRenFaTFhBdHZmMGo1eUVOdnFHaEc2Ti9t?=
 =?utf-8?B?VjA2MFRwMlE2MmlsVWlWaDlldEl6cXhxSE1RY2NRelJHOE4rNllzL2g2akhu?=
 =?utf-8?B?T2wvaUxLQkdwbkFVWHM3cEF6WDBTNC9NUWhoS3hGMXpndmZGZFdaUDZoKy9p?=
 =?utf-8?B?RHdrM0MvOGltTzlhR3dyd201RU9QYzBlb2NnMjIvY1VVQ2dLaTd6M2JCMVpO?=
 =?utf-8?B?ZTQ4bEo5RjI2ZDNSL1lwVytyWFlJY0VETy9ZYXlwNm1ydnhRMXRYanFhUzYz?=
 =?utf-8?B?MVZoN1ZHMlBjakl0RGZ3L1J3TElyQXAzWXZpYkJNblZlT09YNlB2NnJ0K25C?=
 =?utf-8?B?aVNoaDY2d0tiaHRiVXFYeExhMDRhV1BkTlUxYW1XV0s3cENJUVRsVjF0VEQ5?=
 =?utf-8?B?VHFCRWpoRXNJSlRMazNqbXFyTWNBSmplS1dkVWRtSmpqYi8vd3BnaGMwQzJP?=
 =?utf-8?B?TnRrN05zYnZ2b1BRdlM5VnladVpUTWcvOFdzYzR1K0NlU21FR3NQbkMrcXla?=
 =?utf-8?B?RmVtaEM1bzl5cDdNdXR4Si9RVTk3M0Y3Tk9vTlNPNkUyVjNxaXNwT2QzNmhn?=
 =?utf-8?B?Y2lkbWlCMU9Qclh1TTQvU2orQk84QnBkVWQvK3JDUGdUTHk3cUJqb3lEM3Bt?=
 =?utf-8?B?RlhkazVTNEZXM25zVjVpT1dKM2ZYM1ZNcGxEVmRVVTc2Tm13UDJvaUpkc2p6?=
 =?utf-8?B?TFhQNCt3S1dQV0d3SStGWUV3YkJ0KzBzcVJGUTMxNmNUOENweXZrVGF4Z3VV?=
 =?utf-8?B?MmxpV1ZSbHlabnFDOE5md2tHS2dUVWFXcXdNNWZyVXdaR0hTQVhUaDAyUFU5?=
 =?utf-8?B?Zi80R0dJR0toeXgwZC9tU1pQMk9FQlhlTU41ZGhPNFJPa3JjbDNoT21nMUlT?=
 =?utf-8?B?VEdKV1RnYkJCSFZmcFY4TmNNYWwyVnFaOHUzNHlTamZyUFhRbEJQclhKR093?=
 =?utf-8?B?M2JFZHFLWitSTlRrZ0NDN21XNlR3TTlhckFVUDZIcEtjQUdZdFEvWFhNQlRy?=
 =?utf-8?B?QlhpZGgydkVvYzI5UlpqRUJxZVozM1lYRjNiUkRicU9jK0dPRFRoT0RzL3Rp?=
 =?utf-8?B?YlBqTEk2MVoxQUJ5ZFlkR1YyZUI1U2xSRlJXazVtVm1saHlXb2lXY1hIekZK?=
 =?utf-8?B?eXY5S0xJaWtyY2J4d2JRU015blQwV29UQmRTMXE2YkY1VmgvQlVBaUZqTDZG?=
 =?utf-8?B?UEtEUjBQTWg5aU4yb1JRNDBrUVVLUndzK0lmZ3lkUHlxS2wweThYS3VENTRE?=
 =?utf-8?B?ZjhoQ1pKNFdUd0pyWnFhOXptK2sya3FHaWlqb3orTDR3cW5LN2JENGgzbjh3?=
 =?utf-8?B?U3oxNWw2MEovb0VuYnMwald2QStrME1LbGkwSWxoV0hFQWUzQXBidGh4ZGF4?=
 =?utf-8?B?Q0UxaWhqMTMxQzhEeUhnN2FYQ0lwTlR2MHdqNHRBNlR5YzNZMVljOHllK3Rv?=
 =?utf-8?B?M21VWkZzN280VnVhdXF1aXE4aWFJRzlQWEx2RUNIRUwyV1FQZUdPQ2crS2V6?=
 =?utf-8?B?dUZlVit1UERMOWJQSnFzSVFrRkVtWG5WZ3pDMCtKRWM5a01GODNySUFha2Qx?=
 =?utf-8?B?am9mTXNzZkEyZFEwZVgydmNrbXludHRmVTU5eC9VaVdUUXgwaFd1dHAzdUxU?=
 =?utf-8?Q?amEA9KcT7Ou5O3Og=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE98EBA69642E74BB94B8107F8D8BE8B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1596084f-f4b1-4f41-5861-08de7387f72d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 09:34:53.7742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m7jqDKHNBPDmWXE3BgQ0oj47s06uOcs9AwAHe54yS/mdfp+BmD5AjQp5sh0RpWYUXC9wgEWvkzHKqa0GxiPSlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5561
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 636D1184AFF
X-Rspamd-Action: no action

DQoNCj4gT24gMjMgRmViIDIwMjYsIGF0IDE2OjEwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjMuMDIuMjAyNiAxMTowNCwgRWR3aW4gVMO2csO2ayB3
cm90ZToNCj4+IGNsYW5nLTIxIGRvZXNuJ3Qgc3VwcG9ydCBgLWZmaXhlZC14bW0wYCwgc28gYCV4
bW0wYCB3b24ndCBoYXZlIHRoZQ0KPj4gZXhwZWN0ZWQgdmFsdWUuDQo+PiBEaXNhYmxlIHRoZXNl
IHRlc3RzIG9uIGNsYW5nLg0KPiANCj4gSSBkb24ndCB0aGluayB0aGF0J3Mgd2hhdCB3ZSB3YW50
LCBhbmQgbm90IG9ubHkgYmVjYXVzZSBvZiB0aGUgY2x1dHRlciB0aGUNCj4gdmFyaW91cyAjaWZk
ZWYgY2F1c2UuIFdlIHdhbnQgdG8gYmUgYWJsZSB0byBydW4gYXMgbWFueSBvZiB0aGUgdGVzdHMg
YXMNCj4gcG9zc2libGUsIHNvIHRoZSBmaXJzdCBnb2FsIHNob3VsZCBiZSB0byBmaW5kIHNvbWUg
YWx0ZXJuYXRpdmUgbWVjaGFuaXNtIHRvDQo+IGFjaGlldmUgdGhlIHNhbWUgZWZmZWN0LiBBIGds
b2JhbCByZWdpc3RlciB2YXJpYWJsZSBjb21lcyB0byBtaW5kIGFzIGENCj4gcG9zc2libGUgb3B0
aW9uLg0KPiANCj4gRnVydGhlciwgaG93IGRpZCB5b3UgYXJyaXZlIGF0IHdoaWNoIHRlc3RzIG5l
ZWQgc3VwcHJlc3Npbmc/DQoNCkkgdXNlZCBnZGIgdG8gbG9vayBhdCB0aGUgMiBtZW1vcnkgYXJl
YXMsIGFuZCBub3RpY2VkIHRoYXQgdGhlIFhNTSByZWdpb24gd2FzIGRpZmZlcmVudCBiZXR3ZWVu
IGVtdWxhdGVkIGFuZCBhY3R1YWwgd2hlbiBidWlsdCB3aXRoIGNsYW5nLg0KVGhlbiBJIG5vdGlj
ZWQgdGhlIGJ1aWxkIGZhaWx1cmVzIGR1ZSB0byB0aGUgbGFjayBvZiBmaXhlZC14bW0wLg0KVGhl
biBJIGFkZGVkIHRoZSBpZmRlZnMgb25lIGJ5IG9uZSBhcyBJIHJhbiB0aGUgdGVzdCB1bnRpbCB0
aGUgd2hvbGUgdGVzdCBwcm9ncmFtIHBhc3NlZCB3aXRob3V0IGZhaWx1cmUuDQpJIHRyaWVkIGFk
ZGluZyBzb21lIOKAmHB4b3IgeG1tMCwgeG1tMOKAmSBpbnRvIHRoZSBjcHVfaGFzX3NzZTIgc2Vj
dGlvbnMsIGJ1dCB0aGF0IGRpZG7igJl0IHJlYWxseSB3b3JrIGVpdGhlci4NCg0KQWx0aG91Z2gg
SSBtYXkgaGF2ZSBiZWVuIG1pc2xlZCBieSB0aGUgb3ZlcmxhcHBpbmcgcmVnaW9uLCBzZWUgYmVs
b3cuDQoNCj4gSSBkb24ndCB0aGluaw0KPiB3ZSByZWx5IG9uIGFuICJleHBlY3RlZCB2YWx1ZSIg
YW55d2hlcmUuIEkgZG9uJ3QgZXZlbiByZWNhbGwgdXMgcGFzc2luZw0KPiAtZmZpeGVkLXhtbTAg
d2hlbiBjb21waWxpbmcgdGVzdF94ODZfZW11bGF0ZS5jLg0KDQpZZXMsIEnigJltIHN1cnByaXNl
ZCBpdCB3b3JrcyB3aXRoIEdDQy4gQnV0IG1heWJlIG9ubHkgYmVjYXVzZSB0aGUgZW11bGF0b3Ig
b3ZlcndyaXRlcyB0aGUgYWN0dWFsIEZYU0FWRSBhcmVhIGNvcnJlc3BvbmRpbmcgdG8gWE1NLg0K
WE1NMCBiZWdpbnMgYXQgb2Zmc2V0IDE2MCwgYW5kIDB4MTAwIC0gMHg4MCA9IDEyOC4NCkFGQUlD
VCB0aGUgYWN0dWFsIGV4ZWN1dGlvbiBzdG9yZXMgaXRzIHJlc3VsdCBhdCBbMHg4MCwgMHg4MCsw
eDIwMCksIGFuZCB0aGUgZW11bGF0b3Igc3RvcmVzIGl0cyByZXN1bHQgaW50byBbMHgxMDAsIDB4
MTAwKzB4MjAwKS4NClNvIHRoZSBlbXVsYXRvciB3aWxsIG92ZXJ3cml0ZSBzb21lIG9mIHRoZSB2
YWx1ZXMgZnJvbSB0aGUgYWN0dWFsIHJ1bi4gDQoNClRoaXMgb25seSB3b3JrcyBpZiB0aGUgZW5k
IG9mIHRoZSBGWFNBVkUgYXJlYSBsb29rcyBsaWtlIGl0cyBiZWdpbm5pbmcgKGkuZS4gaWYgRkNX
L0ZTVy9ldGMuIGhhcHBlbnMgdG8gbWF0Y2ggTU02L2V0Yy4pDQoNCklmIEkgbW92ZSB0aGUgcmVn
aW9ucywgc3VjaCB0aGF0IHRoZXkgYXJlIGRpc3RpbmN0LCB0aGVuIHRoaXMgYmVnaW5zIHRvIGZh
aWwgd2l0aCBHQ0MgdG9vIChwZXJoYXBzIGR1ZSB0byB0aGUgbGFjayBvZiBmaXhlZC14bW0wLCBJ
IGhhdmVu4oCZdCB0cmllZCkuDQoNClBlcmhhcHMgYSBiZXR0ZXIgd2F5IHRvIGZpeCB0aGlzIHdv
dWxkIGJlIHRvIG1ha2UgdGhlIDIgcmVnaW9ucyBkaXN0aW5jdCBmaXJzdCwgZ2V0IGl0IHRvIHdv
cmsgd2l0aCBHQ0MgYW5kIHRoZW4gc2VlIHdoYXQgYnVncyByZW1haW4gb24gQ2xhbmcuDQpJ4oCZ
bGwgdHJ5IHRoYXQgYXBwcm9hY2gsIGFuZCBzZWUgaG93IGZhciBJIGdldC4NCg0KQmVzdCByZWdh
cmRzLA0K4oCURWR3aW4NCg0KPiBXZSB1c2UgdGhhdCBvcHRpb24gd2hlbg0KPiBidWlsZGluZyB2
YXJpb3VzIG9mIHRoZSB0ZXN0IGJsb2JzLCBpaXJjLiBBbmQgdGhlIGNvbW1lbnQgYWhlYWQgb2Yg
dGhlDQo+IGZpcnN0IHVzZSBleHBsYWlucyB3aHkgd2UgdXNlIHRoZSBvcHRpb24gdGhlcmUuIChM
YXRlciB3ZSBhbHNvIHVzZQ0KPiAtZmZpeGVkLXltbTxOPiBhbmQgLWZmaXhlZC16bW08Tj4sIGJ0
dy4pDQo+IA0KPiBKYW4NCg0K


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF852B67F
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 11:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331849.555459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGLn-0000fz-Qs; Wed, 18 May 2022 09:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331849.555459; Wed, 18 May 2022 09:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGLn-0000db-Mp; Wed, 18 May 2022 09:52:15 +0000
Received: by outflank-mailman (input) for mailman id 331849;
 Wed, 18 May 2022 09:52:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YALc=V2=citrix.com=prvs=130340f76=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1nrGLm-00089g-Jf
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 09:52:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2de378d4-d690-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 11:52:11 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2022 05:52:02 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by BN3PR03MB2132.namprd03.prod.outlook.com (2a01:111:e400:c5f1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 09:51:58 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::688a:5865:9209:5345]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::688a:5865:9209:5345%8]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 09:51:58 +0000
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
X-Inumbo-ID: 2de378d4-d690-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652867532;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aOGDflMWIOfR5MxxCXCWhCTvA1AZ+nhFSl7QzeI64rU=;
  b=RgZKvdeKaxDZ6I5nMnq1408jmhJYUlIGhfMpGFN8gedoEBUp5smzXr1E
   ll1kMeqH+UNyMEwvfaJhhWWd/BNO+UP1XS8HBcUFD05u6RW+xUGV+AQgR
   +yPUahsw9yFzA/bGHq+ZzpIvKyBhnmfdpwKdxMPbb004GoMwDUz48GiEI
   E=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 71974411
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:N1vYu624II5BojFrBvbD5b1wkn2cJEfYwER7XKvMYLTBsI5bp2cBm
 mscWTrTbPyCYmbweNEkbIS/oU4EupHWyNI2SwNopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Xjb6bSgs1NZfHs94kFCh2Fgd1H7V/reqvzXiX6aR/zmXgWl61mrBFKxhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82dBfyVvLe03x9p7ixKNfvSe
 csfLyZodhPDSxZOJk0WGNQ1m+LAanzXLGQJ9w7J/PNfD277lil295fyNfrvVoLaHflFtE2Ag
 EL54DGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRokqjUNsZJ
 UUS8ScqqbUa/VauCNL6WnWFTGWsuxcdX59bFLQ84QTUk67MuV/GXy4DUyJLb8EguIkuXzs22
 1SVntTvQztyrLmSTnHb/bCRxd+vBRUowaY5TXdsZWM4DxPL/enfUjqnog5fLZOI
IronPort-HdrOrdr: A9a23:Hw41FKyDeAjQfoo181T2KrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtrrQaC50YvLrf2RYUh27D3xnklWavo3RiKmrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.91,234,1647316800"; 
   d="scan'208";a="71974411"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4no75c9D/1fvtvDdb4rCPIaVR+2pMyMT4sEQFWOAwr2G2NL6kiiXYXSzpDLYeBOy9HJJgjsu+kluFoJVmN5cZ9lBacG3TbUJ88+Pwgoe+KTBlbCK6Yx67wwHsegLWtVJ+8duVS1GgvntC+cTZD7GNJOGATyVmZFyG3svzxj/7VKfHfNGaea6a0U4T9MrEl/T854+ntdiCctVF8D44cqNmECZjgZapjQY4OgiBUKlShhag0c/xz/wjMeRiXGrByP94KauJ8SBVfmS9CPM/LLwKAA5twX4EAFy50VjqMXcpW9M7FZpvRXbEk9g+SBDiFDGGkwDYiI7ctDpx5Bmkl9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOGDflMWIOfR5MxxCXCWhCTvA1AZ+nhFSl7QzeI64rU=;
 b=dbspFz5GO+fdr3HNUfWwW4bO8N//CWjGSL+UbIkrereMyapGghnmQQlb2RyipHciVuNsgU29Dip3W6kH/MDv0IJQxTYN7lLl1mnmGjppPeldMD21EcKMTCLk4DsTLBu6UF4qyQJuHKF/uik7CndSTYU+2wlBIM+pTi+OT+GiIVYAyATeKRj+LDuJPV+5/E+znxQ8PxNzUm+YS61BBWlgGf8KgwWjgWzWgWPAN7HCzYt8/FqBP6IPOJh9pLF7bjJsujQbHViEC7v71Uzf3J7WA2HYSv/hYB5DTWHWaz8FtrxGHiVT0G7mt42zULjhNigPkVZzUBOqK4bg2bhqKfUe+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOGDflMWIOfR5MxxCXCWhCTvA1AZ+nhFSl7QzeI64rU=;
 b=e9DhdzHUFIcmJzdcC+B1EQZdMyW4DPa/+yN1i+OYv78xJaHf+s0MHjSmhIIVQFeiQh/H1yIEadLBB9JQHl+PxglyXpYkZn58LwxER1Z14zAqX6liOvtEKCbSh0q2Bopn5ARsWh/W873lFu7bRfG6tAZzMKColPKX1oWwBDa+kJI=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: Re: [PATCH 2/2] tools/ocaml: Fix stubs the introduction of
 domain_create.cpupool_id
Thread-Topic: [PATCH 2/2] tools/ocaml: Fix stubs the introduction of
 domain_create.cpupool_id
Thread-Index: AQHYaiYn6m40FzHJf0irMsT2T+YW1K0kZYcA
Date: Wed, 18 May 2022 09:51:58 +0000
Message-ID: <987CBBF2-D9EE-4644-96DF-5DA89D96921A@citrix.com>
References: <20220517194113.2574-1-andrew.cooper3@citrix.com>
 <20220517194113.2574-3-andrew.cooper3@citrix.com>
In-Reply-To: <20220517194113.2574-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9de03cc8-426a-4688-30cc-08da38b40cc3
x-ms-traffictypediagnostic: BN3PR03MB2132:EE_
x-microsoft-antispam-prvs:
 <BN3PR03MB2132D2E8CF20BE5519391C8B9BD19@BN3PR03MB2132.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 s178+LlA37Xc/IbanAJRxeJBbFSOLhOHj5JPs9IAUMuffd1isbk3KdqTlSBqFjaomPVgunn23Aw3C+QecOl7brO85ad0+6tkQ1lWpcy/PehKjVvvCJ1M9lnmAY7eBxMyy2xEaAcOXR9K0LmVE/EHvq8nhj+CEFeKv5wdPK1pjIZ00kzzfhQjWwa4k9o5Qxd4D1bEaCNFGvjyULgGcs0VVT6hZY/SqK9sPJ9z6rqB97r9GUhPme0yrlgrUiB+AYKlgGn5Zhjijt3gqkqHiznM9MMGf2vIFUnHvQo5+AD3+q4sMg4KZ4OXrcYyHrG5joDF0bfyHmLhHgp3SegBf/sbmF2dYlyPdnM6T0WDHlkyznOiSYkR1XJyqUDq8aKwOyhl+CY6ohwmZjil7+3CExVt6JoRCxKNAMh9m/SxfNVBhGc3UIiHGXyov2m1TWce2Ab8GPyskm1gsTaX/e92zuBOdzNKKJTR8phSjmriZqprT3pEKy/o2k7VleCZ/ga41zjhv1g0CGxuMOE6Bup7PwEMQBzmYnw/oCJukzhBlTXw2keLvy/azcX3+rFZc5UCE1nM6qGRcY1cWLpqUfjauwKSiDUvs6c71befj7I1ECDciVBv1TiT05lRj7PIIAlf+teGLX89A9zbBLhHtT6X1/ATuZJGKHkyNlIYNmEirh1uaz3F/uRPjhw0kIFtc0Vt8Ejg/VqkFnyHAoHCfNYZKfFoW/nt5O9jfImYVmVQmbLtwzW00NHTQ9q6Skw+gljdFU4E
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(2906002)(6636002)(37006003)(54906003)(38070700005)(66446008)(316002)(38100700002)(122000001)(64756008)(8676002)(4326008)(6862004)(82960400001)(66556008)(66476007)(5660300002)(91956017)(8936002)(76116006)(66946007)(186003)(66574015)(6506007)(36756003)(83380400001)(53546011)(71200400001)(26005)(33656002)(508600001)(6486002)(6512007)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHVDRkJsOFlSMWtIY1gwMVFXb0tuZERFS3lkRklYZUZCUzg4UTVIcFc4NlBL?=
 =?utf-8?B?VmNjUHMxMU93Y0ZHN0NIdnRBOUhKdkhqamJ2S29iYjNISWpaMzRucWtvQkt6?=
 =?utf-8?B?R0FuN0xDWndSOGV6OHpOOGNaM2cxQzk4YnFpYXFhZndBcEZPNVFGMVQvUTNN?=
 =?utf-8?B?QlYvN3hRZXpYODFPUlhFKy92cGRpaW5vOEhqaExWOEpGNk0wQkRmb2gydXgw?=
 =?utf-8?B?ZEVYSWNTZ01RMGVRUHVjZmRIeVB1QWJmV3ZzaG5xaEkvWG5DdHJGOUlldjlZ?=
 =?utf-8?B?c1pSbG9SVTNvWjF5VHFTNk04TjA0T3lpNkoyQ2JOZVBNUm42K1pXZndTTDRh?=
 =?utf-8?B?eG5OUitqbWx0Uk5JUm5hK2k2QnZZMEZFbHZQWXMzTEZxSHlhMDZ4NzIzOC9S?=
 =?utf-8?B?bWpOL2JlZ21RMEZMSlNVcFhBZDBla2JpdWNqcXQxaXVtTm5pTnpVZ002OGJ3?=
 =?utf-8?B?bm5QT3RHM2RxWEtZeGZVL3Fackdpd3BGb242YWR6dUplU0NLeHBYTTgzb0F2?=
 =?utf-8?B?Zno0MkFwcGJodUZySjBHMWhLMGg1cWVvNVBTQTVIbVlQbU1iREJla3BwcnJh?=
 =?utf-8?B?aVBuUUI5am1ZSDhMWnZPSnpFRUxiNkNXVExtajJJTzVpWk9VMTlmVEd2RDVV?=
 =?utf-8?B?Ymg2RjlkVVNjbVNtemk1ZGJVUi81cHUwVFhWcjlGNE53VDVGRW00UHNZR1ly?=
 =?utf-8?B?SUV3RG5kWFRmR3lSMWlSa0dTajh3Kzk0NlFwSGpKY2lyVnc3eWllbEhsR0l2?=
 =?utf-8?B?Z1ZKQ2ZnT2E4Q3VFRTJ6UXVCSjFPdko2WFFEdXo0Nit6cldtbFd4WnFObnJp?=
 =?utf-8?B?aWFMMkxRb2IwQ0pPZFJXRmRLeGhwQjM3UGcxSm84Q29WMGloeHYrMm9GUkJJ?=
 =?utf-8?B?M1NpdzZGQVQzSXRZK2ZNRmtUUUFLMkhHU1QydFpLRmZnbURsZThzUHBlVlV3?=
 =?utf-8?B?U3ZqY01pU2dTNGFVdjZTakVheHIwOUM1d2hjalQ2aGwzVWp5UEJTOFErVllx?=
 =?utf-8?B?SGdSRDJvL1hSN01ka3ZaNk9xTmR3Y3BDSWJMMnhnSlcvV3lhbFZEelhHeTJa?=
 =?utf-8?B?TDZQNmJiY1Jzek80UzFEdmRtOGZUVTBIaktTZUQ0MnFWLzZuaFBDUUhPb0VY?=
 =?utf-8?B?c3hvSXJNNVZBUE1iVVY2aHpGVHRaTUgvQVRNNytNN3pKOU43aE9kditZQTFm?=
 =?utf-8?B?WE0xamF0a1hjaW9BK040MkpLOUhnblJIeVJtckcwbUw4aTVVb1BFdnFhL2E4?=
 =?utf-8?B?ZDZnZjFoZXd2Vnl2TjNqL0FhZktGazFkL1d6cXNCclBLbS8vWFRsUEo5blNX?=
 =?utf-8?B?QTFoR3RtUXhoYkNEK201VmFyWXpWRHBvOFZMUmF3anFiYTNpcUtyYjNiVUJL?=
 =?utf-8?B?TDFTUnk2QktLTWdjNFlEbzd0Skllc01IQi9nNkJMTm14UUhXekN1K3RsMW0w?=
 =?utf-8?B?bHc5NkZ3S3d2NTExSFZGSEQxZjlXMUdvQUpvSU81RXFlU2Z3WHcxTFlicG1v?=
 =?utf-8?B?NUJSRWRiKytVOXI1MEdKUXdUMW5FNEJpendwNmMzcERjWk1qVU00d0hZd0g1?=
 =?utf-8?B?NlVOWUJLdTZSQzVoN2xRenNUZnlzT25IeE9mZk4zZjgzVEk1U0lvUzVacHVJ?=
 =?utf-8?B?WE96d3NSTzd2WXFMRmtublU2a0FycitDMTZMbE9xZWFUSVdNQTVMY1lDOW9i?=
 =?utf-8?B?aEtydSs5UFh4Rm5sTEMyTWFMNmpyUU0raEtDSGcxZUh0SzY2K1VLUXE0QWE1?=
 =?utf-8?B?L3hxRFBWOG1xUy93c1FmOFpSVUh5U1dGTnZIVytKTmlwUE1iQlovMTdyRStl?=
 =?utf-8?B?akV1R1plOU5NbFB4TkVnK2tsTzhLUDBqN2JqYXZGckUwSERRRjR6Ykp2RmRa?=
 =?utf-8?B?YmlVUlBMcm9xR0JOOTJxbVFkaWpPaW41UjFnZTd2QlE5RVBxYzcvYnl6OU45?=
 =?utf-8?B?V3FETk5zSmxjOGZWV2c2Y1V5OUNJZlpadWhqZElYWUFmWFQwa2lnS0RVWmYz?=
 =?utf-8?B?bEZWVDVUSUV1T2VlYTdMNXAxZVQvdTRYTFdvMS9ONTdzR1N1Nms1TkJYYlg3?=
 =?utf-8?B?cnRpL1d2dkpLckM5bFN1K0VQaVhrLzNLc05LUVZyNWFFZ0hOaHZuRmgreFhy?=
 =?utf-8?B?VXE0TmNqRjVKUUVJTnMwMWRtUjljWVZ2YkU5bVlNbG02YkRETzVKK2N2RzNF?=
 =?utf-8?B?SERLYXNVSlYvRTlYUTROcFFVd3kwMmNYdFdscytmVDhwcnFNV21uOEdHUUhr?=
 =?utf-8?B?bXBIVnR2OU0raUdWWU4vLzEvTGZ1WG5ZMzZRQTBCb2NvNGtmTnI1WGRzS2tw?=
 =?utf-8?B?cjZhdjdCUlVSbGNoRU4rSUJ3cHEvSXhEaEQ5TkI4QytVc0ZlcEdIYjVxYi9G?=
 =?utf-8?Q?8D3EWGiqXv6LVIzM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABF7676B4C73A3438EDD042DC4F41BA1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de03cc8-426a-4688-30cc-08da38b40cc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 09:51:58.5264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kZMTTx2AMGBJzp4eZYkkLDSZ/V9qSRPgjXjBuJ0C8LLgNq8VbeAJwJpgRWOuudjbGJzvFgznGG0CoUEjNfMNpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2132

DQoNCj4gT24gMTcgTWF5IDIwMjIsIGF0IDIwOjQxLCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFNhZGx5LCBjcHVwb29sIElEcyBhcmUgY2hv
c2VuIGJ5IHRoZSBjYWxsZXIsIG5vdCBhc3NpZ25lZCBzZXF1ZW50aWFsbHksIHNvDQo+IHRoaXMg
ZG9lcyBuZWVkIHRvIGhhdmUgYSBmdWxsIDMyIGJpdHMgb2YgcmFuZ2UuDQo+IA0KPiBBbHNvIGxl
YXZlIGEgQlVJTERfQlVHX09OKCkgdG8gY2F0Y2ggbW9yZSBvYnZpb3VzIEFCSSBjaGFuZ2VzIGlu
IHRoZSBmdXR1cmUuDQo+IA0KPiBGaXhlczogOTJlYTljNTRmYzgxICgiYXJtL2RvbTBsZXNzOiBh
c3NpZ24gZG9tMGxlc3MgZ3Vlc3RzIHRvIGNwdXBvb2xzIikNCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KVGhhbmtzIGZvciB0aGUg
Zml4Lg0KDQoNCj4gLS0tDQo+IENDOiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGln
QGNpdHJpeC5jb20+DQo+IENDOiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29t
Pg0KPiBDQzogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiAtLS0NCj4g
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sICAgICAgfCAxICsNCj4gdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsLm1saSAgICAgfCAxICsNCj4gdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5j
dHJsX3N0dWJzLmMgfCA4ICsrKysrKystDQo+IDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsLm1sIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sDQo+IGluZGV4IDc1
MDMwMzFkOGY2MS4uOGVhYjZmNjBlYjE0IDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC9saWJz
L3hjL3hlbmN0cmwubWwNCj4gKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sDQo+
IEBAIC04NSw2ICs4NSw3IEBAIHR5cGUgZG9tY3RsX2NyZWF0ZV9jb25maWcgPQ0KPiAJbWF4X2dy
YW50X2ZyYW1lczogaW50Ow0KPiAJbWF4X21hcHRyYWNrX2ZyYW1lczogaW50Ow0KPiAJbWF4X2dy
YW50X3ZlcnNpb246IGludDsNCj4gKwljcHVwb29sX2lkOiBpbnQzMjsNCg0KV2hhdCBhcmUgdGhl
IHZhbGlkIHZhbHVlcyBmb3IgYSBDUFUgcG9vbCBpZCwgaW4gcGFydGljdWxhciB3aGF0IHZhbHVl
IHNob3VsZCBiZSBwYXNzZWQgaGVyZSB0byBnZXQgYmFjayB0aGUgYmVoYXZpb3VyIHByaW9yIHRv
IHRoZXNlIGNoYW5nZXMgaW4gWGVuPw0KKGkuZS4gd291bGQgaXQgYmUgY3B1IHBvb2wgaWQgMCBv
ciAtMSBpZiBjcHUgcG9vbHMgYXJlbid0IG90aGVyd2lzZSBleHBsaWNpdGx5IGNvbmZpZ3VyZWQg
b24gdGhlIHN5c3RlbSkNCg0KVGhhbmtzLA0KLS1FZHdpbg0KDQo+IAlhcmNoOiBhcmNoX2RvbWFp
bmNvbmZpZzsNCj4gfQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVu
Y3RybC5tbGkgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpDQo+IGluZGV4IGQxZDlj
OTI0N2FmYy4uZDMwMTRhMjcwOGQ4IDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hj
L3hlbmN0cmwubWxpDQo+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkNCj4g
QEAgLTc3LDYgKzc3LDcgQEAgdHlwZSBkb21jdGxfY3JlYXRlX2NvbmZpZyA9IHsNCj4gICBtYXhf
Z3JhbnRfZnJhbWVzOiBpbnQ7DQo+ICAgbWF4X21hcHRyYWNrX2ZyYW1lczogaW50Ow0KPiAgIG1h
eF9ncmFudF92ZXJzaW9uOiBpbnQ7DQo+ICsgIGNwdXBvb2xfaWQ6IGludDMyOw0KPiAgIGFyY2g6
IGFyY2hfZG9tYWluY29uZmlnOw0KPiB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1
YnMuYw0KPiBpbmRleCA1YjRmZTcyYzhkZWMuLjUxM2VlMTQyZDJhMCAxMDA2NDQNCj4gLS0tIGEv
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gKysrIGIvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gQEAgLTE4OSw3ICsxODksOCBAQCBDQU1McHJpbSB2
YWx1ZSBzdHViX3hjX2RvbWFpbl9jcmVhdGUodmFsdWUgeGNoLCB2YWx1ZSB3YW50ZWRfZG9taWQs
IHZhbHVlIGNvbmZpZw0KPiAjZGVmaW5lIFZBTF9NQVhfR1JBTlRfRlJBTUVTICAgIEZpZWxkKGNv
bmZpZywgNikNCj4gI2RlZmluZSBWQUxfTUFYX01BUFRSQUNLX0ZSQU1FUyBGaWVsZChjb25maWcs
IDcpDQo+ICNkZWZpbmUgVkFMX01BWF9HUkFOVF9WRVJTSU9OICAgRmllbGQoY29uZmlnLCA4KQ0K
PiAtI2RlZmluZSBWQUxfQVJDSCAgICAgICAgICAgICAgICBGaWVsZChjb25maWcsIDkpDQo+ICsj
ZGVmaW5lIFZBTF9DUFVQT09MX0lEICAgICAgICAgIEZpZWxkKGNvbmZpZywgOSkNCj4gKyNkZWZp
bmUgVkFMX0FSQ0ggICAgICAgICAgICAgICAgRmllbGQoY29uZmlnLCAxMCkNCj4gDQo+IAl1aW50
MzJfdCBkb21pZCA9IEludF92YWwod2FudGVkX2RvbWlkKTsNCj4gCWludCByZXN1bHQ7DQo+IEBA
IC0yMDEsNiArMjAyLDcgQEAgQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19kb21haW5fY3JlYXRlKHZh
bHVlIHhjaCwgdmFsdWUgd2FudGVkX2RvbWlkLCB2YWx1ZSBjb25maWcNCj4gCQkubWF4X21hcHRy
YWNrX2ZyYW1lcyA9IEludF92YWwoVkFMX01BWF9NQVBUUkFDS19GUkFNRVMpLA0KPiAJCS5ncmFu
dF9vcHRzID0NCj4gCQkgICAgWEVOX0RPTUNUTF9HUkFOVF92ZXJzaW9uKEludF92YWwoVkFMX01B
WF9HUkFOVF9WRVJTSU9OKSksDQo+ICsJCS5jcHVwb29sX2lkID0gSW50MzJfdmFsKFZBTF9DUFVQ
T09MX0lEKSwNCj4gCX07DQo+IA0KPiAJZG9tYWluX2hhbmRsZV9vZl91dWlkX3N0cmluZyhjZmcu
aGFuZGxlLCBTdHJpbmdfdmFsKFZBTF9IQU5ETEUpKTsNCj4gQEAgLTIyNSw2ICsyMjcsOSBAQCBD
QU1McHJpbSB2YWx1ZSBzdHViX3hjX2RvbWFpbl9jcmVhdGUodmFsdWUgeGNoLCB2YWx1ZSB3YW50
ZWRfZG9taWQsIHZhbHVlIGNvbmZpZw0KPiAJY2FzZSAxOiAvKiBYODYgLSBlbXVsYXRpb24gZmxh
Z3MgaW4gdGhlIGJsb2NrICovDQo+ICNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9f
eDg2XzY0X18pDQo+IA0KPiArCQkvKiBRdWljayAmIGRpcnR5IGNoZWNrIGZvciBBQkkgY2hhbmdl
cy4gKi8NCj4gKwkJQlVJTERfQlVHX09OKHNpemVvZihjZmcpICE9IDY0KTsNCj4gKw0KPiAgICAg
ICAgIC8qIE1uZW1vbmljcyBmb3IgdGhlIG5hbWVkIGZpZWxkcyBpbnNpZGUgeGVuX3g4Nl9hcmNo
X2RvbWFpbmNvbmZpZyAqLw0KPiAjZGVmaW5lIFZBTF9FTVVMX0ZMQUdTICAgICAgICAgIEZpZWxk
KGFyY2hfZG9tY29uZmlnLCAwKQ0KPiANCj4gQEAgLTI1NCw2ICsyNTksNyBAQCBDQU1McHJpbSB2
YWx1ZSBzdHViX3hjX2RvbWFpbl9jcmVhdGUodmFsdWUgeGNoLCB2YWx1ZSB3YW50ZWRfZG9taWQs
IHZhbHVlIGNvbmZpZw0KPiAJfQ0KPiANCj4gI3VuZGVmIFZBTF9BUkNIDQo+ICsjdW5kZWYgVkFM
X0NQVVBPT0xfSUQNCj4gI3VuZGVmIFZBTF9NQVhfR1JBTlRfVkVSU0lPTg0KPiAjdW5kZWYgVkFM
X01BWF9NQVBUUkFDS19GUkFNRVMNCj4gI3VuZGVmIFZBTF9NQVhfR1JBTlRfRlJBTUVTDQo+IC0t
IA0KPiAyLjExLjANCj4gDQoNCg==


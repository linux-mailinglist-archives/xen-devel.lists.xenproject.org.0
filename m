Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68501596BB3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 10:56:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388753.625501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOEqX-0003xi-Ld; Wed, 17 Aug 2022 08:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388753.625501; Wed, 17 Aug 2022 08:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOEqX-0003uR-I6; Wed, 17 Aug 2022 08:56:17 +0000
Received: by outflank-mailman (input) for mailman id 388753;
 Wed, 17 Aug 2022 08:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWwd=YV=citrix.com=prvs=2218cd774=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oOEqW-0003uL-1u
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 08:56:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71a292e5-1e0a-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 10:56:14 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Aug 2022 04:56:11 -0400
Received: from DM5PR03MB3386.namprd03.prod.outlook.com (2603:10b6:4:46::36) by
 BLAPR03MB5380.namprd03.prod.outlook.com (2603:10b6:208:29e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Wed, 17 Aug 2022 08:56:09 +0000
Received: from DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::81f3:95a3:4853:a11f]) by DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::81f3:95a3:4853:a11f%7]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 08:56:09 +0000
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
X-Inumbo-ID: 71a292e5-1e0a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660726574;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RO3Dsy9FTZ6YBHUYjHsquha1W5vGYWD4H1FBByp7YjI=;
  b=PShYD7thq8i9S6hDgZrDOUgYz7ZQ7SAE8n7KvRPX1BOVa3oSbjp2Sf98
   4VM/b1n94tasbUc+jsJzZEBZB8pBXHPOfCp3pQWAsQ7cdtbld/2VI5HsY
   jiqKYMyD816qt47ndTg7LoihKx6Lecxb+oXjallLSIcJA49e6hxPfKfBz
   g=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 78280094
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AOaqNW61pJpB5MfYKHvbDix16xVZp2XFdZch5A?=
 =?us-ascii?q?8VEjyJ0xrEAwtozkvJmspFDY3Ohlcen9eFSkeUyjDOjoXlbgMmZDsEs7Tctp?=
 =?us-ascii?q?WDqINIANP88zg/yPWWGecd9FnQX3ncgycBs71oBS9KM3BXuAcsPlCGP80F0M?=
 =?us-ascii?q?M3bxrrQXUAWbvjEAFOywlPIIqpFdJ5P64naGXmhe933DWH25WK+fQzSkKYpl?=
 =?us-ascii?q?GOX7+eJ8v/TLPD7t5OaxS5Gj07D388RhnVnlUYFmRQ+hopI7VNglnWAlku1Q?=
 =?us-ascii?q?nBUAke6mQUig8xH1rMHLQ8O/0ohcw0w+hBRr9b5mH0CsPAyCKXh6ZfyPcSwD?=
 =?us-ascii?q?YSQxHYjgULg/OVnxeBvRZi/TMHr0We8Q651xR3UqSDN1MN6mJ9BccVe55RB4?=
 =?us-ascii?q?zkxv2rN0nRBvd/q+SjgPPcFAS9QQdC7fZt5OyGUBfaQ8RRngmrsl7Sl3dgx7?=
 =?us-ascii?q?/ljGk39kxcxPn8y47b2H4pZbx/IqQkb3oeeUTr+liB3VDOjJtm9eA5xwfDus?=
 =?us-ascii?q?4sRTfL532JG9xs/H0luDlJW9IUTUsl1Msr35flt7dFEt7Y5MDeIuRkigRFRR?=
 =?us-ascii?q?OJLnFnFbQE7xxmX8KrtTV655vQ2qDXwG6EKIQnaDiY0gYV6399hPHIRQwogq?=
 =?us-ascii?q?pDnp6gYzPaxCAFBbsfduSbihriYfi7xz/bb+5HDMQl5BQWTRw3YPRByFhsB0?=
 =?us-ascii?q?ASdn/Eq3yazOH3nK7SY+lT8jJkZ8jSB1J+1riRD8pLcWZAwXnh6Z1bLkdvjg?=
 =?us-ascii?q?PRVYc5VLi8A8GEUofFJtFR78EMGmlaG0LKDcEqnEqhu5TWxsw/yudWKEfrdl?=
 =?us-ascii?q?2NPAzRI2NDMpvNi/XZngn6rk+gUtL/OkuqRa4WappEktn2ZTpeaPiBYpEVFy?=
 =?us-ascii?q?16hrXAOQmjbNrsI0fIDoTMDEUZb1ZMvk0K5dsB4YtWBsAj2i25KACaZEVkF/?=
 =?us-ascii?q?yAPzkAGkOisbsSDJFhiAB0O6THz+/CuJrvFpDHdUWHKpz8bEBK9zWDsl2Frx?=
 =?us-ascii?q?OmOFBMy2y8Gkau6dJzxb5eVW9zHXFjVEAiS1I3KsWgMh7LPT3q4KHUcPReda?=
 =?us-ascii?q?3jgLGUgrPcFUrEgZy57+aReYRGC9Jwm2VV5J6m4+P6RFqNujS9flQilml0eW?=
 =?us-ascii?q?DEFWlYaBoXuB00je5Chm+IMkQYJlAHIMt9gvyiQIOLUZmJkl06TBvW80UZJX?=
 =?us-ascii?q?u3GPFqLjIKeljT0h9dk343m/cpAY8v5L/W+MqfkjGWujW+njRa2On2v3G8Mx?=
 =?us-ascii?q?1ypa1SS61G8CQ4ytUrc3CURPnKoPF+WsX7x91UQgMNHAgBPzMz0DPsyi15Z6?=
 =?us-ascii?q?dAgKZRwqOjqiRYCAYSuVU2ScamG5w0y1ZAR9GZ0evbytZBtkQ2byauptIaWo?=
 =?us-ascii?q?g4/UfQvzcVjZVWkoC9yE9o6uFs+CWe3+woBzaUiUfalNo5kN1JoP8eavPxT6?=
 =?us-ascii?q?QC7OgaIZHZsjx3a86AhtynHn1jcu1vZLPvQH5AK2yaWUqIaBoKbWcDyb663L?=
 =?us-ascii?q?01ekhhYo5osrv+RH9wmiW1JavPVvpu1F5fgKmY7TCEgwoZDN6jOgWCppN1gX?=
 =?us-ascii?q?qbqG+bCFdWtVYhCj8siw5w9pxfC96QpFBhHInqxEtUFu1Di9O/7lvTsCf02h?=
 =?us-ascii?q?/Cib4YzVfVjlZfEURLyzLWMn4w6jObwqHKTwnLlxZyzMSUVs2THkE6lR7jHn?=
 =?us-ascii?q?e59lz33VhXlrfVYtzOSe6NaCRPCNEBoqk3Lcq5TPRCcCbbwGP/hD+uMXer/1?=
 =?us-ascii?q?7JhKIhraFrt7CyKvDrcKxryLAHzl2u08orKaA3VS/vbhCIa2rN6u3TMoDSq3?=
 =?us-ascii?q?QctqJtDGulSytM3z64eUoFH7pHobsp11eX1hIpCPqMrbFUS+oks9wNy/V2s6?=
 =?us-ascii?q?Vy8MJBRPmK66dHssEwdKbBHxSDwVDgzBCTs3d5VahWZz7izP2bR0gQkOj6bq?=
 =?us-ascii?q?upxBD6VTq8bctrKqkTkpeBfh9IluZ74GZTsgWKOQ3OU9x/DcpvYSDzvGXQgg?=
 =?us-ascii?q?wShJWY3liLwFY06laX8A7gzahT5JHG4GBMThOUP1MUSiOMRDPgS23dajOnJC?=
 =?us-ascii?q?KzSrVfHsEjZUcLbWa7gbTIeARG8Ygax/UgZjqcJNhJOZIfk5/iTPTFvQNnj3?=
 =?us-ascii?q?GqxG6rIxJ1fnTjo/v3UAvl6xqaHNkXWCwMXSQ6Zo6orsvbSPx+odJHDHrKQ6?=
 =?us-ascii?q?E6ttFkbxjmRViCzgPSuqnMYTE+9JOWCTS7jy7IQ6XZTfquEDn+XCsiqPICaQ?=
 =?us-ascii?q?EYUu2TOFs2UuYmpgSV2JzT2dsrVWEZQGN60NNGV059ApZvgFCL6FCIQTFN8w?=
 =?us-ascii?q?dQeywz9/3W6atimjE/pcgbDPthdx6GkdqAp6+t6Kdr0jviWgRw/akgWCikvz?=
 =?us-ascii?q?28bdG64seUUe1tymdNt6IooEBf97B/dvWDrxFzZ74by+XTr5QMvov7EMiEDj?=
 =?us-ascii?q?gnc21SiqDjjI+WP0kB5muj6ZXvmghBtAXrOyuBISS5FJzAQ/2R9qamHSHL4c?=
 =?us-ascii?q?MdOIy3IJgjPMClUPW/3?=
X-IronPort-AV: E=Sophos;i="5.93,242,1654574400"; 
   d="scan'208";a="78280094"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4rutlWcVivV/rvJa1XPp3g+zg0OMDnm+MrZDT2NrL6BnB5lAsY8RT5x8+bnqv9r1co2svbsPCEzqiPck8LQ45TwVrWYEinGQ5wlOVUlbOFPVSH2/mqTCAvXKGfXYnmIGMCpeqh0xevSKoYO6VsWS8VB5Cj/2S/kTJKWsUcH3psNiIZm/BAN6mMP4cDpGBTx9Fmm+WkZoAahhy4+Bw6PGp1PCpdWhTWdBQzqN8h1gFIGubQb0C/rPHJPsCOH98BUp30r1XXu8wTeN1dNiimDjJgGa6T22CeJxHNOnQOS+ZRrWutC1NvPTHGdeoeDlu3R4YfHnt1oyJsGt8s02Y0MmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RO3Dsy9FTZ6YBHUYjHsquha1W5vGYWD4H1FBByp7YjI=;
 b=cMvfsxF6+cGOLYimzVGQoRQFtAFbbWsNfXSQgtm7zjNlNrXKJShZ/c0+f54BlDT99RiGYpcdZjyPOe3AnQCthlMU9voot6+7MDTNr1MRc+ihnsWY6MJGL0nxefSkId2epQKqnGCzzroUmOsWZdlD1c7qaD8hT7YxV270FEfWt6u2PSWNSIzXGjgE7rAtz8xIshG9Irp/+ZgSHxZk5MDxPt9HpLGVkzLP8etEBv2F0rgdb93A0+2xaciKB7OJ/6omUAgCNNKo8jcxbjEz9ZWTP110CXUWflqdJ6wMH4KxJFBZq6jT9GgjQseLhYMOk9wda60NCbCY8z4UF+CGZX9zuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RO3Dsy9FTZ6YBHUYjHsquha1W5vGYWD4H1FBByp7YjI=;
 b=P7a/ICs2LzfGj54JDfnvTYDy4y7+YKQE6qksmfAqlBZaZ/sGT/zoRURm8qOje52FhPb49J2cf3Q82gLhtphKMY3XYzcL3CULEae5qfHo1dPyp7azHMDABiBihw2e5ddkpj3ZVYwB66JdaYIWYVwFfZbGKsFqx9zIB8Wa7XJOnzI=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] xen: Port linkage.h from kernel code
Thread-Topic: [PATCH 2/4] xen: Port linkage.h from kernel code
Thread-Index: AQHYqBOcTorV7/AaXU+jvacxRyO/Ya2gCkGAgBFX74CAAC+mAIABTFyA
Date: Wed, 17 Aug 2022 08:56:09 +0000
Message-ID: <becf6ce1-8432-496c-be3d-3e756841d865@citrix.com>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-3-jane.malalane@citrix.com>
 <2bd30d03-1918-02c7-02b2-cff8d58c99b0@suse.com>
 <a9a16f4f-a891-0801-69f9-5ce66acbc672@citrix.com>
 <effeed44-afa4-a172-5365-4a7007274957@suse.com>
In-Reply-To: <effeed44-afa4-a172-5365-4a7007274957@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64bcb16e-c713-4f81-1ba8-08da802e5421
x-ms-traffictypediagnostic: BLAPR03MB5380:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IP21e6J/3gD4LzfL5q60So36man9Gz//9YHUH/gjkHAhQiiAhlWyR9w4IkB84Jo8yv1FiGV+O6MKhqSZTPrCBsnenvg51aG8A1qukBRflLYcn0lixaI9HKg1/akeUsBcic7o12pEc1l5x0Z0f68lmc/eNff0gNadjgIWpSoAu3LaUj0jQlWgoJ7id6O6iZfsafWCT7VjrouHBUeoKL1NZPE4FXaqtl6efQKkRPhMrSck/i3LEnTenXyeQyD1NH+sin3Nt8O12f1QQpcfHNvVsIyl7/JZuN3xchc9a2Ca57m5dtOPr/4mJhWaRhTDIDH5KOEqL0wDSWB5nFxhl3fxRS1cso4pMX7ORu03vf4kw3XzeUrNhm1nqLAbK7fymy2n3JwLy6hmbGCqQT991QgrDlmjyhBxI6cnvtvsMdpC5nL7O8DfSdFC40kAGrPGmB0uVwXIFxGTrZTzEyLR+YN9zfsK0Fgbp+eKpbXrvXE0+dW5cwboLYYy+td4qk/8JR9vvPXB0JCz/nH2oYdaonEralWfNnlhRKem1Z0PY6rTj+QoLW9rT201LLhtTgNShDCRwIBqsSW4XRkqffTP+NXmCn3Ug1h5f0KILvasxrCQzioWr+k21IR1aFTx+ipHjf7ZN5+3aQDaLLtTQ054IbFGP31g/I0WbBgZnSQmiU/g8Zr+3r1PTdHatLFnOLJcG8JlqBLAwQTFD/fuSrlLKp645kAYmzU7iATXV2sE8PkY2aY/VfwWgyxtdCa3OnHoMxnACRdxlTWpYQWMBxadBbIvyszqB0fsPyl5xl0eOnD3a8/AKuILR8DIpOq8IrF/dtsr0SMqpieiUezEhJKPZcrEMw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(5660300002)(41300700001)(8936002)(86362001)(38070700005)(54906003)(316002)(6486002)(6916009)(478600001)(64756008)(66476007)(66946007)(4326008)(66446008)(76116006)(82960400001)(66556008)(91956017)(8676002)(71200400001)(186003)(6512007)(83380400001)(31686004)(2906002)(31696002)(53546011)(2616005)(6506007)(38100700002)(122000001)(36756003)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3FyUGNWSHJVOFp5T295cDRCaDhOQzlFYmVQWnFiQUNuRHBXMGxiZlI3NE1I?=
 =?utf-8?B?SzFBRGZyRW9BT0pkM2ZkS1ZxZjhTdDhMLzJDTEJ4bVQrUWV2N3V1TWMrcFlV?=
 =?utf-8?B?Qm1wMEpjaGxneWxMRkJVU0wxd3padVZrcDkzbXBEbXh4RmF1aUN2MTMwK2Vk?=
 =?utf-8?B?ajN2Y2pFNFdnclpOcTI5d2xnUnc1a3FUVjN3OXl5OU16bWw1dFlYWnhqMDMz?=
 =?utf-8?B?R3BSNWtRdE1tWnlvUXQ4MktRNUFDK2ViakpReUQycEpVRmVrbm91dUQ1M24r?=
 =?utf-8?B?Zk9LVHVTUGhVODlVNFJWQWFtWDR1K0RPMnlRR2ZueVo1d21acWUrRVdGVE1D?=
 =?utf-8?B?OUwzRm5oSXY5bzlyb3hsVnNvblhyUldNMGRsTTZzSHhqYkRSRHlPS0J6cmFo?=
 =?utf-8?B?akVEbzQ5MHhCQ3RWeVpISWE3K3dvRnpoZkxHWVd0cDVXdmVIOGJzNCthRk5a?=
 =?utf-8?B?cWIxL294eExEQ1FkMm93dllsSzBremt3c3BzWm5EUTJxOWtGdDgwa05Ob0Qx?=
 =?utf-8?B?NFhZeFVGOXFtN1ZlRW9GNVgycHZ4S2hrOUNMTWpOTEUyZDNva2JvMWllUTRi?=
 =?utf-8?B?SlpncmlXbGx1T0doMnR2MWNOemozem9ic2dpaDdacjhVenVWYVRiZGtDZXQv?=
 =?utf-8?B?d3hPdEh6YmJNcHBwbkpiS1U0UE5LSkpVaGlBcVRHblVYSk1UOXZKOFBhTWRF?=
 =?utf-8?B?OTFEcGFPa2lBZ2s3czFNV0N5RCtpU21WdGtqVWlCY3FTME5SMDVieEZtWmRQ?=
 =?utf-8?B?TkI0ZUNUNFlRYlA5TGZDM1k3TnhMa1JpVDRDcVNQY3N2QTk2RHZuaFAxQlJC?=
 =?utf-8?B?MUNqRjlXeHFKd1dGNXpUa2hRUXB5Sm02OVNGcWM1bFh6M0cyRmdKSlZkQ1Rw?=
 =?utf-8?B?K1NaRXp0ZjBnMldlUzdEYWpYUm1TTGJCWjU1aGMxQ0FPVDUrZlpHeWVnQ1N6?=
 =?utf-8?B?ajU1NlU0dHVYU0ZWc0VFdllWUVVvaHVhNExhVHNuSTBQcjdqdEtWZkUzY2ZW?=
 =?utf-8?B?UFNhOE96WFVSb2F5U2hhbUdUZ3FqdjlIaG1HdjFEMGdPYXpPUHFZRXlTWGVZ?=
 =?utf-8?B?Ri8rNFhpYXVzdDBBQjd1TEFBdU9WeVRtMlc0Zzd0NmF0Tk9LRHdPWEZOVHZo?=
 =?utf-8?B?eFZTY1o1Vnh0RmZlcnBrTCs1UERZRFhhMzRmazJxKzRsWkgrTG9Jd2phMGpk?=
 =?utf-8?B?cjdVYnNPRGxKSFRyMHdhOS8zMjVpWWdkZnp2NzM3ems1eElia3NiV1VDVVVY?=
 =?utf-8?B?eVBQc3A3Q0IrSnY4T0xqMEU1RmF2cVN0d3RqOWp2RHNGR2FmaXJTN0VuQU9r?=
 =?utf-8?B?R3lqVkxkeUtobGpTUFN0am9Yb3VtbzA4TXlsak5XVTlSQ1cwV0FIU3lpQ2Nv?=
 =?utf-8?B?aTE1S3dOc0FQVUFCUDY0NEZZV21BeVpaM0R4Tm85MVdoN0l2SjR0S3FOOXFR?=
 =?utf-8?B?S0M0VG1tSFVvYXIzODhVcG4zNERnaHJiL29aazE1Mnd3VlhXd2NGZit0WHFH?=
 =?utf-8?B?b2RUd3RnK1laS1pwWkhocUg4YWhCZGtEWFRJdGxYTTNPS0hrOXNxSGY5bDJW?=
 =?utf-8?B?blRad0R3STVIYmhzN2FDNkdtTmFLVi9wVUx1dkEzUVVRQThTR0QzbERsTnd5?=
 =?utf-8?B?dDdBbHJLRllZUXpKbkhFUG5FdUNpNHpmMjhSdnVTUTUvMnpoMzZOeGx0byt3?=
 =?utf-8?B?MGs4NDZqSzBPZ3BZWXRCR2hKNXdSTkl4NForYVBIUWNqWDkzc2FYNFluZE5T?=
 =?utf-8?B?dzlJTDROYnRFajhDVUJ3MXAxS3ZLQm8wMmNyNGYxZkFIaWg3RzNUTjgrR1h5?=
 =?utf-8?B?cTNsWkZGeHFIVzdUcktTNVF6TTFYQ2loVzVXOXhMME5OdDUzM1pzK1JRZ2Ny?=
 =?utf-8?B?aHIzZTlhNmh4aHFNVVhnMHJ0WUVCWnV4QmlqaHoxRGg1V3d6eDMxTlBmWG1C?=
 =?utf-8?B?NWtCQjBpbFkybWFFdkhZdkxmZ2NETkRpODNSRGltM2V3ZjFqZ2Z2QzZXMHVk?=
 =?utf-8?B?VENUNllTTXBVL1JXcHhJT3VTd012aG9sWGZqdDY0NzRQaGt4S0JaZVIrQjhK?=
 =?utf-8?B?dXE5QWZWM2FHeHEwa3ByM3dleUpEWlhJODJ3Z2Q3TlJnMXBRbWFBT0xReXEr?=
 =?utf-8?B?Y3NLZ3NNeDB5Mmt1R3I4ajdwRDhoaktEdll3R1JWRUFrVEVKN3hSa1NxQmpz?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3881E1B7302455418C8C06120607F3EF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yG6YsCzikWPGxVDuVUM3Kvy7rqlQs7Ob8nHyz3ZKUPczSWb3ENdRuYnleY0ZRzQQYP+M7NAwn1552IyTAx11ZgH+UkNcZQ29TvaMoTB9fWS5EnHjyYaiOpSupXV+lPSAXZSQhsXqrRN1hKT57Cfy8z6DltuTgsICzNpZI2qR1tEIZWpxRo4rdCn1ihZ9lZ4knliK0JETVYmUeqoR4fjU4LJDV1Y1U/apBqXaIhyYJxzVCW32UbPq7je6muErEUfLHxb5joMMAOMHHV/VV+Px0e+kAnM62U87czHwjAVWlEMKYLEegEmhsC+kb15lHEjfRdzSoWuZcfMK6bJdCwQ5Ri1e3heCEjtJYMGHQumC8gbDk+Hs3oZ+oTbAKzrMiFx4t3jHxhuSRmxINpP8jMNyElIdYSV0kqF+UtkZ2JYBmyQJfupeI3v5MphvVoqQBeF+z3mqG1vDZHAXZTDHK0lnKbbDIqNihcvzJx9b6b5hvjViHcEYEJIfsPavkPso7432EWufcIJ1unePK+sQVgMM8YkdnMI0CS6j2P7l5UzFIanu6lwEWnZ3vWWBTOgD893dk26QHh4kC/8eIHQ61+uiqbP+TF5uZHMZHANhOB1DBkYD3PyD7reZut2zEK0n00hdUptHxmR9nZQPUajdUQQEAGJyhxBGEPaTRpCVmq2G2He9sCY3d1n4RHJ6xwAhmQU2AdtY4mwyKfLgRp0StEtUA/Z5IF7F+oMUXqRb95bfjw+ercrK0YlHnKiGlAk/g1kPeb1p14F04saJQneRKUWzlypFJBNKQbca0z55TzyFKSeKMBk2f+H//ufieN/Jxxn13XUzRf+zJbZ7nSmAgtJCjrRgFfITrMpZSbzUqmsev3jAhVYXgMbliVikX7MkiUniaonu9UqqLVfzR/LvG+SHikBiqbfzmJoNCbAfDFFrEgw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bcb16e-c713-4f81-1ba8-08da802e5421
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 08:56:09.4184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KhJrRzmj9+KoJ3lxhKVa8XYK+JuRBEgWvyeYX0Fso3lNb0XicQ8QKRtx1w8q4Qow/CbOwf48V9v0HOIav212uQ+4FNZZio0hFZsiL70mp/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5380

T24gMTYvMDgvMjAyMiAxNDowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjA4LjIwMjIg
MTI6MTYsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+PiBPbiAwNS8wOC8yMDIyIDEwOjI0LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAwNC4wOC4yMDIyIDE3OjA0LCBKYW5lIE1hbGFsYW5lIHdy
b3RlOg0KPj4+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbmUgTWFsYWxhbmUgPGphbmUubWFsYWxh
bmVAY2l0cml4LmNvbT4NCj4+Pg0KPj4+IEluIHRoZSB0aXRsZSB5b3Ugc2F5ICJwb3J0IiwgYnV0
IHRoZW4geW91IGRvbid0IHNheSB3aGF0IGN1c3RvbWl6YXRpb24NCj4+PiB5b3UndmUgZG9uZSBi
ZXlvbmQgdGhlIG9idmlvdXMgYWRqdXN0bWVudCBvZiBpbmNsdXNpb24gZ3VhcmQgYW5kDQo+Pj4g
YWRqdXN0bWVudCAoYWN0dWFsbHkgcmVtb3ZhbCkgb2YgI2luY2x1ZGUtcy4gSG93IG11Y2ggY3Vz
dG9taXphdGlvbiB3ZQ0KPj4+IHdhbnQgdG8gZG8gaXMgaW1wb3J0YW50IGhlcmUsIGFmdGVyIGFs
bC4gSSBub3RpY2UgeW91IGRpZCwgZm9yIGV4YW1wbGUsDQo+Pj4gYWRkIG5ldyBmbGF2b3JzIG9m
IFNZTV9JTk5FUl9MQUJFTCwgYnV0IHRoZW4geW91IGRpZG4ndCBhZGQgYW55dGhpbmcgdG8NCj4+
PiB1c2UgLmhpZGRlbiAod2hpY2ggSSBoYXZlIHF1ZXVlZCBhcyBhIG5ldyBwYXRjaCBvbiB0b3Ag
b2YgYSBzdXBwb3NlZCB2Mg0KPj4+IG9mICJ4ODY6IGFubm90YXRlIGVudHJ5IHBvaW50cyB3aXRo
IHR5cGUgYW5kIHNpemUiKS4gQXQgdGhlIHNhbWUgdGltZQ0KPj4+IHlvdSd2ZSBsZWZ0IGluIG9i
anRvb2wgcmVsYXRlZCBjb21tZW50YXJ5LCB3aGVuIHdlIGRvbid0IHVzZSB0aGF0IHRvb2wNCj4+
PiAoYW5kIG5vLW9uZSBrbm93cyBpZiB3ZSBldmVyIHdpbGwpLg0KPj4+DQo+Pj4gSSdtIGZ1cnRo
ZXIgbm90IHN1cmUgSSBhZ3JlZSB3aXRoIHRoZSBuYW1pbmcgb2Ygc29tZSBvZiB5b3VyIGFkZGl0
aW9ucywNCj4+PiBhcyB0aGV5IGFwcGVhciB0byBub3QgcmVhbGx5IGZpdCB3aXRoIHRoZSBuYW1p
bmcgbW9kZWwgdXNlZCBlbHNld2hlcmUuDQo+Pj4gWW91ciBhZGRpdGlvbnMgYWxzbyBsb29rIHRv
IG5vdCBhbHdheXMgbWF0Y2ggc3R5bGUgdXNlZCBlbHNld2hlcmUgaW4NCj4+PiB0aGlzIGZpbGUu
DQo+Pj4NCj4+PiBZb3UgZnVydGhlciB3YW50IHRvIG1lbnRpb24gd2hhdCBMaW51eCB2ZXJzaW9u
IHRoaXMgd2FzIGRlcml2ZWQgZnJvbSwNCj4+PiB0byBtYWtlIGl0IGVhc2llciB0byBkZXRlcm1p
bmUgd2hhdCBpbmNyZW1lbnRhbCBjaGFuZ2VzIHRvIHBvcnQgb3Zlcg0KPj4+IHN1YnNlcXVlbnRs
eS4NCj4+Pg0KPj4+IE92ZXJhbGwgSSdtIG5vdCBjb252aW5jZWQgdGhpcyBpcyBhIG1vZGVsIHdl
IHdhbnQgdG8gZ28gd2l0aCwgZmlyc3QNCj4+PiBhbmQgZm9yZW1vc3QgYmVjYXVzZSB0aGUgY29t
bW9ubHkgdXNlZCBtYWNybyBuYW1lcyBhcmUgdG9vIGxvbmcgZm9yDQo+Pj4gbXkgdGFzdGUuIFdo
YXQncyB3cm9uZyB3aXRoIEVOVFJZKCkgYW5kIEVORFBST0MoKSAvIEVORERBVEEoKT8NCj4+IEhp
IEphbiwNCj4+DQo+PiBTaW5jZSBJIGhhdmUgbm8gcGFydGljdWxhciBvcGluaW9uIG9uIHRoaXMg
SSB3ZW50IHRocm91Z2ggdGhlIGRpc2N1c3Npb24NCj4+IHRoYXQgdG9vayBwbGFjZSBiZWZvcmUg
dGhvc2UgbWFjcm9zIHdlcmUgaW50cm9kdWNlZCBpbiBMaW51eC4gT25lIG9mIHRoZQ0KPj4gcG9p
bnRzIG1hZGUgd2FzIHRoYXQgUFJPQyB3YXMgYW4gYW1iaWd1b3VzIHRlcm0gdG8gdXNlLCBzaW5j
ZSBDDQo+PiBmdW5jdGlvbnMgYXJlIG5vdCBhY3R1YWxseSBwcm9jZWR1cmVzLCBhdCBsZWFzdCBu
b3QgYWxsLg0KPiANCj4gSnVzdCBvbmUgcmVtYXJrIGhlcmU6IFdlJ3JlIHRhbGtpbmcgYWJvdXQg
YXNzZW1ibHkgY29kZSBoZXJlLCBzbyB3aGF0J3MNCj4gYSBwcm9jZWR1cmUgb3IgZnVuY3Rpb24g
aXNuJ3Qgd2VsbCBkZWZpbmVkIGFueXdheS4gSSB3b3VsZG4ndCwgYnR3LCBtaW5kDQo+IEVOREZV
TkMoKSBpZiB0aGF0J3MgZGVlbWVkIGJldHRlciB0aGFuIEVORFBST0MoKS4NCkRvIHlvdSB0aGVu
IHByb3Bvc2UgdGhhdCB3ZSB1c2UgRU5UUlkoKSBhbmQgRU5ERlVOQygpIGFuZCB0aGF0IGZvciBp
bm5lciANCmxhYmVscyB3ZSBrZWVwIHRoZW0gYXMgaXMgKHNvIGp1c3QgIm5hbWU6IiksIHNpbmNl
IHVzaW5nIEVOVFJZKCkgd2l0aG91dCANCmEgY2xvc2luZyBFTkQoKSBmb3Igc29tZSAiZnVuY3Rp
b25zIiBhbmQgbm90IGZvciBvdGhlcnMgY291bGQgZ2V0IGEgYml0IA0KY29uZnVzaW5nPw0KDQpK
YW5lLg==


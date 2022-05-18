Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8398452B81F
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331978.555617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHFU-0005qW-51; Wed, 18 May 2022 10:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331978.555617; Wed, 18 May 2022 10:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHFU-0005og-0Y; Wed, 18 May 2022 10:49:48 +0000
Received: by outflank-mailman (input) for mailman id 331978;
 Wed, 18 May 2022 10:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1BC=V2=citrix.com=prvs=130ad9af4=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nrHFS-0005oa-VD
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:49:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39f348fe-d698-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 12:49:45 +0200 (CEST)
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2022 06:49:42 -0400
Received: from DM5PR03MB3386.namprd03.prod.outlook.com (2603:10b6:4:46::36) by
 BN8PR03MB4610.namprd03.prod.outlook.com (2603:10b6:408:9e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.13; Wed, 18 May 2022 10:49:40 +0000
Received: from DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::a932:ea60:fb82:12b7]) by DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::a932:ea60:fb82:12b7%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:49:40 +0000
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
X-Inumbo-ID: 39f348fe-d698-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652870985;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=efAx/8ljS/+OE6+4qUJIgOpijDrZxS8me08+v3JDzL8=;
  b=OgTJRH1vVgBJOH2ym76pS79WYhtrFmbcirxMRtYUr7Pp66plf0rNY265
   jMRLQcl6jcUCuVA5hku0ki2JvBTg7LUOxVY4yjCBVoOC7SN+EE6KEZH5r
   GcdOuiGxx22D9Nto7w1ttwI+VwTaMa6h6Ah397SIIqoJOx8FRAsUUHFy+
   o=;
X-IronPort-RemoteIP: 104.47.58.174
X-IronPort-MID: 71977731
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YmJdmK03bs0jz2UTP/bD5aNwkn2cJEfYwER7XKvMYLTBsI5bp2MFy
 TQaWG6PO/6NNGrwKI8gO4jl9B5QusXTy4JnHgI+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1gsYD3VCx5Dpf3xtsFajBUFXo9PopJreqvzXiX6aR/zmXgWl61mrBEKhFzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82TBfyVube03x9p7ixKNdTXY
 cdfTDNrZRDJZRBnMVYLEpMu2uyvgxETdhUH8QPK+vVsugA/yiRb4Ym0PsDaI+eNG+dfpk29n
 WLI3jzmV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwASEy66R6QDJAGEBF2dFcIZ/65NwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPfdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:GpDdQan+4xFkq0H0tk9vDwgSiI7pDfOOimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVo+VY7bVHHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZek6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z74HSKyGG5fIyQZ0Wd9igF3ekGhlTVfsuaDQSTDFYzjsCnv/ITRsXGRv
 fbAuMlP8Pe
X-IronPort-AV: E=Sophos;i="5.91,234,1647316800"; 
   d="scan'208";a="71977731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPOJvU4Lcyn0qRH1ldNQlT6DVF08RFiyKFBX+k0WtC9Q4Upe/feF50Zd22sCESDkm137u26PxlmzfdNw+Wllylm5Fx4yasFDiktjvrQ2vGtIxnqj5f/KUedjZJfxfPt5Ajn7yXqysPuYx8YE06h2PSB9BS+RciZ+I2JtntS3vWlbauEoeZKFuXH267w8nIbXgkjdUswVnY/jPcY2vNr0DX8cg4wbiz2HmsiLe/EeZdeptZvP/jYFxVNSbPqu7dxqAwFyBEPA/S4gUdSWgZ8vsepZo2GTf7aoP78FrPeNZvrcpWZykET8tE63seiV/Wj5qGoEsFcvRUzumwTz2EPn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efAx/8ljS/+OE6+4qUJIgOpijDrZxS8me08+v3JDzL8=;
 b=Z/wOTv0Z0WhnJLRtQNk+MpSSV6BKnKIYUrRmbtqd6/KhN6x05Pwy7BvVj2Zko9ICMn38Z6QhlSlqNPhgmm1ABPU2SGjHDEaX1M/DUQ2lMa3eFsxK7GwoOcwEN/PR+Kb9bs+F8BV8T1rS2cobN6IgHDK+u1Y3uevbJL1gJsVbe4vrqxvJTsTrHjYLzWJpEftgd5k+WkvIkQ9FTKVaSk1s97Wrlgj2rPSKNMTWNe5EzrvsKoUkfQStpBG0AiJKxh7WgNEnM5g4A5qhiygYdDV2v5rmEbKCSlSU2ZEDd6hah5eY2Hsj9D83aolbGvQzLvLnbqtwEWHYHnG259GBb2JknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efAx/8ljS/+OE6+4qUJIgOpijDrZxS8me08+v3JDzL8=;
 b=rxeMFqy7JDSRfzTl6PP5EVm5+WjF8NDWPNGNzFBRRKa/GT7rKVJShNZM/pUxKTET2vm6NQ7DTOq1O8+/C4FzZcKEF+paPzz9jRlRyLatTKeonvQ6ADxbjJ9xiAeARBEM71hthHtvkYk51GKvoBT6EXKaL0rGEh2A7Nvo91KSWeg=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Thread-Topic: [PATCH] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Thread-Index: AQHYZUnyc7oF7QLoj0+gbrrX4WFU9K0kYs2AgAAckIA=
Date: Wed, 18 May 2022 10:49:40 +0000
Message-ID: <649429ad-d4a8-5a53-45da-74bd8815318c@citrix.com>
References: <20220511151423.20241-1-jane.malalane@citrix.com>
 <241a38af-65cb-a44b-4910-c1c310b7bfb0@suse.com>
In-Reply-To: <241a38af-65cb-a44b-4910-c1c310b7bfb0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45f700f7-352d-48a5-b871-08da38bc1c69
x-ms-traffictypediagnostic: BN8PR03MB4610:EE_
x-microsoft-antispam-prvs:
 <BN8PR03MB4610816C0634FB4D204500DA81D19@BN8PR03MB4610.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kytm9rdMNhxWL8t3adiPaA3ABwcbLYXK5kGfQw1xoVo/MI668iMQ52jjP4d3S9YtWHicCxG3cAyOou8H0+6yDkMkxWYuwYZCCQCjVKOAl8aAHE4R1OYUONjVlKvC/QR+2d9hxMnyiL4ky6I9Vr9ofRFK+2/lC2OuP2kboUqGewJ/ZMT0a4eQFA9WGefRquN0NFfyR+13YfnHyB9862zHWPFGAk4AxyiYuy+sgIhBhNmis4hHCarcMnVVeRjhymOpGWhvLls/a+wZG56HJXAF6wGWDXAf1f0/caefVXf6JvFxo6JjjFTUFqB79sJkgWK6/bT9yWVrPeXoxyL6wTHL6QEUmFvpzqQa3qqiz69+7VgoduAAQOeKJ+C64Gu8lpAFeO+r8I1puW0iMlZ6LQGBvf72AUovxf+3rskc1cvyzDqYaNBGa+8fhLnDpZklP+POymdmC4wmrsrTIzucVgx7U6e61PsLEmuRpv8vwXBg5we/E9FV6WoI/jKLfF1nv8GllPNmtSyFXiaLlk2hqjMyM/0JyfVFJNfHa0v10XfUX0xKvWjK9LSPAhHrZNFRwce7+O3rywoxsQrpQt5IlA+zD5SgbKAclMyv/UGiSs7hSuxeo34+sMOAXqzul71DFT5+PNEeH0HE91ZrEUXdbwn4PtPs4tc2Xbz8usU6VeejiQAJ5b+OYUKRKNPySPInjSTabHbhCIhc5B9OLZ/HGkSq4nKPCB9Xu3rCK5pNBmuwNl6jZ1EknvjICCb2mfM3xDN2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(6506007)(8676002)(66946007)(26005)(5660300002)(4326008)(2906002)(6512007)(6916009)(122000001)(38070700005)(36756003)(86362001)(54906003)(186003)(64756008)(66476007)(66556008)(66446008)(53546011)(38100700002)(316002)(508600001)(31686004)(6486002)(71200400001)(76116006)(83380400001)(2616005)(8936002)(82960400001)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2k1SFRWT1BwcGFxQmI3Zjg0TjMxclFyRzdhSm11YUhoSGlpRzMrY0g3anJq?=
 =?utf-8?B?YVliM3hWOVA0eUx6aks5bS81aVR0V2NJYmVZU2xYNzhWOFE1dFg1MFBuK0d6?=
 =?utf-8?B?Q25vOWNhUnB6UUcxajJXNWgzVklaUktyMk4vNXhjZzZTSExudjR2c0dkQVQw?=
 =?utf-8?B?U0NzcjFmRjBPYytqbHEwdVlRWDVETUV1eEozU1lSYm12a0dNUERVQm8zbEFk?=
 =?utf-8?B?UFNKZktYbDhyM3k5VXJ2N3g1TnNrSUkvK0R2cnkwNGdrSXBQRlZZbW8zV002?=
 =?utf-8?B?SEtjSGl2WlJ0M2xBNlJ2Y0loald0bG5zRjVlWTNDZy9lTHI5aXJJKzBpa1M1?=
 =?utf-8?B?dnphRU83RzFqbUZzZWJhUDRtYnFlanlyaUFPbWptbEJUNWJtVE52QU0xVmVv?=
 =?utf-8?B?aDdtOWJpS1JublVsS2dKU1QzR3NpZWd4VlAzTXk4aUtkV1dwMXVJbkNsS3Mv?=
 =?utf-8?B?Rm5ZSmpWTVY3VGlPRDdKM01QcDhGOFZsQjIxK0lORFRtVUJaMEthb0E4MHpT?=
 =?utf-8?B?RzYrK1ZIQ0wwVGIxMDFKZVlXR0lnQ3Y0VHNwSkllRXNhaVcxQTVVUk1nYjNz?=
 =?utf-8?B?VzdXRys5QjJYdmErbmRFbVVhd0VFYmJBWXdtZ25vK3owcWdRS2VtMnRSSnZp?=
 =?utf-8?B?SHpRVFVqZ2N4MWhUWllqNnNnaFZBSVNvMWQzdW1SeDV5cXNvTC9LUDFEc2hG?=
 =?utf-8?B?TVlNcHZ3cC9aN2pmeVhtK3ZEcHBJSi82VG9NcFJjeHhVK3Vaa3NxeEJ2WjlH?=
 =?utf-8?B?d0xJWGhiaXJPWWpJNlEzZm4rV0tzVkF1dlN1QXZCenVab1NvRnhrL0VnTU1B?=
 =?utf-8?B?b2c5M05oVFA0TWkrV3Nucm5DWExaMEg3emp5K1ZpQkJDTWlFMHJQSWwwMFhj?=
 =?utf-8?B?WGxsY2g1VjRFOXAvcDhYcHMvRGdjVEg2MjJqRG5rbmx6cGV6WmUwYnFhL04r?=
 =?utf-8?B?MGpNdzhkN3ZTZ1lBWEZEamJpV1B1NlJVZ2k5SkdXRE43eEhDSnM0all1R3Rk?=
 =?utf-8?B?QXprSjR1WEhZVUpjWXR3VXdsRTJBU1hwaVFsQVQ4VVNjQUlzdCtNaEF6bjU5?=
 =?utf-8?B?VVVRMVh2blMrRmQvSTBsLysrR0RzSURNT3lzT3lINldaUW5GVDRiUE1QZ0dY?=
 =?utf-8?B?N3NGTnNzVmVSeUcyd2ptUDJPbWJ6UDNMTXJvQ1k1bnEwVnFIQmhOUDdJNFZB?=
 =?utf-8?B?NjlqSkZGdmFrWkNuTnhuTzYxenVoRnFJSnJxMWFpUkppZ2gxUFhFT29uVkFR?=
 =?utf-8?B?WUtDVlplUTZBSFo1MXBURTdkV3phZm00UWYyNjQ1SFR0c0RCMHRrTnUvN2U5?=
 =?utf-8?B?a1NuWWs2dFpCMGdzTzBWc0V6TDhKeFVjVnhudGVjcXk1NFV1RE9oU3BzS1Yy?=
 =?utf-8?B?S3NqaVc2bWRld1BWaGlqQVcwNmpFNWVFVFJkeTZqWTFpR2Y2THBVYnJlc1ZE?=
 =?utf-8?B?ejZqYWtoZzlUdzUyYkw0aUdtenptelBkK2I2NkMrdURNY2RSVlRzeWs3Vndh?=
 =?utf-8?B?MDloMXoyY2NqMStFRmV0S0VhaGJVdDVFeVpQM2I1TE9IblBhWnU2NGhZZCtU?=
 =?utf-8?B?aitPdXJsV0c2Qlc5VXBUdmtKUWpHM3oxYUV1TmU0dzd6Z0VKRVlabmRpcDFo?=
 =?utf-8?B?VEFOZmZPV3VuZVpvQTFJUDlvZkd6TnNoM2xiMXZMSlY0T055TlJUam9YNjNh?=
 =?utf-8?B?dUhBZGlnWTZ1bFhNL3BsVkRmcFVIcWdLRDU1aFo4SlR1OFhIYU1FL29VSHJm?=
 =?utf-8?B?R1VoVW1BWkhzdVh0ZlJoMFl3WHVadWt4aEcwcEpmeTZ6ZE9TemVETEFqMTBO?=
 =?utf-8?B?T0JPWitVWUt4Y3c0VWt6aDl3N3kxNlBOL2RTc1M3TE1heWpvLzFNS3JhWU45?=
 =?utf-8?B?aHZiOUJkVlkwWVBiZHMwamR6REZvTkg1c2lab1U1aVB5S3kzRlZ1ayt1QWNK?=
 =?utf-8?B?SGpBa3hCSFRoNVlDb3Vka0VvMDVJUlBGNVduL0hRa1ZkbzNuNUNtNkVMcGRn?=
 =?utf-8?B?QXQxb3AxdkdOc2ZsZXljeEJVTk5FVXVQbURoeXZnQTlFbjRDV1BCNFdhOUQ1?=
 =?utf-8?B?NFdURjJONllRQkFnR0RyczdCcS8vQjVMajhicjJBY0IzeXFDZTNEVnlic2Rm?=
 =?utf-8?B?RXFvZmFVZUlxN241TWY2clBndVdHbkhrRWlhS3ZLRnBMcG8xazBwbmI0R3hm?=
 =?utf-8?B?QTEvc0M2ejh6TCtKd3pmOXNQT1hlRGFHRnVyWFV3Q1NzaWdFdmQwaERXOUVD?=
 =?utf-8?B?TEExKy9jazlaeTJEaE1YZWNuRGdVZDF5ZEtvbHd6UjVtZ2wvQ2VmUWhZMDZu?=
 =?utf-8?B?RTAzVDVxeE1xNjhmdlVpbm1aYm5qaS9wREMxSHJPcHJiT0tYOVRhenhNSmNv?=
 =?utf-8?Q?i6pBmtSVw9usxVlI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6BCCDF3D6194B4996845574ED28C668@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f700f7-352d-48a5-b871-08da38bc1c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 10:49:40.7887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wjBr9RxmPzQEmOnTDMhU1iAHPcpoBGs4LfQ0t2NVCWzGWxlEORLpK8pvQCnVTlIUQe8H5Zn7hsDinQ76RGbYdDBWu4/DXr+7lMihddXk6wE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4610

T24gMTgvMDUvMjAyMiAxMDowNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDExLjA1LjIwMjIgMTc6MTQsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBIYXZlIGlzX2h2bV9wdl9ldnRjaG5fdmNwdSgpIHJldHVybiB0cnVlIGZvciB2ZWN0
b3IgY2FsbGJhY2tzIGZvcg0KPj4gZXZ0Y2huIGRlbGl2ZXJ5IHNldCB1cCBvbiBhIHBlci12Q1BV
IGJhc2lzIHZpYQ0KPj4gSFZNT1Bfc2V0X2V2dGNobl91cGNhbGxfdmVjdG9yLg0KPiANCj4gSSdt
IGNvbmZ1c2VkOiBZb3Ugc2F5ICJwZXItdkNQVSIgaGVyZSwgYnV0IC4uLg0KPiANCj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9kb21haW4uaA0KPj4gKysrIGIveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+PiBAQCAtMTQsOCArMTQsMTQgQEANCj4+ICAgDQo+PiAg
ICNkZWZpbmUgaGFzXzMyYml0X3NoaW5mbyhkKSAgICAoKGQpLT5hcmNoLmhhc18zMmJpdF9zaGlu
Zm8pDQo+PiAgIA0KPj4gKy8qDQo+PiArICogU2V0IHRvIHRydWUgaWYgZWl0aGVyIHRoZSBnbG9i
YWwgdmVjdG9yLXR5cGUgY2FsbGJhY2sgb3IgcGVyLXZDUFUNCj4+ICsgKiBMQVBJQyB2ZWN0b3Jz
IGFyZSB1c2VkLiBBc3N1bWUgYWxsIHZDUFVzIHdpbGwgdXNlDQo+PiArICogSFZNT1Bfc2V0X2V2
dGNobl91cGNhbGxfdmVjdG9yIGFzIGxvbmcgYXMgdGhlIGluaXRpYWwgdkNQVSBkb2VzLg0KPj4g
KyAqLw0KPj4gICAjZGVmaW5lIGlzX2h2bV9wdl9ldnRjaG5fZG9tYWluKGQpIChpc19odm1fZG9t
YWluKGQpICYmIFwNCj4+IC0gICAgICAgIChkKS0+YXJjaC5odm0uaXJxLT5jYWxsYmFja192aWFf
dHlwZSA9PSBIVk1JUlFfY2FsbGJhY2tfdmVjdG9yKQ0KPj4gKyAgICAgICAgKChkKS0+YXJjaC5o
dm0uaXJxLT5jYWxsYmFja192aWFfdHlwZSA9PSBIVk1JUlFfY2FsbGJhY2tfdmVjdG9yIHx8IFwN
Cj4+ICsgICAgICAgICAoZCktPnZjcHVbMF0tPmFyY2guaHZtLmV2dGNobl91cGNhbGxfdmVjdG9y
KSkNCj4gDQo+IC4uLiB5b3UgdXNlIChkKS0+dmNwdVswXSBoZXJlIChhbmQsIHllcywgeW91IHNh
eSBzbyBpbiB0aGUgY29tbWVudCkNCj4gYW5kIC4uLg0KPiANCj4+ICAgI2RlZmluZSBpc19odm1f
cHZfZXZ0Y2huX3ZjcHUodikgKGlzX2h2bV9wdl9ldnRjaG5fZG9tYWluKHYtPmRvbWFpbikpDQo+
IA0KPiAuLi4geW91IGRvbid0IGFsdGVyIHRoaXMgYXQgYWxsLg0KPiANCj4gQWxzbyAocmUtb3Jk
ZXJpbmcgY29udGV4dCkgdGhpcyAuLi4NCj4gDQo+PiBpc19odm1fcHZfZXZ0Y2huX3ZjcHUoKSBy
ZXR1cm5pbmcgdHJ1ZSBpcyBhIGNvbmRpdGlvbiBmb3Igc2V0dGluZyB1cA0KPj4gcGh5c2ljYWwg
SVJRIHRvIGV2ZW50IGNoYW5uZWwgbWFwcGluZ3MuDQo+IA0KPiAuLi4gaXNuJ3QgcmVhbGx5IHRy
dWUgLSBpdCdzIGlzX2h2bV9wdl9ldnRjaG5fZG9tYWluKCkgd2hpY2ggY29udHJvbHMNCj4gdGhp
cyAod2hpY2ggaW4gdHVybiBpcyB3aHkgYWJvdmUgeW91IG5lZWQgdG8gbWFrZSB0aGUgYXNzdW1w
dGlvbiBJJ3ZlDQo+IHB1dCB1bmRlciBxdWVzdGlvbikuIFdpdGggdGhhdCBhc3N1bXB0aW9uIEkg
dGhpbmsgaXNfaHZtX3B2X2V2dGNobl92Y3B1KCkNCj4gd291bGQgYmV0dGVyIGdvIGF3YXkuDQpI
ZXJlIG9ubHkgaXNfaHZtX3B2X2V2dGNobl9kb21haW4oKSBzaG91bGQgaGF2ZSBiZWVuIG1lbnRp
b25lZC4gVGhlIA0KInBlci1WQ1BVIiB3YXMgaW4gcmVnYXJkIHRvIHRoZSB2ZWN0b3IgY2FsbGJh
Y2sgZm9yIGV2dGhjbiBkZWxpdmVyeSANCnNldHVwIG5vdCBiZWluZyBnbG9iYWwgYnV0IG5vdyBk
b25lIG9uIGEgcGVyLXZDUFUgYmFzaXMsIGluIGFueSBjYXNlLCBJIA0Kd2lsbCBhbWVuZCB0aGUg
ZGVzY3JpcHRpb24gYW5kIHRpdGxlLiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KSmFuZS4=


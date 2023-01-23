Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564DA677AF2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 13:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482819.748540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvyP-0003xi-MU; Mon, 23 Jan 2023 12:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482819.748540; Mon, 23 Jan 2023 12:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvyP-0003uX-J7; Mon, 23 Jan 2023 12:30:53 +0000
Received: by outflank-mailman (input) for mailman id 482819;
 Mon, 23 Jan 2023 12:30:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTo8=5U=citrix.com=prvs=380e0b34c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pJvyO-0003uR-3d
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 12:30:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c35e050c-9b19-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 13:30:49 +0100 (CET)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2023 07:30:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5301.namprd03.prod.outlook.com (2603:10b6:610:9d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:30:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 12:30:36 +0000
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
X-Inumbo-ID: c35e050c-9b19-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674477049;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=o5BpS3JAQgNTbeaqBa9kJtRJ25xvDWQITu5TzmiHT8A=;
  b=KzK8EamNwTidi1x18wDPPBvhTVqSaGOV+dN8eBFUsxsyi9oBlzqxFFOO
   0YGRcDM+E96d/Oq0a4o3jod+YP3x15fL8iZrO1JPKMVFAG7Bbq+GnvAMy
   DUwP8jcS5R/bmMerP3LKw1JihAmQ/hwWcdwxPeLpvTlAoybkAldBoLgL3
   Q=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 92705050
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jqAqm65J9J6MUbuFzxA6FwxRtAnGchMFZxGqfqrLsTDasY5as4F+v
 jQeCDiFafaPMTfxKNlxO9++/R9SvMDRydQyQVc+qHwxHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakR5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 80XEykSbRe5oaGOnqKcSNlit+YgI5y+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+GF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNIS+XlrqMy6LGV7mMIDUcdCWbmncC411y1V456E
 mxE1DV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnNM3QBQ62
 1nPmMnmbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bs/7UZtNqEarwhdqsHzj1m
 mmOtHJn2OxVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:2RY4lqojOS3A63KvYIZGUJUaV5oNeYIsimQD101hICG9JPbo7f
 xGuM5rrCMc7wxhPk3I+OrwX5VoJEm3yXcb2/hzAV7PZmnbUQiTXeVfBOnZsl/d8nbFh5ZgPM
 5bGsAUNDSaNykesS+V2miFOudl6MWb9rulnOLPpk0dNj2CqJsN0+66MGum+4FNKzWuzKBWKK
 ah
X-IronPort-AV: E=Sophos;i="5.97,239,1669093200"; 
   d="scan'208";a="92705050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cebFiT4XOxgJCV1i2TikX6uAMk8p2Y+o6sEeLv5kjFWzqqLupAuecov+HdpJYnovXXoCNhSKKrNQ+0tUc1AY/lz56MulHYnEIYMCD8Pi7UcjHL5JcYnCYqXQSqFJJ0GT+0k52iPgqo/9Qyq/ig40Qpv6X5ZCU/ZvNvup4V3L7D99cjxpNJCyA1AGhlg9K7eoneGIlFscIxEXhM4Bbb3anQFhF+A3gdw7WP+LMSXebme6s99jc4uaM4+NH1Bvj6JOMbhiK4PadwXyvmqIpDcDS6CuY1ZCR9GJIcKLvf+6pRXYvYkGBJm97SWl98gZTI7hyqw12rwhyH4kFec1cQ1Q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5BpS3JAQgNTbeaqBa9kJtRJ25xvDWQITu5TzmiHT8A=;
 b=SmMmyhZtN00NHtF2ts83stQRYx5Ev4cOajxMtPVBTJXWzA3Z2Y4IRp38VBuZpy7rqxb25wuy0byAckUGGF9g4aBiMELVIoUw2DZzJjZDFmkc1ji2Ow/S0yo3wrho9fLjJ4+e0Woj4CihGi9u+P5RFigJRH+Mufihd7+Ty5ejmjtt2PxmlxC64/H0V40tDwLCoo+SBE9bfAVc79oxz0gXt+10w5thszuglA1RJhZ5ouGhmodB/Xt0fq7RbYs6d8RZ/GkXhUDWX5vLdbQ0xICC/H67w0meA5LBI9ICr210msEcgJRLwzUka4qYYj3IL6WcDlxzyyoUv0/GXsdw6+inbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5BpS3JAQgNTbeaqBa9kJtRJ25xvDWQITu5TzmiHT8A=;
 b=dqzbM2c5fu5/CLjJRXulhh4DVsx18VB9w8y+By5E0IC0FqiNioCSMakcnwqmKEh27ST9IEjmLgy6QOgWoJs/gPPVhwfexClj/myK7Xh8MU2hKn5m8UAuzouRXOW+xoJGrD13lm+k2QWq+bUJR6PAAB0X3rko8NfWHc+vC6t1GUk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/shadow: sh_type_to_size[] needs L2H entry when
 HVM+PV32
Thread-Topic: [PATCH] x86/shadow: sh_type_to_size[] needs L2H entry when
 HVM+PV32
Thread-Index: AQHZLwKEbZ+pvxq41k6VhQDqg2rUMq6r0SKAgAAA54CAABzuAA==
Date: Mon, 23 Jan 2023 12:30:36 +0000
Message-ID: <04f5c9ba-24aa-c9be-e8de-a867c897835a@citrix.com>
References: <942e1164-5ed0-bdda-424f-90134b0e22c5@suse.com>
 <79420a4f-358a-f404-7965-e5f215234ba9@citrix.com>
 <2ec2a36e-4264-6c12-c2e6-1af85c91f1f6@suse.com>
In-Reply-To: <2ec2a36e-4264-6c12-c2e6-1af85c91f1f6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5301:EE_
x-ms-office365-filtering-correlation-id: 10d82e8a-76ec-4807-c240-08dafd3da123
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ufobZZjCUiCOpTKhTlYcqBWEaGPVKTKUkF5ZJtP5btKcqq/s++5e/sbJ2wRyCXCq8PJbh220KXmNzDR8MnjPzXqJmqKxD2NAPxyeTTSoh8NpZvWqsP+QD4tOkrR2c1yln/DYyUonckdEu7aNyaSbRvlsdtQrbMsm5rLJU0M18rsilpo41kTexsv30r4rVCW2Gm6SvFTjrt4NW4X+PFvrxOUZ+Jgi2/vqvNU9PfkPPaqwuyG0uHiCoUke1MasKduTL48EHfdK7Df9d7egDBlr/fXG5Mrhz94a2mqPeU35WN7/z2TIPuYPTTgsjFgrKIQtQdQ7rAEuK9D4YldOX2AS1BYIApZw+Q/4sStFn+qLDvsr/z5ngEbXrQbuUJKcG5i0CTJuJtjB8dULKTGGO6MwXkwZEMMge+P5IqydJS/LKuvdukwkrBf7qv91+iuAGwF1flO8GuPby5lhWcpn3sW9L4lBpYD7Aau1cqptm4M0jxCXdEQcEb5VwcFkG3mfEiMaYdFo4pM+wsd/o8Dry9PpdpyBNLby+sCTJU3vbFeBIP3Bychhh7CejMc5Tk3ahCLfWhyEEBum61yiO7xM9sXHlVw3109w3dMhutMStOoTCzo6SkARcOg7LJJ+fD5W+JzukC6jbaGAcmrqwjdTdjRPn3Un0YyDRaGNNt/T/fNte5YYG9QHIIrXFykxx4EjhGBz/Uw440blHTc8jqBL6UYTJx55nJ1bO+D7TSPoL4l/e5WF1ENsdoB6ZHjto3WCxGHflXPxhbzKJP+AiD3NOGWTxw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199015)(2906002)(41300700001)(8936002)(66946007)(91956017)(66476007)(66556008)(5660300002)(76116006)(54906003)(71200400001)(316002)(6506007)(6486002)(6512007)(478600001)(53546011)(26005)(186003)(2616005)(31696002)(36756003)(122000001)(82960400001)(38070700005)(38100700002)(8676002)(31686004)(4326008)(64756008)(66446008)(6916009)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVZEZGMyNVJORFhWMisvNEFDNGFVckJ2Qnp1dTNoZi9pNUl5Tm9hbklQZkU3?=
 =?utf-8?B?eVdZLzVQdXRQTlRRQ3NlTFh3TkxsTnp6V0hKTzZkM0pkWnUzT3djMWx1MGN1?=
 =?utf-8?B?Z1JUOThCekVZcWd0YVAxMXphTlJ2M09la1ZhMFc5OEo3cTRSR3hLN2xtSkY3?=
 =?utf-8?B?T3RKdW1HanlIbDhMMmVpUlBFcW1kNEh4OXdMYzgreUVPRkVGMWwzOUF1TGVl?=
 =?utf-8?B?M2NIRWJPcDlEcEdkVjZ2STdjalpQNnRJV3hhRXpkaUJNQlZUVlo5TGtOUFJU?=
 =?utf-8?B?cWUxMVI3K2FGSDFyaXptZ1VlNklQeERrNk1BZXpGamJqVnhZcVdHSUJjT0dV?=
 =?utf-8?B?V01jVENQd3FSUE1Ya05KLy9ONmNkRHh0V0wrU2xSOGNYcGlGRmpGbUlzOWhZ?=
 =?utf-8?B?N0pHMUFjWk9EOFNnUlN6TldxSktCVXI3S29OeCtlaEZFTHJLTEFLQnlsV1ht?=
 =?utf-8?B?OEV3bVVOZWgrNUE2RjVkbXZxYm1QN0k2Nk5yaFlWd2cxbXJwTmRlVEFNTjVV?=
 =?utf-8?B?a2c3Mnlpa2JnTW5obXk2aEY0M2pUSXRmVGRGS3RhVmxXeUhkdWtoQTZsekdw?=
 =?utf-8?B?Mzlwd1dMdVRNVzRtYzRkQkpleHVzU0VnUjQvR2hmMi9mYkNuYWcwb3RtK2hK?=
 =?utf-8?B?NXpPbE00VU1zeHl6UHhuZ3ZsWEg3bWxjcHdpcW8zbXAvcUR2VE5pTmVDZ2d6?=
 =?utf-8?B?Z3pIN1hWUldXWmlubm9kZ2FTYkVtMDhwaFZKcW9vV2N2cmNFS2xYTFlRS04r?=
 =?utf-8?B?VjFYcXVjSE9zUkhnWVZuZlZWbU1maHpPNFVNK2hGamV5OVAzbGVvU29LZTJ5?=
 =?utf-8?B?WEhhZEZqcnNueXJWcEZNKzBzcm5aUkVQMjBpV2RLL3JMclozRzNTSW5BUHgw?=
 =?utf-8?B?OXZmcnpYNjJpRi9PRVh5SzUwVmdWVUpoWGJjaXBQSHBRWmU3Ly9wSUNDM010?=
 =?utf-8?B?dlNGckdtTmgvOW9SOGtwWlVjRXFEeThnc2tnOTFweGk5YmtjMEVqM0pzTk1Q?=
 =?utf-8?B?aEppbjhHUk1pM1cvcHJZK2NIUlI2bmdkbVp3N3NrK2lqSkV0R0dQTCt5Yk9P?=
 =?utf-8?B?VUdxK255dm9TTi9kYWxDamtWMU9LNE5yeEhWa1o3UUhwdkxiZDljNWVhRmlZ?=
 =?utf-8?B?OUtlZ0JmWWNjYzZIL0t0UDM2Y3hxVGU0RTU3VUYvTzZRUk9UZnFCMGxqY2RO?=
 =?utf-8?B?Mjg0bDlQZHBXS2M4bVpRdWNua2t3VVhlaFZQMGlBTm1BVnVZRGJqR0hvN1Zn?=
 =?utf-8?B?Y3IrUitvM25CNUtocktFL00xUnFOSVpDQ24zWit0bGFZK2ZrYXZBSDRLeFZT?=
 =?utf-8?B?eERPSG9IZVpJMWNSa0QydWtjUnFHWnByMVNRcGJwYVpOY01NUFpZTWg5TG9H?=
 =?utf-8?B?eU1zQUFnelJhV3lsdS93SmJqK0IrNVFKNzVkVUpOSzcxL09sNUh3YWZwdkV4?=
 =?utf-8?B?bUpiNEl6R3hMZHpreUdOM05rV1hDUTdWa1hlQ3A0RzZHODJ5aXhQTlp1dXNk?=
 =?utf-8?B?blJxdVBORjhVWGo4STVHWEtOcVBMbS9vS2NuR0FabThCdXB3QnQvd3JRREZX?=
 =?utf-8?B?eE5jNXZsNVJqRnhyaVBsZDFNQWVvMjljblFXOGZzaXNkU1pLNUlHZHpOUXZp?=
 =?utf-8?B?TVBzVVRweFc4b1VsUU9yR1FrZFQ3S0cwTGF1MUVONnNpNlVRT3VwVzJtYjZF?=
 =?utf-8?B?MFRIalI2Y3Y3b3lzVzRjZlNkZnBrOUo0a0FuNWFyQmdNQzBSQlc3by9yOWRG?=
 =?utf-8?B?b1BIelFIRW5xS3g0Z2pqaUs4ajJtZUJlMWsybktuWEtGWHhKNVowTVp2WTN0?=
 =?utf-8?B?QzJXMWxzSjdOdGZvRytxTERpNndrSWlpNVF0YzAxcWVFWFptNURENi9HblJ3?=
 =?utf-8?B?eVY1clRFdjg3cW5laFdOOTh1M3VwaW8wY2xDMWhNcHJwa1Rva29VTm1PNTNZ?=
 =?utf-8?B?Q2JZbUtmTmVGZ0IrN0hzZk82eG50aUZXeCt2YkZUMlFQS1l1dStNZXVQUDVl?=
 =?utf-8?B?VVBLSy95Umk1THl3d1pnL085TCtMb3J4VXBoY09PYVI2RzIwVk1MU09KVnVl?=
 =?utf-8?B?UGNLNkp0MVpmbHB6ZlZxd1ozUUhPbHNyanJEUXA4aWVGc3h6MThEZUJ2Q0F3?=
 =?utf-8?Q?blBMB2uPyI1KIs2tdqXB9XWwr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A3EB2B5D0548C4985A1DBD6D74EF802@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lrv/eR8qP4b/Ymsg2uLXUter/QyV2EbheudJzHWrTW1vel/BIP7Iub8ItBp2ewmMr+k/7LeHbXrZ1kwco0QGbPREOi1LO5qJg22fmalCRXQQCJTbcXAy2wyIYXeYo/lWtl2samUKPShgmfGhnS47PLhc4WpO5b6FiXcSsViG5x1vLbsCJ3JdUtDE/HXkvk4herGJYJ67il2Wh/c9HrEO5HaOupFCXIw/EzlDFX0G5lXiJRoYM25zrmCRsP11E3O0WnxYHdUddA+JZ+ZjQTZQWd/IzDsC2hGEkewCevCunkJnXby3nqhfHVZ/hu2U41erWVZPJySxjBIQBSN3al+RTfQJosLE2IS6ZkoalqdrCjT7tolvfVfJWgalnvMTTpWbdUc6zMfxOCp2xeuIlVE3IGQR84QzZw0AjAooFomdig15CEcfMe22X4ejLqMUUwRGeRTgGYEgAco5Q+Knql9EqpP1678a0CG89//GSMeRO4hD/eV9aIlMY45wIe4WXdUb+32h9QdgpPcsXvJPoT0LZqEOhYgac0A/4R7+8m5KxHX5gtcIhLgy94UCFTysBkM/4ohPXD4Hn9GYqSIj6yYrfowlLR289/WIbyuNUnsQ5K4XK0uNF7OxNU3bUdnxZ3h61uKrDj+aYGBYCPsFYTOv0sK0jBznpzPUU4UJgXaTsUGWkV3Y4O6/i68+EtDs+yrgQ6aTbiRCoclYWPC/diW8FF6Uz52dGCp+uXrlUwU0Ah9RTpFqEJzSRqzVYcMxQz8yswNALYLKnDUqVf+ihFZRIpgqxBPbnv2LOAE2LXe9osG21r/Zwy3A9yRUOr4WaBRF+7pdXQ87uZGIfFsq9LfADA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d82e8a-76ec-4807-c240-08dafd3da123
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 12:30:36.4029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SybmrRBxlGIOVA8x1kNQjLOlxzo9KtPJm4HsI8Sj0Fh13J0mpBFOkJFYr7TaWFhezoowVli8jUoKftF1YfAWn0keot6mASis9jKDJq1Tm44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5301

T24gMjMvMDEvMjAyMyAxMDo0NyBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjAxLjIw
MjMgMTE6NDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMy8wMS8yMDIzIDg6MTIgYW0s
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IFdoaWxlIHRoZSB0YWJsZSBpcyB1c2VkIG9ubHkgd2hl
biBIVk09eSwgdGhlIHRhYmxlIGVudHJ5IG9mIGNvdXJzZSBuZWVkcw0KPj4+IHRvIGJlIHByb3Bl
cmx5IHBvcHVsYXRlZCB3aGVuIGFsc28gUFYzMj15LiBGdWxseSByZW1vdmluZyB0aGUgdGFibGUN
Cj4+PiBlbnRyeSB3ZSB0aGVyZWZvcmUgd3JvbmcuDQo+Pj4NCj4+PiBGaXhlczogMTg5NDA0OWZh
MjgzICgieDg2L3NoYWRvdzogTDJIIHNoYWRvdyB0eXBlIGlzIFBWMzItb25seSIpDQo+Pj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gRXJtLCB3aHk/
DQo+Pg0KPj4gVGhlIHNhZmV0eSBqdXN0aWZpY2F0aW9uIGZvciB0aGUgb3JpZ2luYWwgcGF0Y2gg
d2FzIHRoYXQgdGhpcyBpcyBIVk0NCj4+IG9ubHkgY29kZS7CoCBBbmQgaXQgcmVhbGx5IGlzIEhW
TSBvbmx5IGNvZGUgLSBpdCdzIGdlbnVpbmVseSBjb21waWxlZCBvdXQNCj4+IGZvciAhSFZNIGJ1
aWxkcy4NCj4gUmlnaHQsIGFuZCB3ZSBoYXZlIGxvZ2ljIHRha2luZyBjYXJlIG9mIHRoZSAhSFZN
IGNhc2UuIEJ1dCB0aGF0IHNhbWUNCj4gbG9naWMgdXNlcyB0aGlzICJIVk0tb25seSIgdGFibGUg
d2hlbiBIVk09eSBhbHNvIGZvciBhbGwgUFYgdHlwZXMuDQoNCk9rIC0gdGhpcyBpcyB3aGF0IG5l
ZWRzIGZpeGluZyB0aGVuLg0KDQpUaGlzIGlzIGEgbGF5ZXJpbmcgdmlvbGF0aW9uIHdoaWNoIGhh
cyBzdWNjZXNzZnVsbHkgdHJpY2tlZCB5b3UgaW50bw0KbWFraW5nIGEgYnVnZ3kgcGF0Y2guDQoN
CkknbSB1bndpbGxpbmcgdG8gYmV0IHRoaXMgd2lsbCBiZSB0aGUgZmluYWwgdGltZSBlaXRoZXIu
Li7CoCAidGhpcyBmaWxlDQppcyBIVk0tb25seSwgdGhlcmVmb3JlIG5vIFBWIHBhdGhzIGVudGVy
IGl0IiBpcyBhIHJlYXNvbmFibGUNCmV4cGVjdGF0aW9uLCBhbmQgc2hvdWxkIGJlIHRydWUuDQoN
Cn5BbmRyZXcNCg==


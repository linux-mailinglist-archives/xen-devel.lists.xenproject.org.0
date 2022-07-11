Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB6C56D74A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 10:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364922.594903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAoLT-0006rn-DX; Mon, 11 Jul 2022 08:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364922.594903; Mon, 11 Jul 2022 08:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAoLT-0006pb-8P; Mon, 11 Jul 2022 08:00:43 +0000
Received: by outflank-mailman (input) for mailman id 364922;
 Mon, 11 Jul 2022 08:00:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VQZC=XQ=citrix.com=prvs=184aca51e=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oAoLR-0006kW-FP
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 08:00:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d134543-00ef-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 10:00:39 +0200 (CEST)
Received: from mail-bn1nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2022 04:00:32 -0400
Received: from DM5PR03MB3386.namprd03.prod.outlook.com (2603:10b6:4:46::36) by
 SA1PR03MB6580.namprd03.prod.outlook.com (2603:10b6:806:1cb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Mon, 11 Jul 2022 08:00:30 +0000
Received: from DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::298d:4044:f235:c782]) by DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::298d:4044:f235:c782%6]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 08:00:30 +0000
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
X-Inumbo-ID: 8d134543-00ef-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657526439;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iew1KypYLNnEardBDEJ1fNDRhWoT8y3h2nRFRCyAQvA=;
  b=bMRRO4jLxwNpRqDis7frfAKMS70Hhv1VmpBhvrgUwTskJcQgpuXCzFKF
   L2EDotYbWpoP7O+jB/wLKVXqBbche4Xjv1LbnPJUbbJVpXQiYDjTtSmX2
   tns7oD8qWiu6zeByk3JwCqiX2r/Jq35klnsTHJePNF0qyUn1eK9wukkE+
   M=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 78058668
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d/4/naxEw/MF7TPOGQR6t+fxxyrEfRIJ4+MujC+fZmUNrF6WrkUAz
 2IYXGyAMqyLYjHzKIogbYy18x9UuZGEydMwTQZr/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY32IHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6qCBdx0RPY32nvVAYUBADmJvNJxU9+qSSZS/mZT7I0zuVVLJm68rJmdveIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeGuOWv7e03x9p7ixKNdTXY
 cdfTDNrZRDJZRBnMVYLEpMu2uyvgxETdhUH+ArI9fRpswA/yiRS74O1CNj1JOayBupchly9h
 HP052HAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQMDDUGWF39puO24makXMlVM
 UsT+SwGoq079UjtRd74NzW6r2SDpQU0QMdLHqsx7wTl4qbd/QuxHGUPST9FLts8u6ceRyEsk
 FmAnNrrBDlmmLyTVX+ZsLyTqFuaKSUTaGMPeyIAZQ8E+MX45pE+iArVSdRuG7Lzicf6cQwc2
 BiPpSk6wr8V1MgC0v3k+Uid22724J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1XdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:Ry8Q2aCmY8qwiiHlHegAsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsv6KdkrNhR4tKOzOW9VdATbsSprcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUWF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlal9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4kow3TX+0aVjbZaKv+/VQMO0aSSAZER4Z
 3xSiIbTodOArXqDyaISFXWqk/dOX0VmgLfIBej8AfeSIrCNX0H4oN69P1kWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5zyJSFcZ4JouZkZkIPwjQa4UqZZa8FJeEZ8GEi6/4Ic7EP
 N2BMWZ4PpNa1uVY33Qo2EqmbWXLzwONwbDRlJHtt2e0jBQknw8x0wExNYHlnNF8J4mUZFL6+
 nNL6wtnrBTSc0da757GY46MIKKI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw/+2ucIxg9upGpH
 0AaiIriYcfQTOeNSTV5uw0zvnkehTMYR39jsdD+pN+prrwALL2LCzrciFcr/ed
X-IronPort-AV: E=Sophos;i="5.92,262,1650945600"; 
   d="scan'208";a="78058668"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRuRurHaUy6auGhEDgknjF7cR7xv50zRQvjCL0LV7esIAyW1U14TQtiRnLeT9yoiPiVU+i4YTzmCdkOqTAnVYufYokAWS+5CjefZLo1hNiAtwcUHmx27lXbImt1vKDRPsybGsXgq7h5F1dKSUSfqzvhV9sydP7uEpg/skMIumds0dQM85CbdDPS+yevVNmIIjb710Bjacr+dymrMgh5GqIPCtTohKl16xrQsZK0HfR+zZqf3b3CFx11ntUUXitKlok+FTethFshbUKfc12fPvKrCykFbbDBgOeOEg50HWP0pOjXpwjJ4SLN6VhQWdCk4EbX/q6bgNJnISWs0faJ8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iew1KypYLNnEardBDEJ1fNDRhWoT8y3h2nRFRCyAQvA=;
 b=IuNbzBBZC7Xe+tezsUQNK7Ws6YqH4e+eKoY4pUrNWmxMoafSgMb6KTslNUjc65VvP1llnT09QQoDTxf91XXTBpJd8bI3ewDlyHvgSoCY+RCRKpzMTnNbJt0/++gVFlDJFjm5DbgY1klNnrCJxHY8A/pyZinH7AoqIgavVbojx2Bjm0Q/UC8/0WLAiwVYqlSg5tpyqrhQX61qqW0TfyTA5tFtpxSi1cB2h3QeesRwc1ZTirAFJpURhBSTnrGGoG2pmghCgGysRxisg21lpp7E5PEMyBMcv+uRQSRUl2vMkVuxaQ9+NUO2BLJh0Yxsh//YsBEbAbxL2gqoIxBvV7RUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iew1KypYLNnEardBDEJ1fNDRhWoT8y3h2nRFRCyAQvA=;
 b=fQoSqA4N6tLt/6Lb4Xf04wOtCM7M4sKyzPQiqozpRPBtplSG1QXoyfkkWMmIZwtKN4QzcBGUstIQsMbFJBzQHN3rVk9Ls3tC5zs39gWdKTPm4sm7IZ9Bx1uYb3fFrUFgSR5z3yu5xOTokDekW3Xb6qpK7CEC21BAjMga4z0vlu8=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>,
	"Gross, Jurgen" <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RESEND v10 2/2] x86/xen: Allow per-domain usage of
 hardware virtualized APIC
Thread-Topic: [PATCH RESEND v10 2/2] x86/xen: Allow per-domain usage of
 hardware virtualized APIC
Thread-Index: AQHYi8Ac3FlD8zBv9U62svKKFrIqXq1nSpWAgAAsEQCAEWpoAA==
Date: Mon, 11 Jul 2022 08:00:29 +0000
Message-ID: <6b01e02b-ba44-5f8d-f766-ac889c28d662@citrix.com>
References: <20220629135534.19923-1-jane.malalane@citrix.com>
 <20220629135534.19923-3-jane.malalane@citrix.com>
 <BN9PR11MB5276AC94021EA92C539D5F078CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <a878aadf-5bc9-184b-d3f8-4e43ffc64262@suse.com>
In-Reply-To: <a878aadf-5bc9-184b-d3f8-4e43ffc64262@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f23fab9-82e6-426f-a355-08da63136c4e
x-ms-traffictypediagnostic: SA1PR03MB6580:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Uf4VU89MUInl3xgKXqkRkZd6IBPX9tj7nXo+WlAmXXwddIgr3Yqez1PS0oqdMx4g4UnFOhPVyGcUxp58xveIdMdI6YifjF2aMZW4L2g3fGXJJzKZFzhT8nRUpYQIfXAnVThG/qU6gT856tWCVIn6xY2XwX8Y/yhjuMlxX53vI0clh9y0gkjxtJl8Z1wVuo18HZfDO453QfKUpXfgVrdsHRRJo5kMZEAYlAME34SQRK45KIFDjB/+b2xb4T+W+6SBC4ORDYo8YcuE2kb2g3mCS46g8ZvXcAxE7wJ9w6d+iy6yCc+xrMYKE+rFk/n1n2RWv0O8Z2JBdRaIj8Kv3ofGVmegEF0Wyd9q+na1WY6OA+AmgC3zf/a0eVeLIk2EqY4yeWIN4oOZW6myuXh8oBTty0CEvpagiSRQOYO8uIMMlfKhlDsAswVlHKIJE+fc+lkLIVW9i0fZR8avH63WxEg5J2UHOgq+yJIWV8t7eLYZ1pBTNGvKJ8V/1KrAy36Zu6FlAJDnx0KaIemMEuSmv2xqK2Mfuy86JI0EUEMYMErlqDzSApxov600FPnrITiYwWs+Ud6n/PXHDj7HT12XwnRtY7R95412sosx1myCNuKpMtky6CIkqtPFt49rVNsnk7XjW/4zjbm7xPMLduGl5+IewJ1cxJ1zcOMrVSwDAMSha/PQxQ0ckOP0dz/TkbImwfflpW+NOIZch550t2C+7b+H5/BOsBvg6ra6/cEPGh7B6M/lraQWWOW7u8Py2s+aemHrnW10LFXPp9ZMj7aVDx97P3owDxadw4NFmsmihOwElZdqx32Ka4w+G7pu/TBxvoCbllH6ZGBm3aMa6X7u/jGlcpxAf1WspiaKQJwdGPotNMI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(54906003)(6916009)(76116006)(91956017)(38100700002)(31686004)(66446008)(83380400001)(36756003)(8676002)(66556008)(4326008)(66476007)(66946007)(64756008)(71200400001)(316002)(478600001)(41300700001)(6486002)(5660300002)(2906002)(8936002)(6512007)(2616005)(186003)(26005)(53546011)(82960400001)(38070700005)(31696002)(122000001)(86362001)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmZaTHlycGFpVHk5NlNVMEFsZkY0UXBGV2FHSUcwWXRFSi82MEZMR2NPemxI?=
 =?utf-8?B?MkM4MEdNVnpZc3kvaWJVZkZLdnlGOWVIZkJXdlJIVWFRc2c3RjhXQXBudUcz?=
 =?utf-8?B?UjJwdTBqekdVTzRXQ1pDR0VYc1pvUGV5SUNBL3k2RnZ3NlFhVFVlZlk2S1or?=
 =?utf-8?B?S3lJTVhSSzVVUm1nc1ZxVk5FblBPcUk0Qm0vaHkrbkV6aVlCYnlvUHNTdEZP?=
 =?utf-8?B?T20wcTJYY0NuMnA1Vm9yY3hMMU9ZOEQvc1M5dHl4SVA2MTlncmg3UHBxbzR5?=
 =?utf-8?B?TXdnRzNldUlPT1BXcXlHR2NJTDBHaGtPMFFNMit0aWk2cEIzSnc3bjNid3BS?=
 =?utf-8?B?TWNnenI1N3RYOWxTR2pMV2Fua0lDMWZuSjlDMVFMTUFYRlVSRTh6VHpLTW9P?=
 =?utf-8?B?YndiNWI0QzgxTE5oYVhidFRHdmtnNWJTOHVOSHRxZXBWcncxbVd3bHpKcmtB?=
 =?utf-8?B?MWZkcUp2aUFlR1NiUHBQNXk5bFQwbXRrTzRtaEVTblRvRGdla2V0cWRFY2Ja?=
 =?utf-8?B?dXkvVm9Zdk9rL0tPV3pmUFljNWpKZHI1RmpQdnZFYm9vNFEzMjVjSGFRR2V4?=
 =?utf-8?B?R0ZUNVMrVWtNbHlnOUpwTER0RlRVL3liZmsrRzB2Q25ETDN4VjJEMzZOdzJ4?=
 =?utf-8?B?eE5OY3dLbzJCM2ZUUzc4MDRoMjRpL1hCa3F1RUVDRUk5eThZRytjMEtzMzE4?=
 =?utf-8?B?N3BaU3AvdFRqSWJKVHFKMzZNZzI5cnpUL1puTXFoQ3Y4NTgzQk1JZ2pEb2xO?=
 =?utf-8?B?UXFYbmVwK0lhdjBlZ3NYZnZvYVBwdTRTZnV2cTBkU0cySVBBNnlselNDZFd1?=
 =?utf-8?B?bktLT2pwd2xpQXJmN0FyUi9Ha21LN2FsK0ZPRmtGV09aWjJKU05qa0N2MTRT?=
 =?utf-8?B?YjB5MlVvdUdpU0FBV1l5djZaL2ZIekJKQVpEanJMY01JUkk0U2pTV1Nybys1?=
 =?utf-8?B?Q2VjMzQ1QXVOSlEvTXExbk5mOE1LR3lGQkhmeUxQeDVIaE1xbGlsdm1GTG16?=
 =?utf-8?B?S0RtelhsbHVZVTNrQitCWjdLbDl3c1B4NGM1R2VIaUJ5UEZYM1ljZDQvWnph?=
 =?utf-8?B?YTBQalpscUd0dUc1dC9KS1JoKzNWMVI5U2s1T05LRGgvcU1LSm9xY2pRYSsr?=
 =?utf-8?B?UTIrY0Y4U2FQT0NmZTBET3BiZWhzcm9FejNML3k4WkhFYXVmK0V4c2FBTWV0?=
 =?utf-8?B?RTZML3M0QVJVK2FMUmNNUzdJamhXRzBKc3pxaU9uRnlmeUsyQ1VGWkR1WlI4?=
 =?utf-8?B?bGx5M0U3c0hsaGt6SDNoK1dDUi9PNU55YnNuU1JZVG5nVnN5ZGFZLzIwMzJY?=
 =?utf-8?B?MGZPRjlIMFJiK3o2UDhJdWE3NE5JZVpTUFhtNXAyd3U4YklFN0FHTG02SEhL?=
 =?utf-8?B?RmdEYUtvaHBObUVRaGZYdnJTWDBvakVxa3FwYkFoMUtqWnZLOFgyWFFiWGlM?=
 =?utf-8?B?VEpnRENrbE9YMXUrZVVwU1hRUHZiRFBNNnR6SzRLem0zSjVmT0VNM3dUWXJ3?=
 =?utf-8?B?VlNnRkgyUmJLYkFNK3krUG1Ob3BmdElZOEtTZUtHN3hmejRsMEJyblIrMWha?=
 =?utf-8?B?QWwxM0JXRStRbkVFVGFMVlNyd3FrS3hWcy9IR0NTbmtZMlNOYmZRTUhzNHZ1?=
 =?utf-8?B?UVNUWUlNaTNDNXdoS28rdmZsTUtIVFg4R2crd2lBakdTOFcyVDVYei9TSDU1?=
 =?utf-8?B?enk1Rkx1WmNTTFV6d2xtWVVxRHNqS2R6a2F5MFVoYlNUa2dCQ0F3UlpZSFlC?=
 =?utf-8?B?R0J6TWtVMFFCYjlteDhxdGNzS2xFZFpUOXcwTnd1L05pMldHT0htN2VpQXEz?=
 =?utf-8?B?MFQxcnhHNUlxMWNhVDlKTjBtdVZDOFhmOGtZS2J4Nm9BRzcxS1BicEZGeEJy?=
 =?utf-8?B?cEQyczN0aTZrTVJhbFMzMThpNmpZNkhGZGNzQkE4cnZjdTJVU1BqWVQyWVlP?=
 =?utf-8?B?cmFFSFdRdUlpOUVlN0VLbkRZdDhCQ3EvRXM3RkNiY2QrR2VyQ1hpcUFMR3dD?=
 =?utf-8?B?TGhYZlMzdnpyTkl6SEEzRm5mampHYlhwODBSVXJCZ3oxb2t1WkszQTVnamgv?=
 =?utf-8?B?N0tOOEFoUTBDVVZvc3pWK0IzNDhPaitqeXZOYlMyd0MwWFYwS0oycitLMzdY?=
 =?utf-8?B?SlhkcXlWa2l3Y0VFTGFOWlFWbmMyZndpRjRaNzFGRm9JR2VLYjB2bzhmYUh2?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D4F541CE45799458B4BE8AAB81E92D9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f23fab9-82e6-426f-a355-08da63136c4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 08:00:29.8655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lib7TMgG5GO0LktYRuYYs4RdvV0mHCYAzbVa0/cQ5HKAlZqXpUvXBKoWxUIO7Lpb8llPHDwXpkJ8hb0MnPr8JbA0lKLu1VD5c8iBEg0tpQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6580

T24gMzAvMDYvMjAyMiAwNzowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDMwLjA2LjIwMjIg
MDU6MjUsIFRpYW4sIEtldmluIHdyb3RlOg0KPj4+IEZyb206IEphbmUgTWFsYWxhbmUgPGphbmUu
bWFsYWxhbmVAY2l0cml4LmNvbT4NCj4+PiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjksIDIwMjIg
OTo1NiBQTQ0KPj4+DQo+Pj4gSW50cm9kdWNlIGEgbmV3IHBlci1kb21haW4gY3JlYXRpb24geDg2
IHNwZWNpZmljIGZsYWcgdG8NCj4+PiBzZWxlY3Qgd2hldGhlciBoYXJkd2FyZSBhc3Npc3RlZCB2
aXJ0dWFsaXphdGlvbiBzaG91bGQgYmUgdXNlZCBmb3INCj4+PiB4ezJ9QVBJQy4NCj4+Pg0KPj4+
IEEgcGVyLWRvbWFpbiBvcHRpb24gaXMgYWRkZWQgdG8geGwgaW4gb3JkZXIgdG8gc2VsZWN0IHRo
ZSB1c2FnZSBvZg0KPj4+IHh7Mn1BUElDIGhhcmR3YXJlIGFzc2lzdGVkIHZpcnR1YWxpemF0aW9u
LCBhcyB3ZWxsIGFzIGEgZ2xvYmFsDQo+Pj4gY29uZmlndXJhdGlvbiBvcHRpb24uDQo+Pj4NCj4+
PiBIYXZpbmcgYWxsIEFQSUMgaW50ZXJhY3Rpb24gZXhpdCB0byBYZW4gZm9yIGVtdWxhdGlvbiBp
cyBzbG93IGFuZCBjYW4NCj4+PiBpbmR1Y2UgbXVjaCBvdmVyaGVhZC4gSGFyZHdhcmUgY2FuIHNw
ZWVkIHVwIHh7Mn1BUElDIGJ5IGRlY29kaW5nIHRoZQ0KPj4+IEFQSUMgYWNjZXNzIGFuZCBwcm92
aWRpbmcgYSBWTSBleGl0IHdpdGggYSBtb3JlIHNwZWNpZmljIGV4aXQgcmVhc29uDQo+Pj4gdGhh
biBhIHJlZ3VsYXIgRVBUIGZhdWx0IG9yIGJ5IGFsdG9nZXRoZXIgYXZvaWRpbmcgYSBWTSBleGl0
Lg0KPj4NCj4+IEFib3ZlIGlzIG9idmlvdXMgYW5kIGNvdWxkIGJlIHJlbW92ZWQuDQo+Pg0KPj4g
SSB0aGluayB0aGUga2V5IGlzIGp1c3QgdGhlIG5leHQgcGFyYWdyYXBoIGZvciB3aHkgd2UNCj4+
IHdhbnQgdGhpcyBwZXItZG9tYWluIGNvbnRyb2wuDQo+IA0KPiBJbmRlZWQsIGJ1dCB0aGUgcGFy
YWdyYXBoIGFib3ZlIHNldHMgdGhlIGNvbnRleHQuIEl0IG1pZ2h0IGJlIHBvc3NpYmxlDQo+IHRv
IHNob3J0ZW4gaXQsIGJ1dCAuLi4NCj4gDQo+PiBBcGFydCBmcm9tIHRoYXQ6DQo+Pg0KPj4gUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPj4NCj4+Pg0KPj4+
IE9uIHRoZSBvdGhlciBoYW5kLCBiZWluZyBhYmxlIHRvIGRpc2FibGUgeHsyfUFQSUMgaGFyZHdh
cmUgYXNzaXN0ZWQNCj4+PiB2aXJ0dWFsaXphdGlvbiBjYW4gYmUgdXNlZnVsIGZvciB0ZXN0aW5n
IGFuZCBkZWJ1Z2dpbmcgcHVycG9zZXMuDQo+IA0KPiAuLi4gSSB0aGluayBpdCBpcyBkZXNpcmFi
bGUgZm9yIHRoaXMgc2VudGVuY2UgdG8gc3RhcnQgd2l0aCAiT3RvaCIgb3INCj4gYWxpa2UuDQo+
IA0KPiBKYW5IZWxsbyBKYW4sDQoNCkluIHRoZSBwcmV2aW91cyBlbWFpbCwgSSB3YXMgcmVmZXJy
aW5nIHRvIHRoaXMgZGlzY3Vzc2lvbiBhYm91dCB0aGUgDQpjb21taXQgbWVzc2FnZS4gSSBoYXZl
bid0IHNlbnQgb3V0IGEgdjExIGJlY2F1c2UgdGhlcmUgd2FzIG5vIGNoYW5nZSANCm90aGVyIHRo
YW4gdGhpcyBvbmUgc3VnZ2VzdGVkLiBXaGF0IEkgc2FpZCBlYXJsaWVyIHdhcyB0aGF0IEkgdGhv
dWdodCANCnRoZSAiSGF2aW5nIGFsbCBBUElDIGludGVyYWN0aW9uIGV4aXQgdG8gWGVuIGZvciBl
bXVsYXRpb24gaXMgc2xvdy4uLiIgDQpwYXJhZ3JhcGggcHJvdmlkZWQgY29udGV4dCBmb3Igd2hh
dCBJIHNheSBhZnRlciBidXQgSSBhbSBoYXBweSB0byByZW1vdmUgaXQuDQoNClRoYW5rcywNCg0K
SmFuZS4=


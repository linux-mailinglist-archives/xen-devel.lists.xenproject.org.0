Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D355288C7
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 17:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330026.553334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqcch-00010H-E4; Mon, 16 May 2022 15:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330026.553334; Mon, 16 May 2022 15:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqcch-0000yE-Am; Mon, 16 May 2022 15:27:03 +0000
Received: by outflank-mailman (input) for mailman id 330026;
 Mon, 16 May 2022 15:27:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AqC=VY=citrix.com=prvs=12853b261=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nqccf-0000y8-PW
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 15:27:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a057a6b4-d52c-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 17:27:00 +0200 (CEST)
Received: from mail-dm3nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 11:26:57 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BL0PR03MB4004.namprd03.prod.outlook.com (2603:10b6:208:65::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 15:26:55 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%6]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 15:26:55 +0000
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
X-Inumbo-ID: a057a6b4-d52c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652714820;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=d/V2acFVS7vzd2Gr0vRi+9dQfQBC0UTxPxQsp/pELb4=;
  b=IRIsQF0pIa0hbK5jYWDhhQ8ZBGlnJ7/2EiFIp1Ec2T2emJH0OgOUy1a0
   XrS/gWbXsHqm7q/1hELN2/2+E3u/gfRJaLfSHv4v8WZBoTFAmvI3lQILi
   impJvf+eHUFAML6lyvIZgBv8CZT+PLK29ov1dMBcVrc3hxlpaLkTLx2H6
   s=;
X-IronPort-RemoteIP: 104.47.56.42
X-IronPort-MID: 70791172
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rD8hP6n906Cq1W5TnaTAz+jo5gwvJ0RdPkR7XQ2eYbSJt16W5oA//
 9YtKSrfbaHbJie3LscnK96GQXl2ucfSyNQyHlZrpCpjF3xE9ZLJD43GdRuqMynIf5adHRw84
 5lBZ4nKd5w+QCSF+RmjaLK79HJ23PmGH+ejV7DOYkidKeMcpAIJ0HqPzMZl0t4AbaGFPj6wV
 fPOT+z3ZVP5hW4vbzNIsv7e+Rkx7Pmq4W5D7lZuO6wb7Q+Cx3VEUJ5HKa+PdHapGYM88sxW5
 grgIBNV2kuDon/B3/v8yu6TnnUiG+KUZU7U4pZvc/DKbiJq/0Te6Y5mcqtFAatro2/RxYopl
 YwT7cXYpToBZcUgpsxMC3G0LAkmVUF20Oevza+X6JH7I+XuKhMA8t02ZK0EFdRwFtVfWAmiw
 ccwOjEVBi1vssrtqF6NpkuAsex4RCXjFNt3VniNVlg1B95+KXzIa/2iCdO1QF7cLy2BdBrTT
 5NxVNZhUPjPSx5MYG4VCoo1p/ep2EijdzZXp2u7hINitgA/zCQpuFTsGPz8X4TQAOlwxQOfr
 G+A+HnlCBYHMtDZ0SCC7n+nmu7Im2X8RZ4WE7q7sPVthTV/xERKUEFQCQT9/Kf/1hTWt9F3c
 iT4/gIBoK8o+0HtYsT7WxSgiHWFogQdS5xbFOhSBASllfKLsl/AWTJsojhpbtYBlsQZfgAT2
 xyOn9XvHB5js4XKVifInluThXboUcQPFkcAeCsFQA0t89Tl5oYpgXrnTNxuDaq0hd3dAizrz
 naBqy1Wr58el9IR3qO3u3XOmSuxp4PhRxQwoA7QWwqN9RhlbYSoY4ip71nz7vtaKoudCF6bs
 xAsi8WYqewDE5yJvCiMW/kWWqGk4e6fNz/RikIpGIMunxyv9GSkZpt4+yxlKQFiNcNsRNPyS
 ErauAcU6JoIOnKvNfBze9jpV55syrX8H9P4UPySdsBJfpV6aA6A+mdpeFKU2Gfu1kMrlMnTJ
 KumTCplNl5CYYwP8dZ8b711PWMDrszm+V7ueA==
IronPort-HdrOrdr: A9a23:Wj3Su6yrztsT4z+isi96KrPxgOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk80hqQFm7X5XI3SETUO3VHFEGgM1/qE/9SNIUzDH6tmpN
 9dmstFeZHN5DpB/KDHCWCDer5OruVvsprY/Ns2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUezpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZrcI5p4dYyxY/ouW3fRYzWTFcFcsnq5zXQISdSUmRUXeR
 /30lAd1opImjXslyqO0GbQMkHboUoTAjnZuBClaDLY0LLEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77WzAD0ihbWAUqqOYmwtVrQcotQ0XbWLeUs4ikaUPuEdOVJsQFiPz744qVO
 FoEcHH/f5TNVeXdWrQsGVjyMGlGi1bJGbNfmES/siOlzRGlnFwyEUVgMQZg3cb7Zo4D51J/f
 7NPKhknKxHCsUWcaV+DuEcRtbfMB2HfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPIcFyZMj8a
 6xJ2+wdVRCD34GJff+rKGjqCq9MVlVdQ6duf129tx+pqD2QqbtPGmKVE0u+vHQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.91,230,1647316800"; 
   d="asc'?scan'208";a="70791172"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlVKw9hzAVy4lxLQ573sW/sw6BCUDmwECDrDHb1cp1LdpTdeccGoWfn++oy7Fujb1g5y/MgXSPalQPVNBdjgvhaRuUKJVGOT+aucxntxXbTPdfVO5U2sfVmi9bOBhyE+baotGwjC1+RroRBOFDJngggkF1xaMuMo5R9iK27u1QbvbS49SxoNIL3pLiWi6nIlwH/FhRej+mo3K6sHfpi0XPmlEJ9pfliKOcgDavMexSs01OEVusP3N0mpCziDHK4A3jGnYAHojJIXqyBu7NQj9XmaKBQ9WnihaqAgnlcf11BoIBUDrQKVtuCERcY21YtVIQDUPxJBTs7zAGHLcfwhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5ioPv1ZSZK2Cx2QMXhFiXo5oWDmtWmFZAFjma3ja4s=;
 b=mQ+xbfksmcMqWGBT41Xpll8GlI+MMyHDxpA+kfjzvQQvgKjGXy5BccSZ+AolWbLe67c4ZypFa1LDpYHMqsbwWZ4PhyI9STWcVICbfgi28gwGiq6Rw3HCee8QG6WYL6099MAb/nxjmrmEfjjM5ec5VjWLh7slVx0xWzRP/esQhNDXIpuMAI+3dMby0WezFjYdghOXJTZrQv6UxdU3/4+LvtYG48il6CYHcmVF1Iq8BMUq3J9jSV4VTugtC75w6qJPKcF0YBkPP0rq+1nrRetW2NOn2PU1GWkcHkav1WLE2nYhZiZVVjKVB+jm5dky/V6qWQDZHk2gpg3vf+UcQRZCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5ioPv1ZSZK2Cx2QMXhFiXo5oWDmtWmFZAFjma3ja4s=;
 b=riWaVgUbr6MPoINn70oIvg5QiR+XRztXkvMFoInMBbBp4XaaaCmNYPMtZ12f0nRIEl1xr83jPmm/mc4w1IT3quZ64HAGCk8LRCacirBfUohI+yrAeQn63e4hwQDfiD3nbwNhwK4RNWdtOITZgufcXcoSsh0jl8wAKH6TQxIB22M=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: Process for cherry-picking patches from other projects
Thread-Topic: Process for cherry-picking patches from other projects
Thread-Index: AQHYZtZ1suK3TAKIFU2tuY9R7u+Tcq0hnruAgAAEpYCAAAGxAA==
Date: Mon, 16 May 2022 15:26:54 +0000
Message-ID: <52224003-C93D-4136-866C-2958A28D2A52@citrix.com>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
 <c1d34c23-8f99-71c7-4b60-01c7a8773a92@citrix.com>
 <7903619c-4a6e-802d-289c-03aefbede967@xen.org>
In-Reply-To: <7903619c-4a6e-802d-289c-03aefbede967@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bf7f9e0-82ba-4ac7-f1d3-08da37508254
x-ms-traffictypediagnostic: BL0PR03MB4004:EE_
x-microsoft-antispam-prvs:
 <BL0PR03MB40048572508A6F009EBA603799CF9@BL0PR03MB4004.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vTECly1M7fr4xrUjrBjtTt3il6rEDK4sVCWIpzpyKfXJ/BQbyo2mGz9mWaXtAzL+l/hfYb6bpKMM/asfpCX1qWUXe8LscB48abVIskhaDW2OyAUUl6fEtCiIIeBcbB7fTRt3OILu/Q/n24KwXIXxF0brYpHGAMBnk6rJIBGxpsV0kG7E8Liu0zC98RcWDSubCKPDr4yru8PSkZLQu9qDKTKr8/UVjkC5FFysW+W3+K0GwC4q2zo+qNMYfUWoOaMhyC5WTnXFJRLdOLN4/MtaJZng2M2TtueVj9+FenyraDbk0kTFlkD7HLlog6irmM2QDJWVJjICu8kZzWP5F9vAme6v7srG+hThqCPeolHlarbnyjlHYFP8qxVzGoCvpFokGgu0uydgs3IrGFIqbvOQvOElYx9sFIfhD4tO/pe91nt5v1I32ftbW/TNBYVyfEWQYMa6g9mU/PDb9Nga9x/wSaBeeMVR/OXnaNV9KffudcjAtRJmJgw4ezZWSUb8E5n+1t/KBGJ+Alc0DydqbHi3zu0CU9DuFIZpTWhLIMS1uoMIe+Xje+vqlqrhYXk0SW28H9RCtQTWpt5LNrdKint2WYywwH/STizbg5R9FkcJKQXTd4iWDLh6a6SNJ5o45hlpXp/oyjGIXhz7wmXjm4QRKDKYL2/4hKjqkZDc2VmyCSclvWJvNaKK+g7/D8m4g/BVUhoivx+eigzlvujb78ivJ2br1lVqXOzOt2DuadZ4NrPunnCyDmVENIS6+jULAYoB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(8676002)(4326008)(6506007)(66946007)(66556008)(107886003)(2616005)(64756008)(82960400001)(33656002)(91956017)(53546011)(66476007)(66446008)(8936002)(2906002)(26005)(6512007)(71200400001)(6486002)(316002)(54906003)(6916009)(508600001)(86362001)(83380400001)(38070700005)(38100700002)(36756003)(186003)(5660300002)(99936003)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UXhmMWRobmdZM0x3bFE0Q0VYQ2o5Qi9USlJpcUpnbTQzRkRHb3A0UTU5YnM2?=
 =?utf-8?B?ZXA1c2NsTGl5eWFEVmdjbWFROEI3TjFYZUZrVXdVZG5nQ0E4ZmZuenhKQU9D?=
 =?utf-8?B?UllVWCtSUU9mZGlTc3VyaStBNHNuOGFMSXU1ZTBEVU1uSXN4UXVlVTcreW9r?=
 =?utf-8?B?NytJQ1hTTEduRjc3OHBxK1ZYaFR3Um5RekxCeXVieGRBbkdFQ1JGZ1JqazhS?=
 =?utf-8?B?RytkVVYwZXp2citoQlNqYmpoajI2M3VOOUNZRXFmM2VIVFYzWjUwRGZTT2U4?=
 =?utf-8?B?Zkw4UTdPdFh2djI5aDViSFhYMkJRTDdyNXJnQjBLUzcwOHQxVDRGczc5Ym5L?=
 =?utf-8?B?a0VzMlVNMUgwcmppcnhlSUJUMmZIZUFpZzNIcnJlUkcxRFQ5UmE0MG5vYU9T?=
 =?utf-8?B?ODc4L1d1a2U2bFVsTUEzTTJZZzRDWkh2WnBiaWtZWHdKZFRJK2xNcFZrUEdW?=
 =?utf-8?B?SWNFejV0eStzam91cW1sUTRXNnAxalU4elpIUkhBR0xsL1RXTDVrNDdoM3BK?=
 =?utf-8?B?WmErKzl0TmE0bkxTYUdVYVVBZGE1OTBodnRRU3dHOHQyWi84dks4b0JZL045?=
 =?utf-8?B?Q1FScG1EUk1xT0ZqeWVWUm0wdytUcnJwQWhXU0U2YkpOdlJUVUE4aHJzbzdh?=
 =?utf-8?B?UUd4akxQNzUzaG9TU3BDbHczVURkRnYxZzVPb3FweTkwejFsTndlZ2MvaDlV?=
 =?utf-8?B?UlVneS9aNmhpb2NKZS8rKzUxOTNDNGdLZTNyc1hIcm1IaHduanNQWW8rVTdR?=
 =?utf-8?B?elp5WVFNZm9IRk1mU0UvUnZ6MXRYZkJsRExaZnR2NFFiM1RncE5CR09jOGFQ?=
 =?utf-8?B?SHNsUGlKTWI3cEVmZEdhL0I3WlZEb3pmL1hRRmFRVlhaYVM4eWozdmVhdXly?=
 =?utf-8?B?bTk3M0FSdTVpRkNsSVZsTmtnZTdhd2Q1SjlFbFVvS2Uva2RxdVowanVETzdB?=
 =?utf-8?B?V3R3djJXOWhnYndZdEJxdXBxWk53YUFiQlJZVDN1Y3czRzZyTHNoMVp1dEpJ?=
 =?utf-8?B?S2U1M0ZybzljMG5RQWdaVWFVUXluN1ZYYmtOYVd5L2ppRXdtUDRuaGxCcFpO?=
 =?utf-8?B?emtmMU9jSW9KS0c0VU5XSjNGdkFvdFpDcDc5RGxrREpDdjNJcG1BZGtHdVU4?=
 =?utf-8?B?emZhZUNQWGZMTXVyUXFCQXI1UG5SRXgwTHZtZS80KytDU2diQi9jT0pCK0JB?=
 =?utf-8?B?am5Pa0crYTVBeENNcWYzdm5ObEQ5MEROWmt1Q3BSODBjbnNIRlBDQzJSMlJh?=
 =?utf-8?B?ZUN2bzhTZ3FlelltNXIrU1BWN3ZvQjY3aWVNbGwzZXROWnp6dVJJTWJkRmkv?=
 =?utf-8?B?c3FsM1JUajc2VXh4QnpDU2dwYSsvS2pGQm1LZGM0NlNHc2ZzN0pEZkZ0R1Yy?=
 =?utf-8?B?anhjT3VVM2tIYTV4enZabXRBMHY0NHNmNERodzFUWDB1UndQUGtEbGNnQkVH?=
 =?utf-8?B?ZjFzLzNXL3o5NUZVWDJKa3lUWm5pUWhxV2FtTG1Nc2czYzhYZDdIY0hBMzJS?=
 =?utf-8?B?SHdOZGlzNCtEa09RSDRRNE1XMDFGdUxUcHZBZlR5ai9TV1lsTHZXbWxqMndL?=
 =?utf-8?B?OHJJYmxYT1NFWHdsekczS3VsVmMzRHl6bXJqZVRVNjhCS1cwdEVQQzQ1OC9i?=
 =?utf-8?B?RXVBOVNNZlN5VllkY25PakduSFVNdGprd0xXYUhoK0R5aDJBY2IrRXR3TVJw?=
 =?utf-8?B?dXlEeThIT0ZRekJ4NmZUUmlCZ0k0WnR2dmRRV2RUTXRMSTF2c21UWWN6Rmk2?=
 =?utf-8?B?RUVNMDZJSmx3d0FMcWJENkdyd2xpSS85bm1DUDZaUFQ1UCtzS21zNkhlVzdC?=
 =?utf-8?B?N2lzdzREeGRranRtNWFiUVBiRHVZQmUrYUMwQmpma3MvMnZnV3pTZjJyMFlu?=
 =?utf-8?B?K1ZPWWdpcDNZQkVhU3ZCVEUxaTNha0llQWhINUd0Uzl5aVd0eGYrL0hTTzJa?=
 =?utf-8?B?RVlPSS83WEJpTmpVOUVjRkNYTnE5c1NNRkVKK2Y1TkxQUUFsZjNQVTJKR21u?=
 =?utf-8?B?enJaeldZUlgzY3pwTElNNWZkTm5NTU92SC9hNEQ2cDVrTDFQcTRVV0JyLytS?=
 =?utf-8?B?RHk3VUgwN0NaWnFncmxqT09mc0ZmSUNBWXhDVUV2bWd4Zi9UbWQ2RGJNdHhl?=
 =?utf-8?B?YkFMWG1DejJCTmxwZTBzNlJlTUd2VXhaZmVpelhqeXlwMTBsZW01NGo0dEVj?=
 =?utf-8?B?enlYK3RrZ3RDaW1SYzRlVGdjZDN4a29ZVml3WWw0RWN6VHQxTi9ZaElVTjUr?=
 =?utf-8?B?ZjM5ZkZ6TEM3Rklkc2Y2ekZUemtvRFdiT25iSlp0SXJpMHRQdjMvUkduM3dO?=
 =?utf-8?B?REtHZGY5Wk9GOEdYTFhyZ1UwQk40QnZkL0tqcVJtQWl6Qm5ENTZHTS9kMTFu?=
 =?utf-8?Q?pO1l3W4G1EtZveNA=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_68762BA6-6632-48DB-8580-962503A3258E";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf7f9e0-82ba-4ac7-f1d3-08da37508254
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 15:26:54.8300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uRimrJHP87ga+xCeAcXRGUGzUdzHuEEt/Z0uB4SbfU92+cPVaFA6k5OWttrxU7GMMao7lMxNuPK3NAs4A/uB4OonjAw04qzOKL37fe/QjzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4004

--Apple-Mail=_68762BA6-6632-48DB-8580-962503A3258E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On May 16, 2022, at 4:20 PM, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 16/05/2022 16:04, Andrew Cooper wrote:
>> On 13/05/2022 15:33, George Dunlap wrote:
>=20
>> IMO, a commit message saying "port $X from project $Y" makes it =
crystal
>> clear that the original code change isn't mine, but the porting =
effort
>> is.  Amongst other things, porting invalidates any review/ack/test =
chain
>> because those tags were given in the context of the original project,
>> not Xen.
>=20
> This seems to contradict our documentation:
>=20
> "All tags **above** the `Origin:` tag are from the original patch =
(which
> should all be kept), while tags **after** `Origin:` are related to the
> normal Xen patch process as described here."

And indeed, part of the the point of that paragraph is almost certainly =
to clue you in that the =E2=80=9CTested-by:=E2=80=9D is for the original =
commit, not the Xen commit.

That paragraph is clearly expecting the case where individual commits =
are cherry-picked, not batched or done with an entire file.  In large =
part we seem to be in agreement, so we just need someone to do some =
wordsmithing of some text to update that file for the =E2=80=9Cbatch =
update=E2=80=9D and =E2=80=9Cimport a full file=E2=80=9D cases.

 -George

--Apple-Mail=_68762BA6-6632-48DB-8580-962503A3258E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKCbT4ACgkQshXHp8eE
G+1aRwgAm7+QHDGJD2IZeA0mQ93AsYYbkeL1ZwK6/Qtfni1J5zLXffEq0R5Lsjew
iaTof5QHX5kPA4URifyaathJyhs/7oigSo+TNshZqhsXfPWLDMy6BYmRcz5WKoz6
Vnai8trq87u6F4jp7Lg7VKaVFyyCdl94PGKZTyQWykfyQLYrq4fdTSe0hUxPxeal
SIBKs2yCsMjrTxLjk6pvdmMVH76BuKCjMeizByJRAa6Zf8E/QnHQbZ/oBQIFttDc
b4oEwvOqQjq7MKchVDIgJA0ru1/SXVGAeBTIeCfy975Fk9X+AB++do2NfTwrmeYy
Wtmtym0HbFmoJEINZKUDZRr1skWfBA==
=Bnp8
-----END PGP SIGNATURE-----

--Apple-Mail=_68762BA6-6632-48DB-8580-962503A3258E--


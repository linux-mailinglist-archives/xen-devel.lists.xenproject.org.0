Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B106365C3B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 17:29:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113862.216935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsJu-00015h-Tr; Tue, 20 Apr 2021 15:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113862.216935; Tue, 20 Apr 2021 15:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsJu-00015I-QJ; Tue, 20 Apr 2021 15:29:46 +0000
Received: by outflank-mailman (input) for mailman id 113862;
 Tue, 20 Apr 2021 15:29:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYsJt-00015D-4Q
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 15:29:45 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a63b506b-a71d-4d27-aeec-a29fbd141aac;
 Tue, 20 Apr 2021 15:29:44 +0000 (UTC)
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
X-Inumbo-ID: a63b506b-a71d-4d27-aeec-a29fbd141aac
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618932584;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=F5fdLULuMxSnIb8YV0QTacQPuOP6sj3WmSI/Qou3H/A=;
  b=GUR+SHVAuG97MeR+zCM1anlDKnpPFQggeOrjMpH4x+f1PkdGq6m8UvJF
   /t4MFozkvF6W+lYCq88zVfBePAps2wfscLbJw8fp7fbvCRg2c3euoG9mS
   yGk/x15p0XWJw02WLdzoNiy361L0ndBUAHtKVDaV+INwTr6abDptrQw4j
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xvAVqrw5796G3OCcN2+VOcxrGRUHNxfhCz34zwzwxjrDmAOrV24bOzzAiwZTK/JwDrJQC8kSKL
 b3cOlNM1kCBddEjEOT5YFElQsOr+SNlWRtjy94hPMvknBEY3VOA68Xaof0tw4rToxUwRwNqnE+
 kgWXaoYTdyZjuA6JswVdkzPA2YFlzQJNiVB1oOaV+vURxGdwdVsy0/HttHoqXvDlYOmbhIPJ6b
 /bXV4ZN31Q35KGs9RLHx2JSmieYKHLhslDwtrIjrpYOiRfvQwAzicZusMXtbKwzf+RAFdHpedw
 7E4=
X-SBRS: 5.2
X-MesageID: 41999661
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:to1RQaxzHcAT1X2DQmtVKrPxve4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf9LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7LfEUtde7FutHNidbacQcLbiRXkzWmoBGJzPrBExae1goDSD8n+9kf2E
 XMjgCR3NTAj9iV0RnZvlWjiqh+uNyk8ddbAdzJt859EESQti+NRKBMH4KPpyo0pubH0idarP
 Dprw07N8p+r1P9F1vF2CfF4AXr3DYw53KK8zbx6hGC0K+JNw4SMMZPiZlUdRHU8SMbzalB+Z
 lGwn6DsN5vBQ7A9R6NmeTgbQ1glUa/vBMZ4IgupkFYOLFuDIN5nMg0+UNYF4o4ByTq6IwrO/
 kGNrCi2N9mNXyddHzXpW9p3ZiFWWkyBA6PRgw4ttWSyCU+pgE182IogOgk2lsQ/pM0TJdJo8
 zCL6RTjblLCusbd7h0CustSda+Y1a9DS7kASa3GxDKBasHM3XCp9rc+7Mu/tynf5QO0d8bhI
 nBeEkwjx9yR2veTem1mLFb+BHER2uwGR73zNtF2pR/srrgAJL2LCy4Tkw0mcfImYRQPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOIPvNIWXE+Pv9LrJoXmuvezSoeRGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH1PhE3aPv65YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gTdE
 t6K7X3r7OjqQCNjCP1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXmxOwn2dJFtaQ9nNGA
 BS43R7kJjHYKC49GQHMZaKI2iah3wcqDahVJEHgJCO4s/jZ9cfFZYpWKt4EC3RDBxrkQNWqG
 NOATV0BnP3J3fLs+GInZYUDObQe51XmwGwO/NZrnrZqAGhv801f2AaWDSvSMaTpg4rS1Nv9x
 lM2p5apIDFtSekKGM5juh9FFFXcmyYDIhLCxm/aJxOlqrmfxxxSmm2lSWX4itDClbCxgE3vC
 jMPCeUcfbEDh5mtndU3r3D3Xl0em+eFngAIkxSgMlYLyDrq3xz2eiEau6PyGOXcEIF2fxYGi
 rCeyEuLgRnwM2X2BaZlC2ZL2gvwowjM4XmffMeWoCW/knoBJyDlKkAEfMRwY1sM8r2tPQXFc
 2YYA2YIVrDepQU8j3QgkxgHiZ6qHMpy6y1nDLk6XW1x345D775Jk98S7QSPtGb6CzFSp+zoe
 BEpONwmdH1FGP7LuOi4+XwSRVoLxvIu264T+0ys/lvzOsPnYo2O6OeaCfC0XFM4Q43I8j1nn
 4PWagT2sGyBqZfO+gpPx9D9lUnlN6zPFImnwz/DOg5Z0wshRbgTqe0youNjbokGUuaogTsfX
 GZ7i1G5v/ANhHznoIyOuYVIW5MblI752kn1OSed5fIAAHvU+1Y5lK1Pjucd7BaIZL1U4k4n1
 Jf49uSmfWQeDe98AfMvSFjKqYLyl2Ze6qJcXSxMN8N1ce7N1SKirar58D2rA6fc0rGV20owa
 tfdUIRacxfjCIFl4Nf6Fn1dpDK
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41999661"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leVSzdzKg+/k1TfUcchRyq6I8D1GBtTb45XFuPenLEl0ImF0iiT7uhDR1gskvAh2AC1fG3UIfwzJ5+w/vsmnoOkjZnFIFKSWQsA533hLHfTCpXssiUrly1UUfJzhue0MIk6oOYTSnooGi8dyS1yOMMbFRWqhE34iiJgF0fhN2B/9i004ICauI4iYqQ/OHbup7FpXQHukSDgkYe9ZbxS5z4q2Q6sIDbov5QrZu7BroNAz0v5lZCTxvCkP/bCsycvlpLKMhyQfTNeQe8fzeSMCmUMi9Vv87n8MQ0PPXcFDLeq0sA80AZD8V6s9ZyV6Xu9Bc2cuTrA+0oGAdJZ5kQ0CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Oh6Ejuuy9Q003wull3FxYG4VCyEXr4pKVXqlTHZim8=;
 b=YQSX4/gHESIxpBxw2oxFs1MFWU9qNGfUQfKDkqBjbUNdJjOnSET8uSlwbqvK7yGs02cN9dnApwDEy8OQPKGCSM4cAK7azdt+y3SsSF+pmM0qjtTujy2Vr51SqGyhZAWV1sQmm70dTg8OudtQGbq8vc/dkysUpnWUfyLg1NvCviLYD0HKssuZPUnLlye68yvR8R4GlaYWVGdXIHucoKz7BeiNIFbK89vVPhAjVSKOab8pOWUp0IlVsp0J8+KU5t4JFZa9FrEq/Psx9q8xjy6bw68FaCXnlKCRZ3HX76sGOMh5BO7ZtUjDcJFBeBmVabInRKmAUVovgj6R2adjPKnuCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Oh6Ejuuy9Q003wull3FxYG4VCyEXr4pKVXqlTHZim8=;
 b=aBZqwO1wvhluSOI76c2c2FGgteFHhTATYubOsMh10hPDS0DHaUGIQ+b/e/cCUWa+2Jwc4wq7F3K4b1sFASxT4kS1Qy01wc2lSE24B/hejhWQGyK7MJU6raUmw69ojugvzCKNVWlUDPl6Txxq0rRuHCXW1IHuKhitAHfGcj0om8I=
Date: Tue, 20 Apr 2021 17:29:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: centralize / unify asm-offsets generation
Message-ID: <YH7zXpPz03+kLzEr@Air-de-Roger>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
X-ClientProxiedBy: AM6P192CA0084.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bf3e7ce-1a69-4f5b-dd95-08d904111d00
X-MS-TrafficTypeDiagnostic: DM5PR03MB3209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB320977B5619820FE8E1B878E8F489@DM5PR03MB3209.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnfNTulBoyfQ/aRPqgEqA6DvLlEiR3417jkq62ldLCX5QYkc+gh8V56LJ+wkC7r0fvRd9TWS7Nr/MjaXCivgrPDci2EhTVaIcZ8eNmejh/9ULUrnTKNTDhEl32PMlsS4HkbH+3PnWTLGW5fHWZGoSexnaPqeO0sESGOigP9tP/aL0qykYMWctgAZwsqK0IeiSDUpewJb9XXRJJhz48hhKfjRFOEFK404IjPJk1bNjAvsqJu7zlFEiJ5xXG1N8BjnoTw0lh2KpHzjO5ZZcS6KckFcCfdT1Y8CkWo7rkJQ28F8HXmqOt1ebiIyer6GrL0etX9AI9R5HmSDcMMTok0w2cpCjOn6GIxmgE3EnXc2B0fYkn/cHvzZKokbOtKXaF1hgMS893Md8Ft0rzTgI2h9y0XIO9AslBamwdFWMb8LB8GuW1nioWxVLhnwSaCc7MyVV2Q8dEWG9yU/RpJOycfs980Z4dygpkqGpx2t95U+B8qwapzspyRAiMgPYFC++O5UOH+hwtWZv4E6DCASNizrHSGBb8eHD1s0T7BHs2UjpLwiKUBKI4CZGE2UxOX/JKH+mSCAs0bOKQRN3fStmy6iF4e/xGueKTZN6ZvEUWaNsKP6EUZPk4K6/rRIVZgteUQIUpY2BJFNlsDviPEdnbu/YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(54906003)(4326008)(26005)(478600001)(186003)(6486002)(2906002)(6496006)(956004)(6666004)(86362001)(16526019)(83380400001)(38100700002)(85182001)(33716001)(66476007)(66946007)(9686003)(66556008)(316002)(8936002)(8676002)(6916009)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFlCb0t6QkMvUE9ha2tGcWluTVRLc0tSNWhOMTUwNWgxVjlNcHQ0elVtUEgv?=
 =?utf-8?B?alQ0bXRCRlpBaVlERjBwdkliODlRZzFwMGQxdzBzcXlWR2h2ek5LaWhHNVZa?=
 =?utf-8?B?aEUwWjRMMGdybDdsODRJeUJwa081WXlYTW04VnVxY3dXUksrMVFudmRONUVp?=
 =?utf-8?B?L00wYW9PNnI2VFNic0NaSVgxSk9INWdLemdQRFJKK3JxOXBQaXN3OHo1R0tm?=
 =?utf-8?B?MnFXMDlEeDFZd0taY2RQaXBuT3NWZGxIbnhoMEMxOE8vSm1qWU1mSzRlSnJE?=
 =?utf-8?B?VjYxMVBHZDNhZlNsY0pzVGE1TFVlenFEVjFhMkVuRldPTWlGV21FRlNvUDB6?=
 =?utf-8?B?Qk9PZWY1cVFNOHlOQlJPa1AyQThHajlwYXF5UkFtSTlKbGovNmM0QkUrNjRr?=
 =?utf-8?B?a0k0REp1YmFhYzdLTEVnbnVkMmtVbjhWL1ZTWmZtaUtBeWh6aFJnVDVTQXZa?=
 =?utf-8?B?YnpEREI3Z2ovRjVoRkVVdFU3WHYydm52dDJWMG5kdC93OXNOdENQc0N6NlE5?=
 =?utf-8?B?NGRtZFd0eG5MUmUwVzgrRXI2L1FBTzdlY29VanI0c2tWdmpodHlYZk5TOGUw?=
 =?utf-8?B?KzVVY0RQbGljY1BNNGp3cUE4YUxxV1JQdld2UnlHWVB5TXNwdVZqTmNXQVJV?=
 =?utf-8?B?dXQ3UjZMQUZ4UitsV0ltY3BucDJrZmtSNVZreitmSDllcjFpT3lvR2tmVWw0?=
 =?utf-8?B?K0lxN1hoRk9aQ0lFVWVHTlNVOGp5T1RxRWcyMlhtem1lMDNodFFQb3VXbmdL?=
 =?utf-8?B?cTFGaU1JNk9jSHgzYjJlRGVEZUxBelVaTWVhbzZXMTY1MGU5ZHRYNmZsc0Zx?=
 =?utf-8?B?cXhRRzBLc2hQQU5ieU1JVW1OQ2tnN2IrbE9IV1dwb2NwWXFSZDRqT1JYWTlB?=
 =?utf-8?B?U0c4Wkg5WERTL3dxUXVQYW9JRnVuOVR5N3ZqbTZXWVZHUmNiclFxc1J5UDAx?=
 =?utf-8?B?SEVVV3NEOFRISWo3QTdGU0VlR0pxSExYVTg4bGprNUFKQ3A4RHRMZ29lU2Zo?=
 =?utf-8?B?aFprZXhvN1dXek5IMlJMcXZDc1ZDdmJTeWNQSFZ0RVAxRTNhamN5RXljcUxK?=
 =?utf-8?B?dHYrNWFZT0tEeEZCU1NiVmhHNmUxTEpLTjlLVXM3VjdETEZIY2tjRVRRRUsv?=
 =?utf-8?B?K2FLQnk3Tm5xNUxVVlR3Z2hqakM3SHpFR1o1MHF2Ty9wWGJyS3ZKQXBOU0lH?=
 =?utf-8?B?Sk45S1ZKMGp3TSs0UVMxWEJrVENCOUtlY3Azb29jMEwxSmlITXpKZVJKT2w0?=
 =?utf-8?B?RC93TWRHSmI4d0wyM1NlWktoV2FYNnZ2VWtPQ29HSVlvMmZUNmMxUXh2NTRh?=
 =?utf-8?B?VkNSMVQ4SkI4enowZXlLaDNmZ1FtY1VMQjNqUmxTcFRMSDVwdGxuc3ViTEFa?=
 =?utf-8?B?TzI4SzlLN0tMd3JlOEUxd0xTVndRaVN2OVlzYzJxdUdCdDIxMFhlakw5VjNQ?=
 =?utf-8?B?U3NyZXVHTWo2cVRteGJXUGFnN1hDd205em9TR09OZ0c5NUZoUUNIMXhUVWth?=
 =?utf-8?B?UVVyNXlwSldoSFhZcHFMcGwwR0hYL2hnSklESERobTdGTWM0K0tIdEhGN3FU?=
 =?utf-8?B?TzFyOUlaeHFZclVZc1lxb0N4NHU3RXRsemRvSWNLcTkybUN3OGVsODl3VGZs?=
 =?utf-8?B?aEE3WnRGTHdHUHR1clBOeXFKYjEvYnZwRjU5eGh0NmtVOGdLd0Y3SXI1aWZV?=
 =?utf-8?B?TXNXbmJOYldvNFZJdnduaG15dm9HWGlDVGZ4VFpZYjZEUUdaNC9kTHV6WHdJ?=
 =?utf-8?Q?angu9RRi+2bqlAkxvLYq55AMWjv1rn0ClOJJbTF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf3e7ce-1a69-4f5b-dd95-08d904111d00
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 15:29:39.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWdgC06ilbo7rJrSklRYvdRUccFEy2oyCwSW6DOGyGDB2G8v51BQGKCL09w++M8fMYj+dYF6HJyjL/hTtHqeUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3209
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 10:33:47AM +0200, Jan Beulich wrote:
> Except for an additional prereq Arm and x86 have the same needs here,
> and Arm can also benefit from the recent x86 side improvement. Recurse
> into arch/*/ only for a phony include target (doing nothing on Arm),
> and handle asm-offsets itself entirely locally to xen/Makefile.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/.gitignore
> +++ b/.gitignore
> @@ -318,7 +318,6 @@
>  xen/arch/x86/efi/check.efi
>  xen/arch/x86/efi/mkreloc
>  xen/arch/*/xen.lds
> -xen/arch/*/asm-offsets.s
>  xen/arch/*/efi/boot.c
>  xen/arch/*/efi/compat.c
>  xen/arch/*/efi/ebmalloc.c
> @@ -325,6 +324,7 @@
>  xen/arch/*/efi/efi.h
>  xen/arch/*/efi/pe.c
>  xen/arch/*/efi/runtime.c
> +xen/asm-offsets.s
>  xen/common/config_data.S
>  xen/common/config.gz
>  xen/include/headers*.chk
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -341,7 +341,7 @@ _clean: delete-unfresh-files
>  	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
>  		-o -name "*.gcno" -o -name ".*.cmd" \) -exec rm -f {} \;
>  	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
> -	rm -f include/asm-*/asm-offsets.h
> +	rm -f asm-offsets.s include/asm-*/asm-offsets.h
>  	rm -f .banner
>  
>  .PHONY: _distclean
> @@ -362,7 +362,7 @@ $(TARGET): delete-unfresh-files
>  		done; \
>  		true
>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
> -	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) asm-offsets.s
> +	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
>  	$(MAKE) -f $(BASEDIR)/Rules.mk include/asm-$(TARGET_ARCH)/asm-offsets.h
>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
>  
> @@ -399,7 +399,11 @@ include/xen/compile.h: include/xen/compi
>  	@sed -rf tools/process-banner.sed < .banner >> $@.new
>  	@mv -f $@.new $@
>  
> -include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
> +asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
> +	$(call move-if-changed,$@.new,$@)

Won't it be more natural to keep the .s file in arch/$(TARGET_ARCH)?

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD057CA33
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 14:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372666.604520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEUu0-0001wr-Bs; Thu, 21 Jul 2022 12:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372666.604520; Thu, 21 Jul 2022 12:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEUu0-0001un-8q; Thu, 21 Jul 2022 12:03:36 +0000
Received: by outflank-mailman (input) for mailman id 372666;
 Thu, 21 Jul 2022 12:03:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CZbT=X2=citrix.com=prvs=1940a87fc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oEUtz-0001uh-1S
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 12:03:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23083679-08ed-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 14:03:32 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2022 08:03:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5936.namprd03.prod.outlook.com (2603:10b6:a03:2ad::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 12:03:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 12:03:26 +0000
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
X-Inumbo-ID: 23083679-08ed-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658405012;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9/cjYmO/D1diyqQ8GoCBUNEW51CV5dQxoRAoxdm4Nzw=;
  b=STGHFOS0WPD+808yRn9Wn3UkfyfHoK0WLL8c7YwwLeqHHWCL6oOkOQNT
   XIAZUjCSOusHWmQLdvyRXjFwsXlTjgZo2zyJnd6JE/6H1nmAt9wZAbA2D
   Lcbd5soKnaBq8UwEiWlSE+jWiL+F1aU4XulOyTTmKvqjkVQBjJLppBttu
   0=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 76314507
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AcTqf/aj0wY8wjccTmUTmSLhSX17brhtd9AX2u?=
 =?us-ascii?q?qucmGbUl+iq8fl2rXO55VgNIJqpwNvMcIhBfowPmyaELMbgpxAz4Z0DIjQGv?=
 =?us-ascii?q?GHJHw9w6sG5E6HsI59d/cAl1IlCGqY0IN+FiyMOPMzc9/c3kGwiUAlQ/2SET?=
 =?us-ascii?q?SlpCJbWUTfNIoM37fyZCv0qPlgWkyhpMZfwnKlbIX/hKW5nn5/SGswrcx0nV?=
 =?us-ascii?q?p5wg6HjCDgX6hE1asp+FZYH8ZAibf6uNsx6EgCKReZSC+iUgs822bDaATSXo?=
 =?us-ascii?q?WKcoOg5J7iEefC4seGDVSEzsilStLxGiVVRrCVM3tUkNTjvbLgvbLq8Rs0ye?=
 =?us-ascii?q?FJUhWf5extkdZVx2qFnX/6s2wUTTeAiaRZ8uDXPfkWKjakt8e9mUPL6v2lEL?=
 =?us-ascii?q?quV+wP93xtvhFnMkL2B6Hw70qxXo3mcTrE2aWObDBYh0PTY/ak3c769AzTb/?=
 =?us-ascii?q?MVJB3SxcCinhx0M2ScBhS2NSIfwGRr9upSMzFTq8NyJ+Eokx6zDRuVtzJB8x?=
 =?us-ascii?q?DhcpKePuY57ubdun8AIEdCEwpHKkcYFyHtrviRLLg46r3LNQo7LMulELKROO?=
 =?us-ascii?q?bAhXtz5rMb1mD1/A/w3J9Bb4cCFlptax0ZlROIS9la5LsTIBqDD3qD/YbAoZ?=
 =?us-ascii?q?my2+HK8iGv3FMzti+PC5rjfrCdwpNBIxdKJoZlqQenn0o7CiflEWesRxG3rb?=
 =?us-ascii?q?yrtF8XUU2dIwQ/6jArc59HF0EY2zb+mF6nXEIWcrqy9r6uMdUE41NWsXyZ1z?=
 =?us-ascii?q?eHNtKmzJg7NUwy+BBLqTIrM8F3D+rMx6DDzD+WR+iDxUH0PjCqrrjLpg0w5Z?=
 =?us-ascii?q?idqtidgNmW7KXBC/94/Gr1eGd3slZ9gzuhbHnwU1apUGA5Cx5aBcwhsnj5dL?=
 =?us-ascii?q?wLhkRX5oK2QEoZ+yWifP0m+i8biT0AJyGQKZL6n9xXUM/zm0hCtm00m8FDk3?=
 =?us-ascii?q?kUG1RfZPoHcEOr9oCJWoh8903rztvezdHRuLV1FTQGapw06JZRyWs3vYf+WW?=
 =?us-ascii?q?7Krrj1AUujmSwiuZASMEL8iEmUkw5fEVJimip0o/GFGW0Yh758yC/P/0rij9?=
 =?us-ascii?q?6IAyi3fNjF7ugQEiwoq3suCrk0CvGgFNFiXEE3k+XrRYLlnR8HsUJ+LawTFm?=
 =?us-ascii?q?Wjpn/JTqdpoGKw+uhFeJSB2M4cfGo/i53OATTRsWpcVpzu2Ampl9k+AhswN/?=
 =?us-ascii?q?B7nJeDeqeWXtovjUmyL6n2uiA9VD8rfbrPHZm8wB/8Ddi0EETpXIBqm3qbCn?=
 =?us-ascii?q?Pe1t2vOhSpT4vl0JljQykbF9JJ/yE4+sYIIb0baL+Exrm1GVRRqUPHNIWvhm?=
 =?us-ascii?q?Xu2R6YzGsas9Nb4i+A/Z6YBY9ASraH8YssKdNjHiC4YFw9hLuz0iMDgGmOZE?=
 =?us-ascii?q?d6lFAudDlmes6AArFnNs5hkTZwa3tlYnaLKcLke5IEwPuvTMfuccaat2xJmC?=
 =?us-ascii?q?1xGK9f5pnuQ6TWPnrNeFgFkcGI49CgqRof8UqLPrpifTyNiArdGtQ5zN6kyC?=
 =?us-ascii?q?uCY5FoBINgyrS3x/+eTn52n2tgbtbbSm+Ski1lwD0J4nuNfr68oZeIpQxIS8?=
 =?us-ascii?q?9qiWoJkYJt2Gy/uLf/vma6ahAp++n8Cph69gevGAmm/RT8xkDDDS2dVhQ6c5?=
 =?us-ascii?q?w5A/wurJmfsGmk7eqfvAD3XlqmhJEgI822YBhm9q6v+nXO/oaOnttplzvinW?=
 =?us-ascii?q?DZpzErctosacCe+g7/XY0qbEkx1EJAA15nST6lw2FVisIRIRLv7yzp+c9nvY?=
 =?us-ascii?q?iXhq7E9vURIaIjrlHZeM5MvEeXiO396qzoymH3dxgPUNumlSWmigysetzDLq?=
 =?us-ascii?q?8mCVzrJX4VE25I1IqfW0KMlDlfiWOJ6QbKlZd/R76ZQeFJ7tRzlcNVaG5D9M?=
 =?us-ascii?q?sKPBskETuWqBSvR+uMw4nQg/3Jz/qR+tTTKgF7zgz8SggcLS7hl7RdW67qHG?=
 =?us-ascii?q?gNLPFVFCS7thK9fFStAMGhmQs453aPgsU3w8SN7V1EaBvtlEYobPqkkBTEO9?=
 =?us-ascii?q?qW0uwQ89tnzvGfMmfBeOwJrGc6ZZvnVqlbRCH2V3S1Q+qYV/OtlDixLj0j5O?=
 =?us-ascii?q?WXFWz4U6IhWsXmDKGaA5QpmYxCF5TmX5/I2A8ni6TFLZ/FKBlfjWuR0lRLNO?=
 =?us-ascii?q?zDGdta/TP4NggyV0lNpmN525zRmZrDQ5Y7MeELZLgSCKdW+dZPDzVVKkCSTy?=
 =?us-ascii?q?2ELBRJoKej1yGBKuTgR9qsL7gw6o94+uys0wkX0GaEzHg30Aju9C1F+M4maf?=
 =?us-ascii?q?rrGHSKvC8NjbdZvuQSMv7xDyD3CG/vJvivg4D8MoJiQKDRi/xRmJL0zQU7ss?=
 =?us-ascii?q?SOUv+oz/2Qkthu3nTsonJgxRS6sGUHxlZ079u9oo0qTyafjHikbHA/AZDK1z?=
 =?us-ascii?q?zC0Yes0nSNxacghkQLlYeHmJMEVApFgueCQRtBqmUtzSG8BpKy18On35WAEY?=
 =?us-ascii?q?xg1NjZmIIWpL93Xp/aHAYEjbrknRPM5ICChhPWOJ4JVVMBG3qw7ym+YwBt3X?=
 =?us-ascii?q?33vwax/VvtFz5rQm50VReI1u7HwVo6oOOOPCqcgz97VqwT13dr0OCs4oOZXj?=
 =?us-ascii?q?lp8yyK595ktS+Z23IRHztjAl83J5Z5mw6yzRxz4OuQZ94uTvkuz8S4VH4WSr?=
 =?us-ascii?q?VPPme7ZqDI1kim1JlX7CjEYTgf8U5W/vzIO4E7H2+zc6NY+yYWHpJmRqsSmV?=
 =?us-ascii?q?Y9Kta+frX9fbIkB0SX3KqFiTA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.92,289,1650945600"; 
   d="scan'208";a="76314507"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUFInXPNVKnFZs82GbF3/6xKsQTDZmB+BBSZEPrmvR0+DKWwuh32CpSCmTlzWm923ArvD0x0MXEnjfarG1fec2nFhHKnMpLYXmSlSWG8TlLGXp1EzspAeGYCb5CoLgvD3vFhFmgka2FWlEi5AqobVkq8dGb97DYOr43ijmM7oG66b16r7xYrKi1PR8plik3gsSTOPVIL7abycMM2mo9ZIOfyZmwwWe1ksrehu9tR06dThtEEVYsDBTqjDeCye4ViPcZMDZ8ltIjRwC4tKhZ9pFCFY5iRU6QK5onViDVZe6vCC1oLdxo62JusAJzbClublPcDagEJnbfVJ/FjXUuCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/cjYmO/D1diyqQ8GoCBUNEW51CV5dQxoRAoxdm4Nzw=;
 b=bQ45y7TZqDo9vT1FDehaqekIXqZlG/jfJB4j+pPTuE4scbzaR8OByyI9DgVy5LHVqb3GqocMhTe/mzQMWJ9NhI0RqYiY1HemdhAx6nRj7kB6ZLCDF4+nnld3+kxvTKBbRyM6SFYT4FUj+EsHI6opS6WvBakOMsGdgBNyYP+/jF1bxMNibr6cPw1iNKbncfiQ6TlMjD7lYki2pu4FIhq9INJrWdO0537S+aNOaZepWW4SoB/gJhhUtfqXGfzReZpyn0v1QWimJZzmh6EeB4Pot1hpKIYkE8/l0osmnKE6v9ZD2+VOOir3UeYspVIWjo7FplG+BXoDJF8z9oVSvlTLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/cjYmO/D1diyqQ8GoCBUNEW51CV5dQxoRAoxdm4Nzw=;
 b=VuQh3ciR5czuHxt9Rnn9xxI0ZQUxGMTCB5Po2HJ40gOVGuo2YG5PEYPfmHYRXFd/WkHYW6NY5SgP579URRdyTzdgcF3eDgJePUtFki/K5LOUmgeFM0bYv81vmk5XbUE7/yGq2W8FB2W9DCxq5TkdGAz9LPaTj3FVz8QOVjGFEwo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, George Dunlap
	<George.Dunlap@citrix.com>
Subject: Re: [PATCH v2] x86/mem_sharing: support forks with active vPMU state
Thread-Topic: [PATCH v2] x86/mem_sharing: support forks with active vPMU state
Thread-Index: AQHYnGkyeHzLfYftlkqMXoeeKAYG062IuvCA
Date: Thu, 21 Jul 2022 12:03:26 +0000
Message-ID: <cb26974c-2eb1-d27b-9de2-cbd3b501cb62@citrix.com>
References:
 <a8a66208064c209e65c08380c59bc6aeff5f57f8.1658340502.git.tamas.lengyel@intel.com>
In-Reply-To:
 <a8a66208064c209e65c08380c59bc6aeff5f57f8.1658340502.git.tamas.lengyel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06b2422b-b64f-4526-d897-08da6b1104a2
x-ms-traffictypediagnostic: SJ0PR03MB5936:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eTaToG8o1B57L0ubQ+u8vu1weQOjdOo3kSSamDMp3g1GopDxrtA3YPnhz5c64TMEy9vest1QKVS3yJ6ZhQmJSpM1SgGa/UypaxF+n7uWnmSZHjvOMMdb9M3sOKEMX0ItAWs6At0U/f/Tk9zBU87vdf76I1aChfHQtNHxJJt0Gg0p6N6s2NG9aIBVSiPnwizPo5X1BSiyCDdUUZWWvIT/Vd5y+4UeLpoaVOw8kogrLy+38OLJ4J0aFuHhor7DQKjpgRrWKSd7yldFiR82ap54eLbwNSN5X+hH4P7rg756NZlYPTIwhKHoTlKqy18SKFSkWinQ3H4AWY7oCYz+cD9W2G2jevNADidvfqJsJqR403CDKk5/1qiLIjob3KmU0WKM+aSX1FO95GjSfikB2FUt3qgdp4GiAlXiIojjQ5+rGQZgVPN8yh4U820RW4rui4qPEwFZti0xQH0l1s50eOW7B+r5YR1vimNYIWmsq9iapYrb1P29ixerrd1LSIfLr2CUzFnz7JTrWaARjreZusNWwUb9kL+W7XL9xbfFB/CPQyHUdk56yCc3txKbwIh9MQR0vaiAdeJ/1zyOfDxcftT9U+j/n7AYjXs13TBPTN9sTf55hC+3Fza0GJ93gz6DRwxDek1SRk1tut+R3M6diXB+6QjhAtn42cda2U8q3hsgT59u1hjBPkvZW/qu+MDmqyDugeoBnHGm3eZu2rkkUmzgyu6HDQD8RAcphKVZU/Yp17PvhP6AHoe5hfpunPsx8uAsiV3wI56DM0NU6JojYvbYv9A3c/ekMpLKHjgzgYcRm0zmVVFOVRWVnsMtTJo0kWUsTyDgb1XlbpSP6Nti0DdgmTsWENHGvYrV/UCF5FV+jO6Veupt75Seapk6Z92TSSa/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(31686004)(2616005)(110136005)(186003)(107886003)(86362001)(26005)(38070700005)(38100700002)(6506007)(54906003)(31696002)(6512007)(53546011)(41300700001)(66476007)(2906002)(66446008)(91956017)(76116006)(66946007)(4326008)(36756003)(478600001)(71200400001)(5660300002)(82960400001)(316002)(122000001)(8676002)(66556008)(6486002)(8936002)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SENSRlBXS3pMaDNPeDVOcFVRaW90bTZtVHJFUVlGM1Nvd2VzZVdTVEUxN09N?=
 =?utf-8?B?b2ZSdGZzL1JFV2sxWEhabTlxWVdOZWRxbVBNSTVOZmdoQzZBZGN0SGxmR3BZ?=
 =?utf-8?B?SDlIWXJrcVFlUVBybmpJVjlDYlJFTER4a20yUnZVYTVlc1pvTFhwMGZ5cnFS?=
 =?utf-8?B?ZmFWZUsrYkp4ZDNBdGNmcXBBZmtoaVI0WDB3S3NPV24yRGxIWUt4WWVxZFJu?=
 =?utf-8?B?enpYM0Q1dEtRckNyVldrbGVkYTlrVTBWaDl5bnk0VkhyTDhCY1Z2V2FoazZw?=
 =?utf-8?B?MGovZ0I2QnBMWWFJb0Y5ZXNnZjhoWGw5ZnZ6dHRDQ1hwRFhMNlBJZFpoUkU4?=
 =?utf-8?B?S1V0dzI0eXExdTZnbXBpNC93a2ZBVkUveWdJYkNZRS9tM2J6VXdYUUtYU1Bk?=
 =?utf-8?B?NjdaRWJCZWRqTmloVVNVMXJzdWlPY0NmQVlVbkI1RVQ2VFZGRWJkTjBHdk44?=
 =?utf-8?B?QldjdkFKdFhmMmREY2JWclYxTitoZEsxVzRaanpxNkxkUDkxQWk0YXk5ZVFT?=
 =?utf-8?B?aFQ4cGVtWWtWNjBsTjFJOWpxZ3Y1bWFGQ3NoTU1Lb0RtSmk5cXNaZmN3WVAy?=
 =?utf-8?B?ckFsY2hiZVlrWWo1V0x2MWowaGlNSTZ0cVlSM0h1VmxSSW5IakMvUTBSaUZU?=
 =?utf-8?B?ek9iNVNCbm9jdFdqZzlaSm1CbDlsZDhkeHJYL3kyMGo2MVpUN0h6dk93MWhH?=
 =?utf-8?B?VVVkdWRwWHpjTy9GTEpFNHpDdXZ2UlQ3UEdZK2poUXQzYmdjSm5TRVBTVFJJ?=
 =?utf-8?B?Y3ZZbnV1V2tpSU94ZDlMZE4yWGltaU1PSzlWeW1OOVRJcndySGh5TE5KYm1E?=
 =?utf-8?B?SGdnOXZMNlRKYkI5OVIrcXNaVnBNMDZud1BGSGhheWFzV0RxT2RYVlhZeEkw?=
 =?utf-8?B?S2NLemkwemhROFpoajBORS9tTmNWM0xoYUdFUG5TR2tqUWZQK3dWSnJUcVNi?=
 =?utf-8?B?bEozeHpMTWtINXVvdkl0UHJUNnN0RUlCRTFsNyt6Y0NBRk1hREgvOThNTXl4?=
 =?utf-8?B?OFZ3MmZCOUxWTDlEVFNvcTZObVFUTnJhZ0lxTWZqajZXdnRPK0R3WDhkVnlN?=
 =?utf-8?B?M1RueExLbDJJMzFUeDN5N0JvRmxTaTNYSUh2aW10WUVreUNxMFl2c0xOS0Zu?=
 =?utf-8?B?T050cktjZVRjVnpXaW5sc05zWDgvM08rb08wRDRNc3JzN005K2t6MkNodUlX?=
 =?utf-8?B?NVF3WG5iWWZOekxBZGZTeEk3UHpIeUkvcmhUbFNraEY5aWtlSFBOZU5BQmEr?=
 =?utf-8?B?clR5aEZXWHYyL0RhTEJrWFo2eUVHaWNGVnRleTZOdGg0Vnd1TFdMSG45RzJp?=
 =?utf-8?B?eWxNYndUcmtjMWtwQm9qMVFETDZsSFBlcEg2bDdVQit1V00wVHBKbWRNeGNr?=
 =?utf-8?B?RFdMcG85d0w2VEVLWElBNk03bEtzNUwxYldFQWlHLzBwWUdNeXd6Qlgvc2Vm?=
 =?utf-8?B?cjNTbWtjbEJ2SlkvbTFZNkdkUmZIc0lueW11Y1hvR0hPQTFJRmJWb3ZOc0My?=
 =?utf-8?B?NE5aaEVNNlBzbE5xUlVaMzhHUy9QVWhkbzlWNHlpRGcyeXNDcW1mSVdTZUxN?=
 =?utf-8?B?VWQ1YkRVSXY4T2U0Rml6czkvTzNLUWtWOTlIY3N4UVROZk1DT1NqTFdTNHA3?=
 =?utf-8?B?SEowMmwvMmhUS25RSmNRVHFTeTBpaFd0Q1lzSXlobC95TDNXL05kdmxkMXpR?=
 =?utf-8?B?YlREV2R6TFlDNWFmVWJWNVdZcUtsWU04TXpyTmF1N09DaTk3L1FIYzkrRHJK?=
 =?utf-8?B?eDBSc1d4TzY3RmVYT2FLOVpVbFBHNmtkZEZDNVlBd0R1OFlTK2NFSVZRZEpQ?=
 =?utf-8?B?aXdrS3JUZzQ5T2ovZmQzQ3B2c0lJTVhtVmpFTUl6emlWZmZVTWRmTUV3M2dT?=
 =?utf-8?B?S0RjNGtqRUYzVXFJeFR6WFMzbWMzaVVlN04rU2xxNFljT2V1TDZNVE9iNmJZ?=
 =?utf-8?B?NVY1U1pOd1dOSmFTMU9QMkZBazdRNjhrRFFGZjVXRFBpcmxOcnMxNnd0Q3NV?=
 =?utf-8?B?VlZvWVpZdnZNTXJhZjZTTmVpT2lJOFNGbFJtVGxqK2xlSlh4bXovd3VyVVJM?=
 =?utf-8?B?TmlZaDZvaHBPbWUvSENhRksyVlZCWjllOEFCc2pxN1hqV2pWSnVDUjd0MGtU?=
 =?utf-8?Q?XgSGUmN+1RPoPQ+8+5AgmsAp3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AAE41FB181C7146A82A408A655B87B1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b2422b-b64f-4526-d897-08da6b1104a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 12:03:26.2587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuLO7xG55ixqHgPnS4mZe5vFtM7SonHrF8sPy4S6s3URyrvo0OIB6blY7GOl7RDoobNX38hkhIFF8G25OM6CiiswmACnWHrJsTTkm0rbbzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5936

T24gMjAvMDcvMjAyMiAxOTo0NywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2NwdS92cG11X2FtZC5jIGIveGVuL2FyY2gveDg2L2NwdS92cG11X2Ft
ZC5jDQo+IGluZGV4IDliYWNjMDJlYzEuLjRjNzZlMjQ1NTEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9jcHUvdnBtdV9hbWQuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1k
LmMNCj4gQEAgLTUxOCw2ICs1MTgsMTQgQEAgc3RhdGljIGludCBjZl9jaGVjayBzdm1fdnBtdV9p
bml0aWFsaXNlKHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiAgDQo+
ICsjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HDQo+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGFtZF9h
bGxvY2F0ZV9jb250ZXh0KHN0cnVjdCB2Y3B1ICp2KQ0KPiArew0KPiArICAgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOw0KDQpXaGF0IG1ha2VzIHRoaXMgdW5yZWFjaGFibGU/DQoNCkkga25vdyBub25l
IG9mIHRoaXMgaXMgdGVzdGVkIG9uIEFNRCwgYnV0IGl0IGlzIGluIHByaW5jaXBsZSByZWFjaGFi
bGUgSQ0KdGhpbmsuDQoNCkknZCBqdXN0IGxlYXZlIHRoaXMgYXMgcmV0dXJuIDAuwqAgSXQgd2ls
bCBiZSBzbGlnaHRseSBsZXNzIHJ1ZGUgdG8NCndob21ldmVyIGFkZHMgZm9ya2luZyBzdXBwb3J0
IG9uIEFNRC4NCg0KPiArICAgIHJldHVybiAwOw0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYXJjaF92cG11X29wcyBfX2luaXRjb25zdF9jZl9jbG9iYmVyIGFt
ZF92cG11X29wcyA9IHsNCj4gICAgICAuaW5pdGlhbGlzZSA9IHN2bV92cG11X2luaXRpYWxpc2Us
DQo+ICAgICAgLmRvX3dybXNyID0gYW1kX3ZwbXVfZG9fd3Jtc3IsDQo+IEBAIC01MjcsNiArNTM1
LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXJjaF92cG11X29wcyBfX2luaXRjb25zdF9jZl9j
bG9iYmVyIGFtZF92cG11X29wcyA9IHsNCj4gICAgICAuYXJjaF92cG11X3NhdmUgPSBhbWRfdnBt
dV9zYXZlLA0KPiAgICAgIC5hcmNoX3ZwbXVfbG9hZCA9IGFtZF92cG11X2xvYWQsDQo+ICAgICAg
LmFyY2hfdnBtdV9kdW1wID0gYW1kX3ZwbXVfZHVtcCwNCj4gKw0KPiArI2lmZGVmIENPTkZJR19N
RU1fU0hBUklORw0KPiArICAgIC5hbGxvY2F0ZV9jb250ZXh0ID0gYW1kX2FsbG9jYXRlX2NvbnRl
eHQNCg0KVHJhaWxpbmcgY29tbWEgcGxlYXNlLCBhbmQgaW4gdGhlIEludGVsIHN0cnVjdHVyZS4N
Cg0KPiArI2VuZGlmDQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFyY2hfdnBt
dV9vcHMgKl9faW5pdCBjb21tb25faW5pdCh2b2lkKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2NwdS92cG11X2ludGVsLmMgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50ZWwuYw0KPiBp
bmRleCA4NjEyZjQ2OTczLi4wMWQ0Mjk2NDg1IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYv
Y3B1L3ZwbXVfaW50ZWwuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50ZWwuYw0K
PiBAQCAtMjgyLDEwICsyODIsMTcgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fY29yZTJfdnBtdV9z
YXZlKHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgIGZvciAoIGkgPSAwOyBpIDwgZml4ZWRfcG1jX2Nu
dDsgaSsrICkNCj4gICAgICAgICAgcmRtc3JsKE1TUl9DT1JFX1BFUkZfRklYRURfQ1RSMCArIGks
IGZpeGVkX2NvdW50ZXJzW2ldKTsNCj4gICAgICBmb3IgKCBpID0gMDsgaSA8IGFyY2hfcG1jX2Nu
dDsgaSsrICkNCj4gKyAgICB7DQo+ICAgICAgICAgIHJkbXNybChNU1JfSUEzMl9QRVJGQ1RSMCAr
IGksIHhlbl9wbXVfY250cl9wYWlyW2ldLmNvdW50ZXIpOw0KPiArICAgICAgICByZG1zcmwoTVNS
X1A2X0VWTlRTRUwoaSksIHhlbl9wbXVfY250cl9wYWlyW2ldLmNvbnRyb2wpOw0KPiArICAgIH0N
Cj4gIA0KPiAgICAgIGlmICggIWlzX2h2bV92Y3B1KHYpICkNCj4gICAgICAgICAgcmRtc3JsKE1T
Ul9DT1JFX1BFUkZfR0xPQkFMX1NUQVRVUywgY29yZTJfdnBtdV9jeHQtPmdsb2JhbF9zdGF0dXMp
Ow0KPiArICAgIC8qIFNhdmUgTVNSIHRvIHByaXZhdGUgY29udGV4dCB0byBtYWtlIGl0IGZvcmst
ZnJpZW5kbHkgKi8NCj4gKyAgICBlbHNlIGlmICggbWVtX3NoYXJpbmdfZW5hYmxlZCh2LT5kb21h
aW4pICkNCj4gKyAgICAgICAgdm14X3JlYWRfZ3Vlc3RfbXNyKHYsIE1TUl9DT1JFX1BFUkZfR0xP
QkFMX0NUUkwsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAmY29yZTJfdnBtdV9jeHQt
Pmdsb2JhbF9jdHJsKTsNCg0KL3NpZ2guwqAgU28gd2UncmUgYWxzbyBub3QgdXNpbmcgdGhlIFZN
Q1MgcGVyZiBjb250cm9scyBlaXRoZXIuDQoNClRoYXQgd2FudHMgZml4aW5nIHRvbywgYnV0IGlz
bid0IGEgdGFzayBmb3Igbm93Lg0KDQpFdmVyeXRoaW5nIGVsc2UgTEdUTS4NCg0KfkFuZHJldw0K

